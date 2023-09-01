import os
import tempfile
import subprocess
import csv
import sys
import pathlib

COMPILATION_UNIT_FILE_NAME = "compilation_unit.c"

GENERATION_TEMPLATE = """Generate arm64 assembly that corresponds to the C compilation unit below. Follow the arm64 calling convention strictly. Mangle function names according to Clang conventions. Align functions appropriately for arm64. Output the assembly as it would be written in a .s file. Do not include stubs for forward declarations or anything that is not in the compilation unit itself.


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
				return False, failure_text  # Test failed
			
	return True, ""  # All tests passed

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
				print(temp_filename)
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
				o_files.append(o_filename)
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

def prompt_llm_based_on_results(code, compilerError, linkerError, testingError):
	prompt = GENERATION_TEMPLATE + code
	if compilerError is not None:
		print("compilerError is not None")
		prompt="Unfortunately, I got a compilation error:\n" + compilerError + "\n Can you fix the error?"
	elif linkerError is not None:
		prompt="Unfortunately, I got a linker error:\n" + linkerError + "\n Can you fix the error?"
	elif testingError is not None:
		prompt=f"Unfortunately, I got an incorrect result when testing the generated code:\n{testingError}\n Can you correct the code?"

	return prompt_llm(prompt)

def handle_coding_problem(code_path, driver_object_path, test_data_path, output_path):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()
		
		compiler_error = None
		linker_error = None
		testing_error = None
		assembly = None
		compilation_unit_binary = None
		linked_binary = None
		
		while linked_binary is None:
			assembly = prompt_llm_based_on_results(code, compiler_error, linker_error, testing_error)
			compiler_error = None
			linker_error = None
			testing_error = None
			
			print("Attempting compilation…")			
			success, compiler_error, compilation_unit_binary = compile_source(assembly, suffix=".asm")
			if success:
				print(f"Compilation successful. Linking against {driver_object_path}…")
					
				# Look for driver object file
				driver_binary = None
				with open(driver_object_path, 'rb') as f:
					driver_binary = f.read()
				
				if driver_binary is None:
					break

				success, linker_error, linked_binary = link_binary([compilation_unit_binary, driver_binary])
				
				if success:
					print("Linking succeeded. Testing…")
					executable_file = tempfile.NamedTemporaryFile(delete=False)  # delete=False ensures the file is not deleted when closed
					with executable_file as f:
						executable_path = executable_file.name
						f.write(linked_binary)
					
					# Set executable permissions
					os.chmod(executable_path, 0o755)
					
					success, testing_error = run_test_from_csv(test_data_path, executable_path)
					
					if success:
						print("Testing succeeded.")					
						with open(output_path, 'w') as f:
							f.write(assembly)
							f.write("\n")
						print("Assembly written to ", output_path)
					else:
						print("Testing failed:", testing_error)
						linked_binary = None
				else:
					print("Linking failed: ", linker_error)


def handle_problem_directory(problem_directory_path, test_driver_source_path):
	codePath = os.path.join(problem_directory_path, COMPILATION_UNIT_FILE_NAME)
	
	# Compile the driver
	driverObjectPath = "/Users/morgang/code/GenerativeCompilation/test_driver.o"
	success, errorMessage, driverObjectPath = compile_driver(test_driver_source_path)
	
	if not success:
		print(errorMessage)
	else:
		testDataPath = os.path.join(problem_directory_path, "test_data.csv")
		
		generatedDirectoryPath = os.path.join(problem_directory_path, "generated")
		pathlib.Path(generatedDirectoryPath).mkdir(parents=True, exist_ok=True)
		
		outputAssemblyPath = os.path.join(generatedDirectoryPath, "generated.asm")
			
		handle_coding_problem(codePath, driverObjectPath, testDataPath, outputAssemblyPath)

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



