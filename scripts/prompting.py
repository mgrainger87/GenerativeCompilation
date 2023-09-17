import os
import compilation
from query_llm import LLMQuerier
from query_human import HumanQuerier
import re

ASSEMBLY_GUIDELINES = """
- Follow the arm64 calling convention strictly. Preserve the values of caller-saved and/or callee-saved registers where necessary.
- Mangle function names according to Clang conventions for C (not C++). Mark symbols as global where necessary. Align symbols appropriately for arm64.
- Follow arm64 convention for local labels starting with a numeric value.
- Be sure to save all required registers, particularly the link register, before branching for a function call and restore them as needed afterwards.
- Use only valid arm64 instructions.
- Use appropriate register widths for an LP64 architecture. In particular, integers are 32 bits, so when comparing or modifying integer values, use wX instead of xX registers.
- The arm64 instruction set doesn't allow for immediate floating point values to be used with the fadd and fsub instructions directly. Instead, load immediate values into a floating-point register first.
- Always assume that the code calling the function is impemented correctly.

Steps to follow:

- Write out which registers are used for which parameters before generating the assembly.
- If there are multiple functions, generate the assembly for one function at a time. At the end, output the combined assembly.
- After generating the assembly, check it again against the guidelines and correct it if needed.
- Trace the assembly line-by-line with different test values that collectively exercise all of the control paths in the function.
"""

CODE_FORMAT_REMINDERS = "" # """Remember to mark the beginning and end of the final generated assembly with lines containing ---ASSEMBLY BEGIN--- and ---ASSEMBLY END--- respectively. Do this when you first print out the assembly -- do not repeat it just to add these markers.
#"""

def test_data_prompt(compilation_unit):
	return f"""For the C function “customFunction” below, generate 10 test cases that exercise its functionality.
	
Write a Python version of customFunction and use it to determine the expected outputs for your test cases. Your test function should perform division in the same way as C, using integer division if necessary. Your Python function should mirror the C code as much as possible; do not optimize.

Output those test cases in comma-separated value format according to the given format. The number of iterations should always be 100. Do not write the CSV to a file; output it directly. Include a header row in the CSV.


If an input or output parameter is not relevant, use 0 for its provided or expected value as appropriate. If the function is recursive, the test cases should not exceed 50 recursive calls.

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
	return f"""Generate valid arm64 LP64 assembly for macOS that corresponds to the provided C compilation unit. Follow these guidelines:

{ASSEMBLY_GUIDELINES}

Output the assembly as it would be written in a .s file. Do not generate stubs or placeholders for forward declarations or anything that is not in the compilation unit itself. If there is more than one function in the compilation unit, generate assembly for each function separately.

After generating the assembly, check it again against the guidelines and correct it if needed. Trace the assembly with different test values that collectively exercise all of the control paths.

Compilation unit:
	
{compilation_unit}
"""

def optimization_prompt(compilation_unit, unoptimized_assembly):
	return f"""Optimize the provided arm64 LP64 assembly for macOS that corresponds to the provided C compilation unit.

Compilation unit:

```
{compilation_unit}
```
Assembly:
{unoptimized_assembly}

Guidelines:

{ASSEMBLY_GUIDELINES}

"""

def correction_prompt(compilation_unit, bad_assembly, compiler_error, linker_error, execution_error, correctness_error):
	error = get_error_instructions_based_on_results(compiler_error, linker_error, execution_error, correctness_error)
	
	return f"""Given the compilation unit, arm64 LP64 assembly for macOS, and error below, correct the assembly so that it assembles, links, and runs correctly.

Compilation unit:

```
{compilation_unit}
```

Incorrect assembly:
```
{bad_assembly}
```

Error:
{error}

Guidelines:

{ASSEMBLY_GUIDELINES}

