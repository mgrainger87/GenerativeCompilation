import os
import tempfile
import subprocess
import csv
import sys
import pathlib
import compilation

COMPILATION_UNIT_FILE_NAME = "compilation_unit.c"

ASSEMBLY_GUIDELINES = """
- Follow the arm64 calling convention strictly. Write out which registers are used for which parameters before generating the assembly.
- Preserve the values of callee-saved registers where necessary.
- Mangle function names according to Clang conventions for C (not C++).
- Align functions appropriately for arm64.
- When using the bl (Branch with Link) instruction to make a function call, preserve lr beforehand. Do not preserve lr if not necessary."""

def generation_prompt(compilation_unit):
	return f"""Generate arm64 assembly for macOS that corresponds to the C compilation unit below. Follow these guidelines:
	
{ASSEMBLY_GUIDELINES}

Output the assembly as it would be written in a .s file. Do not generate stubs or placeholders for forward declarations or anything that is not in the compilation unit itself.

Compilation unit:
	
{compilation_unit}
"""

def optimization_prompt(compilation_unit, unoptimized_assembly):
	return f"""Optimize the provided arm64 assembly that corresponds to the provided C compilation unit.

{ASSEMBLY_GUIDELINES}

Compilation unit:

```
{compilation_unit}
```
Assembly:
{unoptimized_assembly}
"""


def prompt_llm(prompt):
	print(prompt)
	lines = []
	try:
		while True:
			line = input()
			lines.append(line)
	except EOFError:
		pass
		
		
	return "\n".join(lines)

def prompt_llm_based_on_results(initial_prompt, compilerError, linkerError, testingError):
	prompt = initial_prompt
	if compilerError is not None:
		prompt=f"Unfortunately, I got a compilation error:\n{compilerError}\n Fix the error. Remember: {ASSEMBLY_GUIDELINES}"
	elif linkerError is not None:
		prompt=f"Unfortunately, I got a linker error:\n{linkerError}\n Fix the error. Remember: {ASSEMBLY_GUIDELINES}"
	elif testingError is not None:
		prompt=f"Unfortunately, I got an incorrect result when testing the generated code:\n{testingError}\n Fix the error. Remember: {ASSEMBLY_GUIDELINES}"

	return prompt_llm(prompt)

def run_test_from_csv(csv_path, executable_path):
	failure_text = ""
	
	with open(csv_path, 'r') as csvfile:
		reader = csv.DictReader(csvfile)
		
		for row in reader:
			# Construct the command using the row values
			cmd = [
				executable_path,
				f"int1={row['int1']}",
				f"int2={row['int2']}",
				f"double1={row['double1']}",
				f"double2={row['double2']}",
				f"str1={row['str1']}",
				f"str2={row['str2']}",
				f"expectedInt={row['expectedInt']}",
				f"expectedDouble={row['expectedDouble']}",
				f"expectedString={row['expectedString']}",
				f"iterations={row['iterations']}"
			]
			
			result = subprocess.run(cmd, capture_output=True, text=True)
			if result.returncode != 0:
				failure_text += result.stdout  # Append the output for debugging
				failure_text += " ".join(cmd)
				return False, failure_text  # Test failed
			
	return True, ""  # All tests passed

def compile_and_test_assembly(assembly, driver_object_path, test_data_path, output_path):
	# Returns: Success, Compiler error, linker error, testing error
	
	compiler_error = None
	linker_error = None
	testing_error = None

	### Compilation stage
	print(f"Attempting compilation…")	
			
	success, compiler_error, compilation_unit_path = compilation.compile_source_from_string(assembly, suffix=".asm")
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
	
	success, testing_error = run_test_from_csv(test_data_path, executable_path)
	if not success:
		print("Testing failed:", testing_error)
		return False, compiler_error, linker_error, testing_error
	
	print("Testing succeeded.")
	return True, compiler_error, linker_error, testing_error

