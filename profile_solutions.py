import sys
import os
import compilation
import testing

def test_individual_assembly(driver_object_path, assembly_path, test_data_path):
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
	
	success, testing_error, total_cpu_time = testing.run_test_from_csv(test_data_path, executable_path, 10000000)
	if not success:
		print("Testing failed:", testing_error)
		return False, compiler_error, linker_error, testing_error
	else:
		print(f"Testing of {assembly_path} succeeded with CPU time {total_cpu_time}")


def handle_problem_directory(problem_directory_path, test_driver_source_path):
	print(f"Working on problem in directory {problem_directory_path}…")
	
	codePath = os.path.join(problem_directory_path, "compilation_unit.c")
	
	# Compile the driver
	driverObjectPath = "/Users/morgang/code/GenerativeCompilation/test_driver.o"
	success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
	if not success:
		print(errorMessage)
		return
		
	
		
	testDataPath = os.path.join(problem_directory_path, "test_data.csv")
		
	# if os.path.exists(testDataPath):
	generatedDirectoryPath = os.path.join(problem_directory_path, "generated")
	for filename in ["clang_generated_unoptimized.asm", "clang_generated_O3_optimized.asm", "llm_generated.asm", "clang_generated_llm_optimized.asm"]:
		fullAssemblyPath = os.path.join(generatedDirectoryPath, filename)

		test_individual_assembly(driverObjectPath, fullAssemblyPath, testDataPath)


if __name__ == "__main__":
	# Check if the user has provided a command-line argument
	if len(sys.argv) < 2:
		print("Please provide the folder path as a command-line argument.")
		sys.exit(1)
	
	folder_path = sys.argv[1]
	
	# Check if the given folder path exists
	if os.path.exists(folder_path):
		# Iterate through the items in the folder
		for item in os.listdir(folder_path):
			item_path = os.path.join(folder_path, item)
			# If the item is a directory (subfolder), print its path
			if os.path.isdir(item_path):
				handle_problem_directory(item_path, "/Users/morgang/code/GenerativeCompilation/test_driver.c")
	else:
		print("The provided folder path does not exist.")
