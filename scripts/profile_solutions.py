import sys
import os
import compilation
import testing
import csv
from run_context import ModelContext
import pandas as pd

def test_individual_assembly(driver_object_path, assembly_path, test_data_path, iterations=None):
	success, compiler_error, compilation_unit_path = compilation.compile_source(assembly_path)
	if not success:
		print(f"Compilation failed: {compiler_error}")
		return False, 0
	
	print(f"Compilation successful. Output saved to {compilation_unit_path}.")
		
	### Link stage
	print(f"Linking against {driver_object_path}…")
	
	success, linker_error, executable_path = compilation.link_binary([compilation_unit_path, driver_object_path])
	if not success:
		print(f"Linking failed: {linker_error}")
		return False, 0
	
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
	
def get_errors_from_assembly(path_to_assembly):
	# Extract errors from the file into a dictionary
	def get_errors_dict_for_assembly(path):
		errors_dict = {}
		
		with open(path, 'r') as file:
			first_line = file.readline().strip()
			
			# Check if it starts with //
			if first_line.startswith('//'):
				# Remove the starting '//' and split the string by comma
				items = first_line[2:].split(',')
				
				for item in items:
					key, value = item.split('=')
					errors_dict[key] = int(value)
		
		return errors_dict
	
	# Extract individual error values from the dictionary
	errors_dict = get_errors_dict_for_assembly(path_to_assembly)
	compiler_errors = errors_dict.get('compiler_errors', 0)
	linker_errors = errors_dict.get('linker_errors', 0)
	execution_errors = errors_dict.get('execution_errors', 0)
	correctness_errors = errors_dict.get('correctness_errors', 0)
	
	return compiler_errors, linker_errors, execution_errors, correctness_errors

def profile_run(run_context, test_driver_source_path):
	results_csv_path = run_context.profilingResultsPath()
	
	if os.path.exists(results_csv_path):
		print(f"Already have profiling results for {run_context} at {results_csv_path}.")
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
		csvwriter.writerow(['Filename', 'CPU Time', 'Normalized CPU Time', 'Compiler Errors', 'Linker Errors', 'Execution Errors', 'Correctness Errors'])  # Writing the headers
		
		unoptimized_cpu_time = cpu_times_dict['clang_generated_unoptimized.asm']
		
		for filename, cpu_time in cpu_times_dict.items():
			normalized_cpu_time = cpu_time / unoptimized_cpu_time
			compiler_errors, linker_errors, execution_errors, correctness_errors = get_errors_from_assembly(os.path.join(run_context.generatedPath(), filename))
			
			csvwriter.writerow([filename, cpu_time, normalized_cpu_time, compiler_errors, linker_errors, execution_errors, correctness_errors])
			
def average_cpu_times(input_files, output_file):
	# Initialize an empty list to hold all dataframes
	dfs = []
	
	# Read each file into a dataframe and append to the list
	for file in input_files:
		df = pd.read_csv(file)
		dfs.append(df)
	
	if len(dfs) > 0:
		# Concatenate all dataframes
		combined_df = pd.concat(dfs)
		
		# Group by 'Filename' and calculate the mean for numeric columns
		averaged_df = combined_df.groupby('Filename').mean().reset_index()
		
		# Save the result to the specified output file
		averaged_df.to_csv(output_file, index=False)



if __name__ == "__main__":
	# Check if the user has provided a command-line argument
	if len(sys.argv) < 2:
		print("Please provide the folder path as a command-line argument.")
		sys.exit(1)

	folder_path = sys.argv[1]

	# Check if the given folder path exists
	if os.path.exists(folder_path):
		for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
			for problemContext in modelContext.GetProblemContexts():
				profilingResultsPaths = []
	
				for runContext in problemContext.GetExistingRunContexts():
					if not os.path.exists(runContext.profilingResultsPath()):
						profile_run(runContext, "/Users/morgang/code/GenerativeCompilation/test_driver.c")
						profilingResultsPaths.append(runContext.profilingResultsPath())
					
				average_cpu_times(profilingResultsPaths, problemContext.profilingResultsPath())
	else:
		print("The provided folder path does not exist.")
