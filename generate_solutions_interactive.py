import os
import tempfile
import subprocess

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
	
	
def compile_assembly(assembly_code):
		try:
			# Create a temporary file
			with tempfile.NamedTemporaryFile(suffix=".asm", delete=False) as temp_file:
				temp_filename = temp_file.name
				# Write the assembly code to the temporary file
				temp_file.write(assembly_code.encode())
			
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
			if os.path.exists(temp_filename):
				os.remove(temp_filename)
			if os.path.exists(output_object_file):
				os.remove(output_object_file)
	
def link_binary(units):
	try:
		# Create a temporary directory to store the .o files
		with tempfile.TemporaryDirectory() as temp_dir:
			o_files = []
			
			# Compile each binary compilation unit and store the .o files
			for idx, unit in enumerate(units):
				o_filename = f"unit{idx+1}.o"
				o_files.append(o_filename)
				with open(o_filename, "wb") as o_file:
					o_file.write(unit)

			# Construct the clang command
			clang_command = ["clang"] + o_files + ["-o", "mybinary"]
			
			# Execute the clang command
			result = subprocess.run(clang_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			
			if result.returncode == 0:
				# Linking succeeded, read the binary data of the compiled binary
				with open("mybinary", "rb") as binary_file:
					binary_data = binary_file.read()
				return True, None, binary_data
			else:
				# Linking failed, return the error message
				return False, result.stderr.decode("utf-8"), None
	except Exception as e:
		return False, str(e), None

def prompt_llm_based_on_results(code, compilerError, linkerError):
	prompt = GENERATION_TEMPLATE + code
	if compilerError is not None:
		print("compilerError is not None")
		prompt="Unfortunately, I got a compilation error:\n" + compilerError + "\n Can you fix the error?"
	elif linkerError is not None:
		prompt="Unfortunately, I got a linker error:\n" + linkerError + "\n Can you fix the error?"

	return prompt_llm(prompt)

def compile_tests(test_paths):
	o_files = []
	
	for path in test_paths:
		# Get the directory and filename without extension
		directory, filename = os.path.split(path)
		basename = os.path.splitext(filename)[0]
	
		# Define the .o file path
		o_file_path = os.path.join(directory, basename + '.o')
		o_files.append(o_file_path)
	
		# Compile using clang
		compile_command = ["clang", "-c", path, "-o", o_file_path]
		compile_process = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	
	return o_files

def handle_coding_problem(code_path, test_object_paths, output_path):
	with open(code_path, "r") as codeFile:
		code = codeFile.read()
		
		compiler_error = None
		linker_error = None
		assembly = None
		compilation_unit_binary = None
		linked_binary = None
		
		while linked_binary is None:
			print("Prompting based on linker error: ", linker_error)
			
			assembly = prompt_llm_based_on_results(code, compiler_error, linker_error)
			compiler_error = None
			linker_error = None
			
			print("Attempting compilation…")			
			success, compiler_error, compilation_unit_binary = compile_assembly(assembly)
			if success:
				print("Compilation successful. Linking…")
				
				for test_path in test_object_paths:
					print("Linking against", test_path)
					
					# Look for driver object file
					driver_binary = None
					with open(test_path, 'rb') as f:
						driver_binary = f.read()
					
					if driver_binary is None:
						break

					success, linker_error, linked_binary = link_binary([compilation_unit_binary, driver_binary])
					if not success:
						break
				
				if success:
					print("Linking succeeded.")
					with open(output_path, 'w') as f:
						f.write(assembly)
						f.write("\n")
					print("Assembly written to ", output_path)
				else:
					print("Linking failed: ", linker_error)

		
		

basePath = "/Users/morgang/code/GenerativeCompilation/problems/1/"

codePath = os.path.join(basePath, "to_optimize.c")
testPaths = [
	os.path.join(basePath, "test1.c"),
	os.path.join(basePath, "test2.c"),
	os.path.join(basePath, "test3.c"),
	os.path.join(basePath, "test4.c"),
	os.path.join(basePath, "test5.c")
]
objectPaths = compile_tests(testPaths)

outputAssemblyPath = os.path.join(basePath, "to_optimize.asm")
	
handle_coding_problem(codePath, objectPaths, outputAssemblyPath)