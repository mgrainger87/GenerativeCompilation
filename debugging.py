import lldb
import signal
import os

def terminate_debugged_process(pid):
	"""Send a signal to terminate the specified process."""
	os.kill(pid, signal.SIGTERM)

def handle_exception_or_crash(process):	
	description = ""

	# Detailed information about the thread that caused the crash
	for thread in process:
		if thread.GetStopReason() == lldb.eStopReasonException:
			description += f"Crash detected on thread {thread.GetIndexID()}:\n"
			# description += f"Thread name: {thread.GetName()}\n"
			# description += f"Thread queue: {thread.GetQueueName()}\n"
			
			# Get the values of the registers at the time of the crash
			description += "Registers:\n"
			for register in thread.GetFrameAtIndex(0).GetRegisters():
				for child_register in register:
					if child_register.IsValid():
						description += f"{child_register.GetName()} = {child_register.GetValue()}\n"
			
			# Get a backtrace of the thread
			description += "Backtrace:\n"
			for frame in thread.frames:
				description += str(frame) + "\n"
				
			description += f"Thread {thread.GetIndexID()} Stop Reason: {thread.GetStopDescription(1000)}\n"
	
	return False, description


def launch_process_with_debugging(binary_path, args=[], max_cpu_time=2147483647):
	# Initialize the debugger
	debugger = lldb.SBDebugger.Create()
	debugger.SetAsync(True)
	
	# Create a target from a file and arch
	target = debugger.CreateTarget(binary_path)
	if not target:
		return False, f"Failed to create target for {binary_path}"

	# Set up launch info
	launch_info = lldb.SBLaunchInfo(args)
	
	# Launch the process using launch info.
	listener = debugger.GetListener()
	error = lldb.SBError()
	process = target.Launch(launch_info, error)
	if not error.Success():
		return False, f"Error launching process: {error.GetCString()}"

	# Set the timer
	def alarm_handler(signum, frame):
		terminate_debugged_process(process.GetProcessID())
		raise SystemExit("Time limit reached")

	signal.signal(signal.SIGALRM, alarm_handler)
	signal.alarm(max_cpu_time)

	accumulated_stdout = ""
	accumulated_stderr = ""
	
	# Main event handling loop
	event = lldb.SBEvent()
	try:
		while True:
			if listener.WaitForEvent(1, event) and lldb.SBProcess.EventIsProcessEvent(event):
				state = lldb.SBProcess.GetStateFromEvent(event)
				if state == lldb.eStateExited:
					# Accumulate any last stdout or stderr messages
					stdout = process.GetSTDOUT(1000)
					while stdout:
						accumulated_stdout += stdout
						stdout = process.GetSTDOUT(1000)

					stderr = process.GetSTDERR(1000)
					while stderr:
						accumulated_stderr += stderr
						stderr = process.GetSTDERR(1000)
					
					exit_status = process.GetExitStatus()
					if exit_status != 0:
						signal.alarm(0)
						return False, accumulated_stdout + accumulated_stderr
					else:
						break
				
				elif state == lldb.eStateCrashed:
					return handle_exception_or_crash(process)
			if lldb.SBProcess.EventIsProcessEvent(event):
					state = lldb.SBProcess.GetStateFromEvent(event)
					if state == lldb.eStateExited:
						print(f"Process exited with status: {process.GetExitStatus()}")
						break
					elif state == lldb.eStateStopped:
						num_threads = process.GetNumThreads()
						for i in range(num_threads):
							thread = process.GetThreadAtIndex(i)
							if thread.GetStopReason() == lldb.eStopReasonException:
								signal.alarm(0)
								return handle_exception_or_crash(process)
					elif state == lldb.eStateRunning:
						continue

	except SystemExit as e:
		return False, f"CPU time limit reached: {max_cpu_time}s"

	# Disable the alarm at the end
	signal.alarm(0)
	
	# Accumulate stdout and stderr
	stdout = process.GetSTDOUT(1000)
	while stdout:
		accumulated_stdout += stdout
		stdout = process.GetSTDOUT(1000)
	
	stderr = process.GetSTDERR(1000)
	while stderr:
		accumulated_stderr += stderr
		stderr = process.GetSTDERR(1000)
		
	# Cleanup
	lldb.SBDebugger.Destroy(debugger)
	return True, None

if __name__ == "__main__":
	# /var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmpc_9fa7ke int1=-8380145903517306281 int2=2966023455710716866 double1=inf double2=inf expectedInt=0 expectedDouble=nan iterations=100
	
	arguments = [
		"int1=-8380145903517306281",
		"int2=2966023455710716866",
		"double1=inf",
		"double2=inf",
		"expectedInt=0",
		"expectedDouble=nan",
		"iterations=100"
	]
	
	success, description = launch_process_with_debugging("/var/folders/nj/t3fv98pd0kldbblbczs56jfh0000gn/T/tmp2c97v10w", arguments, 10)

	print("Success:", success)
	print("Description:", description)
