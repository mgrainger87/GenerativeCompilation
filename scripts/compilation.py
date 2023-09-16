import os
import tempfile
import subprocess
import testing
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
		
		# print(f"Running {' '.join(compile_command)}")
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
		
		print(f"Running {' '.join(clang_command)}")
		
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

def compile_and_test_assembly(assembly, driver_object_path, test_data_path, output_path):
	# Returns: Success, Compiler error, linker error, testing error
	
	compiler_error = None
	linker_error = None
	execution_error = None
	correctness_error = None
	
	### Compilation stage
	print(f"Attempting compilation…")	
			
	success, compiler_error, compilation_unit_path = compile_source_from_string(assembly, suffix=".asm")
	if not success:
		print(f"Compilation failed: {compiler_error}")
		return False, compiler_error, linker_error, execution_error, correctness_error
	
	print(f"Compilation successful. Output saved to {compilation_unit_path}.")
		
	### Link stage
	print(f"Linking against {driver_object_path}…")
	
	success, linker_error, executable_path = link_binary([compilation_unit_path, driver_object_path])
	if not success:
		print(f"Linking failed: {linker_error}")
		return False, compiler_error, linker_error, execution_error, correctness_error
	
	print("Linking succeeded.")
	
	### Testing stage
	print("Testing…")
	
	# Set executable permissions
	os.chmod(executable_path, 0o755)
	
	success, execution_error, correctness_error, cpu_time = testing.run_test_from_csv(test_data_path, executable_path)
	if not success:
		print(f"Testing failed: {execution_error} {correctness_error}")
		return False, compiler_error, linker_error, execution_error, correctness_error
	
	print(f"Testing succeeded in {cpu_time} seconds.")
	return True, None, None, None, None
