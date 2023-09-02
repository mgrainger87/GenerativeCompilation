import os
import tempfile
import subprocess

import subprocess
import tempfile

def compile_source(source_file_path, output_path=None, generate_assembly=False, optimization_level=None):
	try:
		# Decide the file extension based on generate_assembly flag
		suffix = ".s" if generate_assembly else ".o"
		
		# If output_path is not provided, use a temporary file for the output
		if output_path is None:
			with tempfile.NamedTemporaryFile(suffix=suffix, delete=False) as temp_output_file:
				output_file = temp_output_file.name
		else:
			output_file = output_path
		
		# Compile using clang
		compile_command = ["clang", "-c", source_file_path, "-o", output_file]
		
		# If generating assembly, add the '-S' flag
		if generate_assembly:
			compile_command.insert(2, "-S")
		
		# If optimization level is provided, add it to the compile command
		if optimization_level:
			compile_command.insert(2, f"-{optimization_level}")
		
		compile_process = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		
		if compile_process.returncode == 0:
			return True, None, output_file
		else:
			error_message = compile_process.stderr.decode()
			return False, error_message, None

	except Exception as e:
		return False, str(e), None

def compile_source_from_string(source_code, suffix=".c"):
	try:
		# Create a temporary file
		with tempfile.NamedTemporaryFile(suffix=suffix, delete=False) as temp_file:
			temp_filename = temp_file.name
			# Write the source code to the temporary file
			temp_file.write(source_code.encode())
		print(f"Saved assembly to {temp_filename}")
		# Compile the source code using the modified compile_source function
		success, error_message, output_file = compile_source(temp_filename)
		
		if success:
			return True, None, output_file
		else:
			return False, error_message, None

	except Exception as e:
		return False, str(e), None	

def link_binary(unit_paths, output_path=None):
	try:
		# If output_path is not provided, use a temporary file for the linked binary
		if output_path is None:
			binaryPath = tempfile.NamedTemporaryFile(delete=False).name
		else:
			binaryPath = output_path

		# Construct the clang command
		clang_command = ["clang"] + unit_paths + ["-o", binaryPath]
		
		# Execute the clang command
		result = subprocess.run(clang_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		
		if result.returncode == 0:
			# Linking succeeded, return the path to the linked binary
			return True, None, binaryPath
		else:
			# Linking failed, return the error message
			return False, result.stderr.decode("utf-8"), None
	except Exception as e:
		return False, str(e), None
