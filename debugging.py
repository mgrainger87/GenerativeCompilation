import lldb
import signal
import os

def terminate_debugged_process(pid):
	"""Send a signal to terminate the specified process."""
	os.kill(pid, signal.SIGTERM)
	
def get_full_process_state(process, args):	
	description = ""
	
	# Get the command-line arguments of the target
	description += f"Command-line Arguments: {args}\n"
	
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
			
			description += f"Thread {thread.GetIndexID()} Stop Reason: {thread.GetStopDescription(1000)}\n"
	
		# Get a backtrace of the thread
		description += f"Thread {thread.GetThreadID()} Backtrace:\n"
		for frame in thread.frames:
			description += str(frame) + "\n"

	return description

def full_error_text(process, args, specific_error):
	return f"When executing the assembly you provided with the input values below, {specific_error}. Examine the stack trace below and compare each value in register state to find errors. If needed, trace through the generated assembly line-by-line with the provided input values. Fix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the provided input values to make sure it executes successfully and returns the correct answer. \n\n{get_full_process_state(process, args)}"

def launch_process_with_debugging(binary_path, args=[], max_cpu_time=2147483647):
	debugger = lldb.SBDebugger.Create()
	debugger.SetAsync(True)
	target = debugger.CreateTarget(binary_path)
	if not target:
		return False, f"Failed to create target for {binary_path}", None
	
	launch_info = lldb.SBLaunchInfo(args)
	listener = debugger.GetListener()
	error = lldb.SBError()
	process = target.Launch(launch_info, error)
	if not error.Success():
		return False, f"Error launching process: {error.GetCString()}", None
	
	max_cpu_time_hit = False
	
	def alarm_handler(signum, frame):
		nonlocal max_cpu_time_hit
		max_cpu_time_hit = True
		process.Stop()
		raise SystemExit(f"Time limit reached\n\n")
	
	signal.signal(signal.SIGALRM, alarm_handler)
	signal.alarm(max_cpu_time)
	
	accumulated_stdout = ""
	accumulated_stderr = ""
	
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
					print(f"Exit status: {exit_status}")
					signal.alarm(0)
					if exit_status != 0:
						return False, None, accumulated_stdout + accumulated_stderr
					else:
						return True, None, accumulated_stdout + accumulated_stderr
				elif state == lldb.eStateCrashed:
					signal.alarm(0)
					return False, full_error_text(process, args, "the program crashed"), None
				elif state == lldb.eStateStopped:
					if max_cpu_time_hit:
						signal.alarm(0)
						return False, full_error_text(process, args, "the program ran forever"), None
						
					num_threads = process.GetNumThreads()
					for i in range(num_threads):
						thread = process.GetThreadAtIndex(i)
						if thread.GetStopReason() == lldb.eStopReasonException:
							signal.alarm(0)
							return False, full_error_text(process, args, "the program crashed"), None

							return False, get_full_process_state(process, args), None

	
	except SystemExit as e:
		return False, full_error_text(process, args, "the program ran forever"), None

	
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
	return True, None, None

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
