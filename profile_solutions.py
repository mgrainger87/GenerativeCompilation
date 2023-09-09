import sys
import os
import compilation
import testing
import csv

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
	
	success, testing_error, total_cpu_time = testing.run_test_from_csv(test_data_path, executable_path, iterations, False)
	if not success:
		print("Testing failed:", testing_error)
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


def handle_problem_directory(problem_directory_path, test_driver_source_path):
	results_csv_path = os.path.join(problem_directory_path, 'performance_results.csv')
	
	if os.path.exists(results_csv_path):
		print(f"Already have profiling results for {problem_directory_path}.")
		return

	print(f"Working on problem in directory {problem_directory_path}…")
	
	codePath = os.path.join(problem_directory_path, "compilation_unit.c")
	
	# Compile the driver
	driverObjectPath = "/Users/morgang/code/GenerativeCompilation/test_driver.o"
	success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
	if not success:
		print(errorMessage)
		return
		
	testDataPath = os.path.join(problem_directory_path, "test_data.csv")
		
	generatedDirectoryPath = os.path.join(problem_directory_path, "generated")
	if not os.path.exists(generatedDirectoryPath):
		print("Solutions have not been generated.")
		return

	# List all files in the generated directory and filter for .asm files
	asm_files = [f for f in os.listdir(generatedDirectoryPath) if f.endswith('.asm')]
		
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
		
		for filename, cpu_time in cpu_times_dict.items():
			normalized_cpu_time = cpu_time / unoptimized_cpu_time
			
			csvwriter.writerow([filename, cpu_time, normalized_cpu_time])
			
def contains_asm_files(directory):
	"""Check if the directory contains .asm files."""
	for root, dirs, files in os.walk(directory):
		for file in files:
			if file.endswith('.asm'):
				return True
	return False

if __name__ == "__main__":
	# Check if the user has provided a command-line argument
	if len(sys.argv) < 2:
		print("Please provide the folder path as a command-line argument.")
		sys.exit(1)

	folder_path = sys.argv[1]

	# Check if the given folder path exists
	if os.path.exists(folder_path):
		# Iterate through the directories and subdirectories in the folder
		for root, dirs, _ in os.walk(folder_path):
			for dir in dirs:
				dir_path = os.path.join(root, dir)
				
				# If the directory contains .asm files, call handle_problem_directory
				if contains_asm_files(dir_path):
					handle_problem_directory(dir_path, "/Users/morgang/code/GenerativeCompilation/test_driver.c")
	else:
		print("The provided folder path does not exist.")