def generate_assembly_from_compilation_unit_source(code_path, driver_object_path, test_data_path, output_path):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()
		
		compiler_error = None
		linker_error = None
		testing_error = None
		assembly = None
		
		while True:
			assembly = prompt_llm_based_on_results(generation_prompt(code), compiler_error, linker_error, testing_error)
			
			success, compiler_error, linker_error, testing_error = compile_and_test_assembly(assembly, driver_object_path, test_data_path, output_path)
			if not success:
				continue
			
			with open(output_path, 'w') as f:
				f.write(assembly)
				f.write("\n")
			print("Assembly written to ", output_path)
			break

def optimize_assembly(compilation_unit_path, assembly_path, driver_object_path, test_data_path, output_path, hint=None):
	with open(compilation_unit_path, "r") as compilationUnitFile, open(assembly_path, "r") as assemblyFile:
		compilation_unit = compilationUnitFile.read()
		unoptimized_assembly = assemblyFile.read()
		prompt = optimization_prompt(compilation_unit, unoptimized_assembly)
	
	compiler_error = None
	linker_error = None
	testing_error = None
	assembly = None
	
	while True:
		assembly = prompt_llm_based_on_results(prompt, compiler_error, linker_error, testing_error)
		
		success, compiler_error, linker_error, testing_error = compile_and_test_assembly(assembly, driver_object_path, test_data_path, output_path)
		if not success:
			continue
		
		with open(output_path, 'w') as f:
			f.write(assembly)
			f.write("\n")
		print("Optimized assembly written to ", output_path)
		break
	

def handle_problem_directory(problem_directory_path, test_driver_source_path):
	print(f"Working on problem in directory {problem_directory_path}…")
	
	codePath = os.path.join(problem_directory_path, COMPILATION_UNIT_FILE_NAME)
	
	# Compile the driver
	driverObjectPath = "/Users/morgang/code/GenerativeCompilation/test_driver.o"
	success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
	if not success:
		print(errorMessage)
		return

	testDataPath = os.path.join(problem_directory_path, "test_data.csv")
	
	generatedDirectoryPath = os.path.join(problem_directory_path, "generated")
	pathlib.Path(generatedDirectoryPath).mkdir(parents=True, exist_ok=True)
	
	# Have Clang generate unoptimized and optimized assembly for comparison purposes.
	unoptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_unoptimized.asm")
	success, error, _ = compilation.compile_source(codePath, unoptimizedClangAssemblyPath, True)
	if not success:
		print(f"Failed to compile source from {codePath}: {error}")

	o3OptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_O3_optimized.asm")
	success, error, _ = compilation.compile_source(codePath, o3OptimizedClangAssemblyPath, True, "O3")
	if not success:
		print(f"Failed to compile source from {codePath}: {error}")

	# Test the Clang assembly to make sure it passes our test cases
	with open(unoptimizedClangAssemblyPath, "r") as assemblyFile:
		assembly = assemblyFile.read()
	success, compiler_error, linker_error, testing_error = compile_and_test_assembly(assembly, driverObjectPath, testDataPath, None)
	if not success:
		print(f"Testing on Clang-generated assembly failed: {compiler_error} {linker_error} {testing_error}")

	
	# Have LLM generate assembly from C compilation unit
	generatedAssemblyPath = os.path.join(generatedDirectoryPath, "llm_generated.asm")
	if os.path.exists(generatedAssemblyPath):
		print(f"Already have output for {generatedAssemblyPath}.")
	else:
		generate_assembly_from_compilation_unit_source(codePath, driverObjectPath, testDataPath, generatedAssemblyPath)
	
	# Have LLM optimize Clang-generated assembly	
	optimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_llm_optimized.asm")
	if os.path.exists(optimizedClangAssemblyPath):
		print(f"Already have output for {optimizedClangAssemblyPath}.")
	else:
		optimize_assembly(codePath, unoptimizedClangAssemblyPath, driverObjectPath, testDataPath, optimizedClangAssemblyPath)
	


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
