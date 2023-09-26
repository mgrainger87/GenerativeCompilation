from run_context import ModelContext
from collections import Counter
from collections import defaultdict
import compilation
import testing
import sys
import os
import re

def get_compilation_errors(folder_path):
	compilationErrors = []
	
	for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
		for problemContext in modelContext.GetProblemContexts():
			for runContext in problemContext.GetExistingRunContexts():
				for filename in os.listdir(runContext.failurePath()):
					if filename.endswith('.asm') and 'COMPILER' in filename:
						filepath = os.path.join(runContext.failurePath(), filename)
						success, error_message, output_file = compilation.compile_source(filepath)
						
						if error_message:
							print(filepath + "  " + error_message)
							compilationErrors.append(error_message)
						else:
							print(f"File {filepath} compiled successfully")
	
	return compilationErrors

def extract_compilation_errors(data):
	error_pattern = re.compile(r"error: (.+)$")
	instruction_pattern = re.compile(r"^(.+?)(?:;|$)")  # Capture up to an optional comment or end of line

	# Dictionary to store error details
	errors_dict = defaultdict(lambda: {"instructions": defaultdict(int), "count": 0})
	
	for entry in data:
		lines = entry.split('\n')
		for i, line in enumerate(lines):
			error_match = error_pattern.search(line)
			if error_match:
				error_message = error_match.group(1)
				# Check if next line exists and matches the instruction pattern
				if i + 1 < len(lines):
					instruction_match = instruction_pattern.match(lines[i + 1])
					if instruction_match:
						instruction = instruction_match.group(1).strip()
						errors_dict[error_message]["instructions"][instruction] += 1
						errors_dict[error_message]["count"] += 1
	
	return errors_dict
	
def format_compilation_errors_full(error_dict):
	# Sort the dictionary by count in descending order
	sorted_errors = sorted(error_dict.items(), key=lambda x: x[1]['count'], reverse=True)
	
	formatted_output = []
	
	for error, details in sorted_errors:
		error_output = []
		error_output.append(f"Error: {error}")
		error_output.append(f"Count: {details['count']}")
		
		# Group instructions by mnemonic and count them
		mnemonic_dict = {}
		for instruction, count in details['instructions'].items():
			mnemonic = instruction.split()[0]
			if mnemonic not in mnemonic_dict:
				mnemonic_dict[mnemonic] = {'instructions': {}, 'count': 0}
			mnemonic_dict[mnemonic]['instructions'][instruction] = count
			mnemonic_dict[mnemonic]['count'] += count
		
		# Format the grouped instructions and sort mnemonics by their counts
		instructions_output = []
		for mnemonic, instr_details in sorted(mnemonic_dict.items(), key=lambda x: x[1]['count'], reverse=True):
			distinct_instructions = sorted(instr_details['instructions'].items(), key=lambda x: x[1], reverse=True)
			formatted_instructions = ", ".join([f"{instr} ({count})" for instr, count in distinct_instructions])
			total_count = instr_details['count']
			instructions_output.append(f"{mnemonic}: {total_count} ({formatted_instructions})")
		
		error_output.append(f"Instructions:\n    " + "\n    ".join(instructions_output))
		formatted_output.append("\n".join(error_output))
		
	return "\n\n".join(formatted_output)
	
def format_compilation_errors_summary(error_dict):
	# Helper function to format and group instruction counts by mnemonic
	def format_instruction_counts_grouped(instructions):
		mnemonic_counts = defaultdict(int)
		for instruction, count in instructions.items():
			mnemonic = instruction.split()[0]  # Extract mnemonic from the instruction
			mnemonic_counts[mnemonic] += count
		
		# Sort mnemonics by count in descending order
		sorted_mnemonics = sorted(mnemonic_counts.items(), key=lambda x: x[1], reverse=True)
		return ", ".join(f"{mnemonic} {count}" for mnemonic, count in sorted_mnemonics)

	# Order the errors by count in descending order
	sorted_errors = sorted(error_dict.items(), key=lambda x: x[1]['count'], reverse=True)
	
	summary = []
	for error, details in sorted_errors:
		instruction_summary = format_instruction_counts_grouped(details["instructions"])
		summary.append(f"Error: {error}\nCount: {details['count']}\nInstructions: {instruction_summary}\n")

	return "\n".join(summary)

def get_linking_errors(folder_path, test_driver_source_path):
		linkerErrors = []
		
		success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
		if not success:
			print(f"Failed to compile test driver: {errorMessage}")
			return None
		
		for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
			for problemContext in modelContext.GetProblemContexts():
				for runContext in problemContext.GetExistingRunContexts():
					for filename in os.listdir(runContext.failurePath()):
						if filename.endswith('.asm') and 'LINKER' in filename:
							filepath = os.path.join(runContext.failurePath(), filename)
							success, error_message, outputObjectPath = compilation.compile_source(filepath)
							
							if not success:
								print(f"File {filepath} failed to compile: {error_message}")
								continue
							
							success, error_message, outputBinaryPath = compilation.link_binary([driverObjectPath, outputObjectPath])
	
							if error_message:
								linkerErrors.append(error_message)
							else:
								print(f"File {filepath} linked successfully")
		
		return linkerErrors
		
