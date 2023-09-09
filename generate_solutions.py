import os
import tempfile
import subprocess
import csv
import sys
import pathlib
import compilation
import testing
import query_llm

COMPILATION_UNIT_FILE_NAME = "compilation_unit.c"

ASSEMBLY_GUIDELINES = """
- Follow the arm64 calling convention strictly. Write out which registers are used for which parameters before generating the assembly.
- Preserve the values of caller-saved and/or callee-saved registers where necessary.
- Mangle function names according to Clang conventions for C (not C++).
- Align functions appropriately for arm64.
- Follow arm64 convention for local labels starting with a numeric value, which makes them assembler-local.
- Before branching for a function call, be sure to save all required registers.
- Use only valid arm64 instructions. ARM64 assembly does not allow direct floating-point literals with the fadd instruction.
- Use appropriate register widths for an LP64 architecture, where integers are 32 bits.
"""

def test_data_prompt(compilation_unit):
	return f"""For the C function “customFunction” below, generate 10 test cases that exercise its functionality.
	
Write a Python version of customFunction and use it to determine the expected outputs for your test cases. Your test function should perform division in the same way as C, using integer division if necessary. Your Python function should mirror the C code as much as possible; do not optimize.

Output those test cases in comma-separated value format according to the given format. The number of iterations should always be 100. Do not write the CSV to a file; output it directly. Include a header row in the CSV.


If an input or output parameter is not relevant, use 0 for its provided or expected value as appropriate.

CSV format (do not add extra spaces):

int1,int2,double1,double2,expectedInt,expectedDouble,iterations

Function:
{compilation_unit}

- All of the integer values should be output in a format that can be read by the C atoi() function.
- All of the double values should be written in a format that preserves precision as much as possible and can be read by the C atof() function.
- Do not use input values less than -1000 or greater than 1000. Do not generate random values. Input values should not be fractional.
- If possible, the test cases should be chosen such that, if the function is not optimized during compilation, some values will cause poor performance.

"""

def generation_prompt(compilation_unit):
	return f"""Generate arm64 LP64 assembly for macOS that corresponds to the C compilation unit below. Follow these guidelines:

{ASSEMBLY_GUIDELINES}

Output the assembly as it would be written in a .s file. Do not generate stubs or placeholders for forward declarations or anything that is not in the compilation unit itself. If there is more than one function in the compilation unit, generate assembly for each function separately.

After generating the assembly, check it again against the guidelines and correct it if needed. Trace the assembly with different test values that collectively exercise all of the control paths.

Compilation unit:
	
{compilation_unit}
"""

def optimization_prompt(compilation_unit, unoptimized_assembly):
	return f"""Optimize the provided arm64 assembly that corresponds to the provided C compilation unit.

Compilation unit:

```
{compilation_unit}
```
Assembly:
{unoptimized_assembly}

Guidelines:

{ASSEMBLY_GUIDELINES}

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

def prompt_llm_based_on_results(querier, initial_prompt, compilerError, linkerError, testingError):
	prompt = initial_prompt
	if compilerError is not None:
		prompt=f"Unfortunately, I got a compilation error:\n{compilerError}\n Fix the error. Remember: {ASSEMBLY_GUIDELINES}"
	elif linkerError is not None:
		prompt=f"Unfortunately, I got a linker error:\n{linkerError}\n Fix the error. After fixing the error, print out the corrected assembly. Go it through it line by line, asking this question for each line: is this valid arm64 assembly for macOS? Also examine the program as a whole to identify errors or incompatibilities."
	elif testingError is not None:
		prompt=f"Unfortunately, I got an incorrect result when testing the generated code:\n{testingError}\nTrace through the optimized assembly with these inputs to find the problem. If, at any time, you find an error, correct the assembly, print out the new assembly, and then trace again starting at the beginning."

	#return prompt_llm(prompt)
	return querier.predict(prompt)

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
	
	success, testing_error, cpu_time = testing.run_test_from_csv(test_data_path, executable_path)
	if not success:
		print("Testing failed:", testing_error)
		return False, compiler_error, linker_error, testing_error
	
	print(f"Testing succeeded in {cpu_time} seconds.")
	return True, compiler_error, linker_error, testing_error

def generate_test_data_from_compilation_unit_source(code_path, test_data_path):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()

	test_data = query_llm.LLMQuerier().predict(test_data_prompt(code)).strip().rstrip()
	
	with open(test_data_path, 'w') as f:
		f.write(test_data)
		f.write("\n")
	

def generate_assembly_from_compilation_unit_source(code_path, driver_object_path, test_data_path, output_path):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()
		
		compiler_error = None
		linker_error = None
		testing_error = None
		assembly = None
		
		querier = query_llm.LLMQuerier()
		
		while True:
			assembly = prompt_llm_based_on_results(querier, generation_prompt(code), compiler_error, linker_error, testing_error)
			
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
	
	# Compile the driver if needed
	driverObjectPath = "/Users/morgang/code/GenerativeCompilation/test_driver.o"
	if not os.path.exists(driverObjectPath):
		success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
		if not success:
			print(errorMessage)
			return

	# Generate test data if necessary
	testDataPath = os.path.join(problem_directory_path, "test_data.csv")
	if os.path.exists(testDataPath):
		print(f"Already have test data at {testDataPath}.")
	else:
		generate_test_data_from_compilation_unit_source(codePath, testDataPath)
	
	generatedDirectoryPath = os.path.join(problem_directory_path, "generated")
	pathlib.Path(generatedDirectoryPath).mkdir(parents=True, exist_ok=True)
	
	# Have Clang generate unoptimized and optimized assembly for comparison purposes if necessary.
	unoptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_unoptimized.asm")
	if not os.path.exists(unoptimizedClangAssemblyPath):
		success, error, _ = compilation.compile_source(codePath, unoptimizedClangAssemblyPath, True)
		if not success:
			print(f"Failed to compile source from {codePath}: {error}")

	o1OptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_O1_optimized.asm")
	if not os.path.exists(o1OptimizedClangAssemblyPath):
		success, error, _ = compilation.compile_source(codePath, o1OptimizedClangAssemblyPath, True, "O1")
		if not success:
			print(f"Failed to compile source from {codePath}: {error}")

	o2OptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_O2_optimized.asm")
	if not os.path.exists(o2OptimizedClangAssemblyPath):
		success, error, _ = compilation.compile_source(codePath, o2OptimizedClangAssemblyPath, True, "O2")
		if not success:
			print(f"Failed to compile source from {codePath}: {error}")

	o3OptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_O3_optimized.asm")
	if not os.path.exists(o3OptimizedClangAssemblyPath):
		success, error, _ = compilation.compile_source(codePath, o3OptimizedClangAssemblyPath, True, "O3")
		if not success:
			print(f"Failed to compile source from {codePath}: {error}")

	# Test the Clang assembly to make sure it passes our test cases
	with open(unoptimizedClangAssemblyPath, "r") as assemblyFile:
		assembly = assemblyFile.read()
	success, compiler_error, linker_error, testing_error = compile_and_test_assembly(assembly, driverObjectPath, testDataPath, None)
	if not success:
		print(f"Testing on Clang-generated assembly failed: {compiler_error} {linker_error} {testing_error}")
		if testing_error is not None:
			os.remove(testDataPath)
		return
	
	# Have LLM generate assembly from C compilation unit
	generatedAssemblyPath = os.path.join(generatedDirectoryPath, "llm_generated.asm")
	if os.path.exists(generatedAssemblyPath):
		print(f"Already have generated assembly at {generatedAssemblyPath}.")
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
