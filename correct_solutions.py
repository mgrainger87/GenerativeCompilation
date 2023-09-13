import sys
import os
import compilation
import pathlib
import prompting
from run_context import ModelContext

def handle_problem_run(run_context, compilation_unit_path, test_data_path, test_driver_source_path, optimizations_per_solution=1):
	print(f"Perforning problem run {run_context}…")
	
	codePath = compilation_unit_path
	
	# Compile the driver if needed
	driverObjectPath = "/Users/morgang/code/GenerativeCompilation/test_driver.o"
	if not os.path.exists(driverObjectPath):
		success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
		if not success:
			print(errorMessage)
			return
	
	testDataPath = test_data_path
	
	generatedDirectoryPath = run_context.generatedPath()
	pathlib.Path(generatedDirectoryPath).mkdir(parents=True, exist_ok=True)
	
	# # Have Clang generate unoptimized and optimized assembly for comparison purposes if necessary.
	# unoptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_unoptimized.asm")
	# if not os.path.exists(unoptimizedClangAssemblyPath):
	# 	success, error, _ = compilation.compile_source(codePath, unoptimizedClangAssemblyPath, True)
	# 	if not success:
	# 		print(f"Failed to compile source from {codePath}: {error}")
	# 
	# o1OptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_O1_optimized.asm")
	# if not os.path.exists(o1OptimizedClangAssemblyPath):
	# 	success, error, _ = compilation.compile_source(codePath, o1OptimizedClangAssemblyPath, True, "O1")
	# 	if not success:
	# 		print(f"Failed to compile source from {codePath}: {error}")
	# 
	# o2OptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_O2_optimized.asm")
	# if not os.path.exists(o2OptimizedClangAssemblyPath):
	# 	success, error, _ = compilation.compile_source(codePath, o2OptimizedClangAssemblyPath, True, "O2")
	# 	if not success:
	# 		print(f"Failed to compile source from {codePath}: {error}")
	# 
	# o3OptimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_O3_optimized.asm")
	# if not os.path.exists(o3OptimizedClangAssemblyPath):
	# 	success, error, _ = compilation.compile_source(codePath, o3OptimizedClangAssemblyPath, True, "O3")
	# 	if not success:
	# 		print(f"Failed to compile source from {codePath}: {error}")
	# 
	# # Test the Clang assembly to make sure it passes our test cases
	# with open(unoptimizedClangAssemblyPath, "r") as assemblyFile:
	# 	assembly = assemblyFile.read()
	# success, compiler_error, linker_error, execution_error, correctness_error = compilation.compile_and_test_assembly(assembly, driverObjectPath, testDataPath, None)
	# if not success:
	# 	print(f"Testing on Clang-generated assembly failed: {compiler_error} {linker_error} {testing_error}")
	# 	if testing_error is not None:
	# 		os.remove(testDataPath)
	# 	return
	
	# Have LLM generate assembly from C compilation unit
	for badAssemblyFilename in os.listdir(run_context.problemPath()):
		base, ext = os.path.splitext(badAssemblyFilename)
		if ext == ".asm":
			generatedAssemblyPath = os.path.join(generatedDirectoryPath, f"{base}_CORRECTED.asm")
			
			if os.path.exists(generatedAssemblyPath):
				print(f"Already have generated assembly at {generatedAssemblyPath}.")
			else:
				badAssemblyFilePath = os.path.join(run_context.problemPath(), badAssemblyFilename)
				with open(badAssemblyFilePath, "r") as assemblyFile:
					badAssembly = assemblyFile.read()
				
				success, compiler_error, linker_error, execution_error, correctness_error = compilation.compile_and_test_assembly(badAssembly, driverObjectPath, testDataPath, None)
				#code_path, bad_assembly_path, compiler_error, linker_error, execution_error, correctness_error, driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution
				prompting.correct_existing_assembly(codePath, badAssemblyFilePath, compiler_error, linker_error, execution_error, correctness_error, driverObjectPath, testDataPath, generatedAssemblyPath, run_context.failurePath(), 1)
# 
# 		
# 	if has_file_with_prefix(generatedDirectoryPath, "llm_generated"):
# 	else:
# 		prompting.generate_assembly_from_compilation_unit_source(codePath, driverObjectPath, testDataPath, generatedAssemblyPath, failurePath, optimizations_per_solution)
# 	
# 	# Have LLM optimize Clang-generated assembly	
# 	optimizedClangAssemblyPath = os.path.join(generatedDirectoryPath, "clang_generated_llm_optimized.asm")
# 	failurePath = os.path.join(run_context.failurePath(), "optimization_failure.asm")
# 	if has_file_with_prefix(generatedDirectoryPath, "clang_generated_llm_optimized"):
# 		print(f"Already have output for {optimizedClangAssemblyPath}.")
# 	else:
# 		optimize_assembly(codePath, unoptimizedClangAssemblyPath, driverObjectPath, testDataPath, optimizedClangAssemblyPath, failurePath, optimizations_per_solution)

def handle_problem(problemContext, compilation_unit_path, test_data_path, solutions_per_problem, optimizations_per_solution):
		for runContext in problemContext.GetRunContexts(solutions_per_problem):
			handle_problem_run(runContext, compilation_unit_path, test_data_path, "/Users/morgang/code/GenerativeCompilation/test_driver.c", optimizations_per_solution)

if __name__ == "__main__":
	# Check if the user has provided a command-line argument
	if len(sys.argv) < 5:
		print("Please provide correct arguments.")
		sys.exit(1)
		
	folder_path = sys.argv[1]
	model_name = sys.argv[2]
	compilation_unit_path = sys.argv[3]
	test_data_path = sys.argv[4]
	
	# Check if the given folder path exists
	if os.path.exists(folder_path):
		modelContext = ModelContext(model_name, folder_path)
		
		problem_contexts = modelContext.GetProblemContexts()
		
		print(problem_contexts)
		
		for problemContext in problem_contexts:
			handle_problem(problemContext, compilation_unit_path, test_data_path,  1, 1)
	
	else:
		print("The provided folder path does not exist.")
