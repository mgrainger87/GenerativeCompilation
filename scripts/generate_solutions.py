import os
import tempfile
import subprocess
import csv
import sys
import pathlib
import compilation
import testing
from run_context import ModelContext, ProblemContext, RunContext
import prompting
import query_human

COMPILATION_UNIT_FILE_NAME = "compilation_unit.c"

def generate_test_data_from_compilation_unit_source(code_path, test_data_path):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()

	test_data = query_human.HumanQuerier().generateAssembly(prompting.test_data_prompt(code)).strip().rstrip()
	
	with open(test_data_path, 'w') as f:
		f.write(test_data)
		f.write("\n")

def has_file_with_prefix(directory_path, prefix):
	"""
	Check if a directory has any file with a given prefix.
	
	:param directory_path: Path to the directory.
	:param prefix: The file prefix to look for.
	:return: True if a file with the prefix exists, False otherwise.
	"""
	
	for filename in os.listdir(directory_path):
		if filename.startswith(prefix):
			return True
	return False
			
def handle_problem_run(run_context, test_driver_source_path, optimizations_per_solution=1):
	print(f"Performing problem run {run_context}…")
	
	codePath = run_context.compilationUnitPath()
	
	# Compile the driver if needed
	driverObjectPath = "/Users/morgang/code/GenerativeCompilation/test_driver.o"
	if not os.path.exists(driverObjectPath):
		success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path, driverObjectPath)
		if not success:
			print(errorMessage)
			return

	# Generate test data if necessary
	testDataPath = run_context.testDataPath()
	if os.path.exists(testDataPath):
		print(f"Already have test data at {testDataPath}.")
	else:
		generate_test_data_from_compilation_unit_source(codePath, testDataPath)
	
	generatedDirectoryPath = run_context.generatedPath()
	pathlib.Path(generatedDirectoryPath).mkdir(parents=True, exist_ok=True)
	
	# Have Clang generate unoptimized and optimized assembly for comparison purposes if necessary.
	unoptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_unoptimized.asm")
	if not os.path.exists(unoptimizedClangAssemblyPath):
		success, error, _ = compilation.compile_source(codePath, unoptimizedClangAssemblyPath, True)
		if not success:
			print(f"Failed to compile source from {codePath}: {error}")
			
		# Test the Clang assembly to make sure it passes our test cases
		with open(unoptimizedClangAssemblyPath, "r") as assemblyFile:
			assembly = assemblyFile.read()
		success, compiler_error, linker_error, execution_error, correctness_error = compilation.compile_and_test_assembly(assembly, driverObjectPath, testDataPath, None)
		if not success:
			print(f"Testing on Clang-generated assembly failed: {compiler_error} {linker_error} {testing_error}")
			if testing_error is not None:
				os.remove(testDataPath)
			return

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
	
	# Have LLM generate assembly from C compilation unit
	generatedAssemblyPath = os.path.join(generatedDirectoryPath, "llm_generated.asm")
	failurePath = os.path.join(run_context.failurePath(), "generation_failure.asm")
	if has_file_with_prefix(generatedDirectoryPath, "llm_generated"):
		print(f"Already have generated assembly at {generatedAssemblyPath}.")
	else:
		prompting.generate_assembly_from_compilation_unit_source(codePath, driverObjectPath, testDataPath, generatedAssemblyPath, failurePath, optimizations_per_solution)
	
	# Have LLM optimize Clang-generated assembly	
	# optimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_llm_optimized.asm")
	# failurePath = os.path.join(run_context.failurePath(), "optimization_failure.asm")
	# if has_file_with_prefix(generatedDirectoryPath, "clang_generated_llm_optimized"):
	# 	print(f"Already have output for {optimizedClangAssemblyPath}.")
	# else:
	# 	prompting.optimize_assembly(codePath, unoptimizedClangAssemblyPath, driverObjectPath, testDataPath, optimizedClangAssemblyPath, failurePath, optimizations_per_solution)
	
def handle_problem(problemContext, solutions_per_problem, optimizations_per_solution):
	for runContext in problemContext.GetRunContexts(solutions_per_problem):
		handle_problem_run(runContext, "/Users/morgang/code/GenerativeCompilation/test_driver.c", optimizations_per_solution)

if __name__ == "__main__":
	# Check if the user has provided a command-line argument
	if len(sys.argv) < 5:
		print("Please provide correct arguments.")
		sys.exit(1)
		
	folder_path = sys.argv[1]
	model_name = sys.argv[2]
	solutions_per_problem = int(sys.argv[3])
	optimizations_per_solution = int(sys.argv[4])
	
	# Check if the given folder path exists
	if os.path.exists(folder_path):
		modelContext = ModelContext(model_name, folder_path)
		
		problem_contexts = modelContext.GetProblemContexts()
		
		print(problem_contexts)
		
		for problemContext in problem_contexts:
			handle_problem(problemContext, solutions_per_problem, optimizations_per_solution)

	else:
		print("The provided folder path does not exist.")
