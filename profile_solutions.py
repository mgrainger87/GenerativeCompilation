import sys
import os
import compilation
import testing
import csv
from run_context import RunContext, ProblemContext

def test_individual_assembly(driver_object_path, assembly_path, test_data_path, iterations=None):
	success, compiler_error, compilation_unit_path = compilation.compile_source(assembly_path)
	if not success:
		print(f"Compilation failed: {compiler_error}")
		return False, compiler_error, linker_error, testing_error
	
	print(f"Compilation successful. Output saved to {compilation_unit_path}.")
		
	### Link stage
	print(f"Linking against {driver_object_path}…")
	
	success, linker_error, executable_path = compilation.link_binary([compilation_unit_path, driver_object_path])
	if not success:
		print(f"Linking failed: {linker_error}")
		return False, compiler_error, linker_error, testing_error
	
	print("Linking succeeded.")
	
	### Testing stage
	print("Testing…")
	
	# Set executable permissions
	os.chmod(executable_path, 0o755)
	
	success, execution_error, correctness_error, total_cpu_time = testing.run_test_from_csv(test_data_path, executable_path, iterations, False)
	if not success:
		print(f"Testing failed: {execution_error}, {correctness_error}")
		return False, 0
	else:
		print(f"Testing of {assembly_path} succeeded with CPU time {total_cpu_time}")
		return True, total_cpu_time

def test_assembly_files(generatedDirectoryPath, asm_files, driverObjectPath, testDataPath, iterations):
	# Dictionary to store CPU times
	cpu_times_dict = {}
	
	# Iterate through asm_files
	for filename in asm_files:
		if filename in cpu_times_dict:
			continue
		fullAssemblyPath = os.path.join(generatedDirectoryPath, filename)
		print(f"Testing {filename}…")
		# test_individual_assembly returns a tuple (success, cpu_time)
		success, cpu_time = test_individual_assembly(driverObjectPath, fullAssemblyPath, testDataPath, iterations)
		
		if success:
			cpu_times_dict[filename] = cpu_time
			
	return cpu_times_dict


def profile_run(run_context, test_driver_source_path):
	results_csv_path = run_context.profilingResultsPath()
	
	if os.path.exists(results_csv_path):
		print(f"Already have profiling results for {run_context}.")
		return

	print(f"Working on {run_context}…")
	
	codePath = run_context.compilationUnitPath()
	
	# Compile the driver
	success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
	if not success:
		print(errorMessage)
		return
		
	testDataPath = run_context.testDataPath()
		
	generatedDirectoryPath = run_context.generatedPath()
	if not os.path.exists(generatedDirectoryPath):
		print(f"Solutions have not been generated in {generatedDirectoryPath}.")
		return

	# List all files in the generated directory and filter for .asm files
	asm_files = [f for f in os.listdir(generatedDirectoryPath) if f.endswith('.asm')]
	print(f"Assembly files in {generatedDirectoryPath}: {asm_files}")
		
	iterations = 1
	max_cpu_time = 0
	
	print("Determining iterations…")
	while max_cpu_time < 1:
		iterations *= 10
		print(f"Trying {iterations} iterations…")
		cpu_times_dict = test_assembly_files(generatedDirectoryPath, asm_files, driverObjectPath, testDataPath, iterations)
		max_cpu_time = max(cpu_times_dict.values())
	print(f"Using {iterations} iterations.")
	
	# Create or open a CSV file for writing the results
	with open(results_csv_path, 'w', newline='') as csvfile:
		csvwriter = csv.writer(csvfile)
		csvwriter.writerow(['Filename', 'CPU Time', 'Normalized CPU Time'])  # Writing the headers
		
		unoptimized_cpu_time = cpu_times_dict['clang_generated_unoptimized.asm']
		
		for filename, cpu_time in cpu_times_dict.items():
			normalized_cpu_time = cpu_time / unoptimized_cpu_time
			
			csvwriter.writerow([filename, cpu_time, normalized_cpu_time])
			
def average_cpu_times(input_files, output_file):
	# Data structures to store CPU Times and sample counts
	data = {}
	samples_count = {}
	
	# Read each file and populate the data
	for file in input_files:
		with open(file, 'r') as f:
			reader = csv.reader(f)
			next(reader)  # skip header row
			for row in reader:
				filename = row[0]
				cpu_time = float(row[1])
				if filename not in data:
					data[filename] = []
					samples_count[filename] = 0
				data[filename].append(cpu_time)
				samples_count[filename] += 1
	
	# Calculate the average CPU Times
	avg_times = {}
	for filename, times in data.items():
		avg_times[filename] = sum(times) / len(times)
	
	# Calculate the normalized CPU Times
	max_time = max(avg_times.values())
	normalized_times = {filename: time / max_time for filename, time in avg_times.items()}
	
	# Write the results to the output CSV file
	with open(output_file, 'w', newline='') as f:
		writer = csv.writer(f)
		writer.writerow(['Filename', 'CPU Time', 'Normalized CPU Time', 'Samples'])
		for filename in avg_times:
			writer.writerow([filename, avg_times[filename], normalized_times[filename], samples_count[filename]])

	return output_file

if __name__ == "__main__":
	# Check if the user has provided a command-line argument
	if len(sys.argv) < 2:
		print("Please provide the folder path as a command-line argument.")
		sys.exit(1)

	folder_path = sys.argv[1]

	# Check if the given folder path exists
	if os.path.exists(folder_path):
		problem_contexts = ProblemContext.ProblemContextsForDirectory(folder_path)
		
		for problemContext in problem_contexts:
			profilingResultsPaths = []

			for runContext in problemContext.GetRunContexts():
				profile_run(runContext, "/Users/morgang/code/GenerativeCompilation/test_driver.c")
				profilingResultsPaths.append(runContext.profilingResultsPath())
				
			average_cpu_times(profilingResultsPaths, problemContext.profilingResultsPath())
	else:
		print("The provided folder path does not exist.")
