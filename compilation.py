import os
import tempfile
import subprocess

def compile_driver(driver_path):
	# Read the driver source code from the given path
	try:
		with open(driver_path, "r") as f:
			driver_source_code = f.read()
	except Exception as e:
		return False, str(e)
	
	# Compile the driver source code
	success, error_message, binary_data = compile_source(driver_source_code, suffix=os.path.splitext(driver_path)[1])
	
	if success:
		# Write the compiled binary data to the output path
		# try:
		with tempfile.NamedTemporaryFile(mode="wb", suffix='.o', delete=False) as temp_file:
			objectFileName = temp_file.name
			temp_file.write(binary_data)
		return True, "Compilation successful!", objectFileName
		# except Exception as e:
		# 	return False, str(e), None
	else:
		return False, error_message, None


def compile_source(source_code, suffix=".c"):
		try:
			# Create a temporary file
			with tempfile.NamedTemporaryFile(suffix=suffix, delete=False) as temp_file:
				temp_filename = temp_file.name
				# Write the assembly code to the temporary file
				temp_file.write(source_code.encode())
			# Construct the output object file name
			output_object_file = os.path.splitext(temp_filename)[0] + ".o"
			
			# Compile using clang
			compile_command = ["clang", "-c", temp_filename, "-o", output_object_file]
			compile_process = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			
			if compile_process.returncode == 0:
				# Read the compiled object file
				with open(output_object_file, "rb") as obj_file:
					obj_binary_data = obj_file.read()
				return True, None, obj_binary_data
			else:
				error_message = compile_process.stderr.decode()
				return False, error_message, None
		
		except Exception as e:
			return False, str(e), None
		
		finally:
			# Clean up the temporary file
			# if os.path.exists(temp_filename):
			# 	os.remove(temp_filename)
			# if os.path.exists(output_object_file):
			# 	os.remove(output_object_file)
			pass
	
def link_binary(units):
	try:
		# Create a temporary directory to store the .o files
		with tempfile.TemporaryDirectory() as temp_dir:
			o_files = []
			
			# Compile each binary compilation unit and store the .o files
			for idx, unit in enumerate(units):
				o_filename = f"unit{idx+1}.o"
				o_filepath = os.path.join(temp_dir, o_filename)
				o_files.append(o_filepath)
				with open(o_filepath, "wb") as o_file:
					o_file.write(unit)

			binaryPath = os.path.join(temp_dir, "linkedBinary")
			# Construct the clang command
			clang_command = ["clang"] + o_files + ["-o", binaryPath]
			
			# Execute the clang command
			result = subprocess.run(clang_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			
			if result.returncode == 0:
				# Linking succeeded, read the binary data of the compiled binary
				with open(binaryPath, "rb") as binary_file:
					binary_data = binary_file.read()
				return True, None, binary_data
			else:
				# Linking failed, return the error message
				return False, result.stderr.decode("utf-8"), None
	except Exception as e:
		return False, str(e), None