def extract_linking_errors(data):
	error_summary = defaultdict(int)
	
	# Iterate through each error string
	for error_str in data:
		# Split the error string into lines
		lines = error_str.split('\n')
		
		# Iterate through each line
		for line in lines:
			# Exclude lines that start with 'clang: error:'
			if line.startswith("clang: error:"):
				continue

			# Count errors starting with 'ld:' after stripping 'ld:'
			if line.startswith('ld:'):
				error_key = line.split('ld:')[1].strip()
				
				# Exclude warnings from the output
				if "warning" not in error_key:
					error_summary[error_key] += 1

	# Convert defaultdict to a regular dictionary before returning
	return dict(error_summary)

def extract_linking_missing_symbols(data):
	missing_symbols = []
	
	current_group = []  # To store the lines of the current error group
	
	# Iterate through each error string
	for error_str in data:
		# Split the error string into lines
		lines = error_str.split('\n')
		
		# Iterate through each line
		for line in lines:
			# Group lines until we encounter a line that starts with 'ld'
			if line.startswith('ld'):
				# Check if the current group corresponds to a "symbol(s) not found" error
				if 'symbol(s) not found for architecture arm64' in line:
					for grouped_line in current_group:
						if '"' in grouped_line:  # Check if the line has the symbol enclosed in double quotes
							# Extract the symbol name
							symbol = grouped_line.split('"')[1]
							missing_symbols.append(symbol)
				# Reset the current group
				current_group = []
			else:
				# Collect lines for the current error group
				current_group.append(line)
	
	return missing_symbols

def get_execution_and_correctness_errors(folder_path, test_driver_source_path):
	executionErrors = []
	correctnessErrors = []
	
	success, errorMessage, driverObjectPath = compilation.compile_source(test_driver_source_path)
	if not success:
		print(f"Failed to compile test driver: {errorMessage}")
		return None
	
	for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
		for problemContext in modelContext.GetProblemContexts():
			for runContext in problemContext.GetExistingRunContexts():
				for filename in os.listdir(runContext.failurePath()):
					if filename.endswith('.asm') and ('EXECUTION' in filename or 'CORRECTNESS' in filename):
						filepath = os.path.join(runContext.failurePath(), filename)
						success, error_message, outputObjectPath = compilation.compile_source(filepath)
						
						print(f"{filepath}")
						
						if not success:
							print(f"File {filepath} failed to compile: {error_message}")
							continue
						
						success, error_message, outputBinaryPath = compilation.link_binary([driverObjectPath, outputObjectPath])
	
						if not success:
							print(f"File {filepath} failed to link: {error_message}")
							continue
							
						# Set executable permissions
						os.chmod(outputBinaryPath, 0o755)
						
						test_data_path = problemContext.testDataPath()
						success, execution_error, correctness_error, cpu_time = testing.run_test_from_csv(test_data_path, outputBinaryPath, maxCpuTime=1)

						if 'EXECUTION' in filename:
							if execution_error:
								executionErrors.append(execution_error)
							else:
								print(f"File {filepath} executed successfully")
								
						if 'CORRECTNESS' in filename:
							if correctness_error:
								correctnessErrors.append(correctness_error)
							else:
								print(f"File {filepath} tested successfully")
								
						# if len(executionErrors) > 5:
						# 	return executionErrors, correctnessErrors

	
	return executionErrors, correctnessErrors
	
def get_execution_stop_reasons(all_execution_errors):
	def extract_stop_reason(s):
		pattern = r"Thread \d+ Stop Reason: ([^\n]+)"
		match = re.search(pattern, s)
		if match:
			return match.group(1)
		return None
		
	error_reasons = []
	for error in all_execution_errors:
		stop_reason = extract_stop_reason(error)
		if stop_reason and re.match(r"([A-Z_]+)", stop_reason):
			match = re.match(r"([A-Z_]+)", stop_reason)
			error_reasons.append(match.group(1))
		elif "the program ran forever" in error:
			error_reasons.append("the program ran forever")
	
	return Counter(error_reasons)


if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)
	
	folder_path = sys.argv[1]
	
	print("Compilation:")
	all_compilation_errors = get_compilation_errors(folder_path)
	extracted_errors = extract_compilation_errors(all_compilation_errors)
	print(format_compilation_errors_full(extracted_errors))
	print('\n')
	print(format_compilation_errors_summary(extracted_errors))
	
	print("\n\nLinking:")
	all_linking_errors = get_linking_errors(folder_path, "/Users/morgang/code/GenerativeCompilation/test_driver.c")
	print(extract_linking_errors(all_linking_errors))
	print(extract_linking_missing_symbols(all_linking_errors))
	
	print("\n\nExecution:")
	all_execution_errors, all_correctness_errors = get_execution_and_correctness_errors(folder_path, "/Users/morgang/code/GenerativeCompilation/test_driver.c")
	# print(all_execution_errors)
	print(get_execution_stop_reasons(all_execution_errors))
	
