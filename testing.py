import csv
import subprocess

# def run_test_from_csv(csv_path, executable_path, overriddenIterations=None):
# 	failure_text = ""
# 	
# 	with open(csv_path, 'r') as csvfile:
# 		reader = csv.DictReader(csvfile)
# 		
# 		for row in reader:
# 			# Construct the command using the row values
# 			iterations = overriddenIterations
# 			if iterations is None:
# 				iterations = row['iterations']
# 			
# 			cmd = [
# 				executable_path,
# 				f"int1={row['int1']}",
# 				f"int2={row['int2']}",
# 				f"double1={row['double1']}",
# 				f"double2={row['double2']}",
# 				f"expectedInt={row['expectedInt']}",
# 				f"expectedDouble={row['expectedDouble']}",
# 				f"iterations={iterations}"
# 			]
# 			
# 			result = subprocess.run(cmd, capture_output=True, text=True)
# 			if result.returncode != 0:
# 				failure_text += result.stdout  # Append the output for debugging
# 				failure_text += " ".join(cmd)
# 				return False, failure_text  # Test failed
# 			
# 	return True, ""  # All tests passed

import csv
import subprocess
import resource

def run_test_from_csv(csv_path, executable_path, overriddenIterations=None):
	failure_text = ""
	total_cpu_time = 0.0  # Track the total CPU time
	
	with open(csv_path, 'r') as csvfile:
		reader = csv.DictReader(csvfile)
		
		for row in reader:
			# Construct the command using the row values
			iterations = overriddenIterations
			if iterations is None:
				iterations = row['iterations']
			
			cmd = [
				executable_path,
				f"int1={row['int1']}",
				f"int2={row['int2']}",
				f"double1={row['double1']}",
				f"double2={row['double2']}",
				f"expectedInt={row['expectedInt']}",
				f"expectedDouble={row['expectedDouble']}",
				f"iterations={iterations}"
			]
			
			# Get initial CPU time
			start_cpu_time = resource.getrusage(resource.RUSAGE_CHILDREN).ru_utime
			
			result = subprocess.run(cmd, capture_output=True, text=True)
			
			# Get the CPU time after the process and compute the difference
			end_cpu_time = resource.getrusage(resource.RUSAGE_CHILDREN).ru_utime
			total_cpu_time += end_cpu_time - start_cpu_time
			
			if result.returncode != 0:
				failure_text += result.stdout  # Append the output for debugging
				failure_text += " ".join(cmd)
				return False, failure_text, total_cpu_time  # Test failed
			
	return True, "", total_cpu_time  # All tests passed