"""

def remove_comments_from_assembly(assembly_string):
	content = assembly_string.splitlines()

	stripped_content = []
	for line in content:
		# Check for ; style comment
		if ';' in line:
			line = line.split(';', 1)[0]

		# Check for // style comment
		if '//' in line:
			line = line.split('//', 1)[0]

		# Append to the stripped_content list only if line is not empty
		stripped_line = line.strip()
		if stripped_line:
			stripped_content.append(stripped_line)

	# Join the list to form a string
	return '\n'.join(stripped_content)

def correct_existing_assembly(code_path, bad_assembly_path, compiler_error, linker_error, execution_error, correctness_error, driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()
	with open(bad_assembly_path, "r") as assemblyFile:
		badAssembly = remove_comments_from_assembly(assemblyFile.read())

	return prompt_for_assembly(correction_prompt(code, badAssembly, compiler_error, linker_error, execution_error, correctness_error), driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution)

def generate_assembly_from_compilation_unit_source(code_path, driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()
		
	return prompt_for_assembly(generation_prompt(code), driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution)

def optimize_assembly(compilation_unit_path, assembly_path, driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution):
	with open(compilation_unit_path, "r") as compilationUnitFile, open(assembly_path, "r") as assemblyFile:
		compilation_unit = compilationUnitFile.read()
		unoptimized_assembly = assemblyFile.read()
		prompt = optimization_prompt(compilation_unit, unoptimized_assembly)
	
	return prompt_for_assembly(prompt, driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution)

def get_error_instructions_based_on_results(compilerError, linkerError, executionError, correctnessError):
	prompt = ""
	if compilerError is not None:
		prompt=f"When attempting to assemble the assembly you provided, I got the following error.\n{compilerError}\n Fix the error and print out the full corrected assembly. Examine the corrected assembly line-by-line to ensure that it will compile.\n{CODE_FORMAT_REMINDERS}"
	elif linkerError is not None:
		prompt=f"When attempting to link the assembly you provided to the test driver, I got the following error.\n{linkerError}\nFix the error and print out the full corrected assembly. Examine the corrected assembly line-by-line to identify any other linking errors.\n{CODE_FORMAT_REMINDERS}"
	elif executionError is not None:
		prompt=f"\n{executionError}\n{CODE_FORMAT_REMINDERS}"
	elif correctnessError is not None:
		prompt=f"When attempting to test the assembly you provided with the input given below, I got an incorrect result:\n{correctnessError}\nFix the error and print out the full corrected assembly. Trace through the corrected assembly line-by-line with the given input to make sure it now returns the correct answer.\n{CODE_FORMAT_REMINDERS}"
	return prompt

def prompt_llm_based_on_results(querier, initial_prompt, compilerError, linkerError, executionError, correctnessError, foundSolution=False):
	prompt = initial_prompt
	
	error_prompt = get_error_instructions_based_on_results(compilerError, linkerError, executionError, correctnessError)
	if error_prompt:
		prompt = error_prompt
	elif foundSolution:
		prompt = f"Try to (further) optimize the solution so that it runs more quickly."
	
	return querier.generateAssembly(prompt).strip()

def add_semicolon_at_start(input_string):
	lines = input_string.split('\n')
	modified_lines = ['; ' + line for line in lines]
	return '\n'.join(modified_lines)

def unique_file_path(filepath):
	base, ext = os.path.splitext(filepath)
	counter = 1
	while os.path.exists(f"{base}_{counter}{ext}"):
		counter += 1
	
	return f"{base}_{counter}{ext}", counter
	
def prompt_for_assembly(base_prompt, driver_object_path, test_data_path, output_path, failure_path, optimizations_per_solution):
	compiler_error = None
	linker_error = None
	execution_error = None
	correctness_error = None
	assembly = None
	found_solution = False
	
	# Introduce counters for each type of error
	compiler_error_count = 0
	linker_error_count = 0
	execution_error_count = 0
	correctness_error_count = 0
	
	querier = HumanQuerier()
	
	while True:
		assembly = prompt_llm_based_on_results(querier, base_prompt, compiler_error, linker_error, execution_error, correctness_error, found_solution)
		
		if assembly.strip().lower() == "fail":
			unique_path, number_of_solutions = unique_file_path(output_path)
			with open(unique_path, 'w') as f:
				f.write("Manually failed.\n")
			break
			
		if assembly.strip().lower() == "done":
			unique_path, number_of_solutions = unique_file_path(output_path)
			with open(unique_path, 'w') as f:
				f.write("No more optimizations.\n")
			break
			
			
		if assembly is None or len(assembly) == 0:
			if found_solution:
				break
				
			# Didn't work — restart the conversation
			compiler_error = None
			linker_error = None
			execution_error = None
			correctness_error = None
			querier = HumanQuerier()
			continue
	
		success, compiler_error, linker_error, execution_error, correctness_error = compilation.compile_and_test_assembly(assembly, driver_object_path, test_data_path, output_path)
		filename_string = None
		# Update error counters
		if compiler_error:
			compiler_error_count += 1
			filename_string = "COMPILER"
		if linker_error:
			linker_error_count += 1
			filename_string = "LINKER"
		if execution_error:
			execution_error_count += 1
			filename_string = "EXECUTION"
		if correctness_error:
			correctness_error_count += 1
			filename_string = "CORRECTNESS"
			
		total_errors = compiler_error_count + linker_error_count + execution_error_count + correctness_error_count
	
		if not success:
			base, ext = os.path.splitext(failure_path)
			unique_path = f"{base}_{total_errors}_{filename_string}{ext}"
			
			with open(unique_path, 'w') as f:
				f.write(add_semicolon_at_start(f"compiler_errors={compiler_error_count},linker_errors={linker_error_count},execution_errors={execution_error_count},correctness_errors={correctness_error_count}\n"))
				f.write(add_semicolon_at_start(f"Compiler error: {compiler_error}\n"))
				f.write(add_semicolon_at_start(f"Linker error: {linker_error}\n"))
				f.write(add_semicolon_at_start(f"Execution error: {execution_error}\n"))
				f.write(add_semicolon_at_start(f"Correctness error: {correctness_error}\n"))
				f.write(assembly)
				f.write("\n")
			continue
		
		unique_path, number_of_solutions = unique_file_path(output_path)
		with open(unique_path, 'w') as f:
			# Write the error counts in a structured format
			f.write(f"//compiler_errors={compiler_error_count},linker_errors={linker_error_count},execution_errors={execution_error_count},correctness_errors={correctness_error_count}\n")
			f.write(assembly)
			f.write("\n")
		print(f"Assembly written to {unique_path}")
		found_solution = True
		if number_of_solutions >= optimizations_per_solution:
			print(f"Got required {optimizations_per_solution} solutions.")
			break
		else:
			print(f"Got solution {number_of_solutions} of {optimizations_per_solution}.")
