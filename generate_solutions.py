from langchain import LLMChain
# from langchain.chat_models import ChatOpenAI
# # from langchain.prompts.chat import (ChatPromptTemplate,
# # 									HumanMessagePromptTemplate,
# # 									SystemMessagePromptTemplate)
# from langchain.prompts import PromptTemplate
# from langchain.chains import ConversationChain
# 
# from langchain.llms import OpenAI
import os

from langchain.llms import OpenAI
from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory
from langchain.prompts.prompt import PromptTemplate

# 
# llm = OpenAI()
# chat_model = ChatOpenAI()
# 
# from langchain.chat_models import ChatOpenAI
# from langchain.prompts.chat import (
# 	ChatPromptTemplate,
# 	SystemMessagePromptTemplate,
# 	HumanMessagePromptTemplate,
# )
# from langchain.chains import LLMChain
# from langchain.schema import BaseOutputParser

# class CommaSeparatedListOutputParser(BaseOutputParser):
# 	"""Parse the output of an LLM call to a comma-separated list."""
# 
# 
# 	def parse(self, text: str):
# 		"""Parse the output of an LLM call."""
# 		return text
# 
# template = """You are a helpful assistant who generates comma separated lists.
# A user will pass in a category, and you should generate 5 objects in that category in a comma separated list.
# ONLY return a comma separated list, and nothing more."""
# system_message_prompt = SystemMessagePromptTemplate.from_template(template)
# human_template = "{text}"
# human_message_prompt = HumanMessagePromptTemplate.from_template(human_template)

GENERATION_TEMPLATE = """Generate arm64 assembly that corresponds to the C compilation unit below. Follow the arm64 calling convention strictly. Mangle function names according to Clang conventions. Align functions appropriately for arm64. Output ONLY the assembly as it would be written in a .s file. Do not include stubs for forward declarations or anything that is not in the compilation unit itself.
```
{compilation_unit}
```"""

RETRY_TEMPLATE = ""

import os
import tempfile
import subprocess


class AssemblyGenerator:
	def __init__(self, compilationUnit):
		self.compilationUnit = compilationUnit
		self.failureText = None
		
		template = """The following is a conversation between a human and an AI. The AI is acting as a compiler. The human provides C code for the AI to compile.
		
		Instructions for the AI: Generate arm64 assembly that corresponds to the C compilation unit provided by the human. Follow the arm64 calling convention strictly. Mangle function names according to Clang conventions. Align functions appropriately for arm64. Output the assembly as it would be written in a .s file. Do not include stubs for forward declarations or anything that is not in the compilation unit itself. Respond only with the assembly code and nothing else.
		
		Current conversation:
		{history}
		Human: {input}
		AI:"""
		prompt = PromptTemplate(input_variables=["history", "input"], template=template)
		
		self.conversation = ConversationChain(
			prompt=prompt,
			llm=OpenAI(model_name="gpt-3.5-turbo"),
			verbose=True,
			# model_name="gpt-3.5-turbo",
			memory=ConversationBufferMemory()
		)
		
		
	def retryGeneration(self, failureText):
		input="Unfortunately, I got a compilation error:\n" + failureText + "\n Can you fix the error? Output only the corrected assembly and nothing else."
		return self.conversation.predict(input=input)
	
	def generateAssembly(self, compilerError=None, linkerError=None):
			# prompt = PromptTemplate.from_template(GENERATION_TEMPLATE)
			# prompt.format(compilation_unit=self.compilationUnit)
			# print(prompt)
			# chain = LLMChain(
			# 	llm=ChatOpenAI(),
			# 	prompt=prompt,
			# 	# output_parser=CommaSeparatedListOutputParser()
			# )
			# print(chain)
			
			input = self.compilationUnit
			
			print("Compiler error 3:")
			print(compilerError)
			if compilerError is not None:
				print("compilerError is not None")
				input = "Unfortunately, I got a compilation error:\n" + compilerError + "\n Can you fix the error? Output only the corrected assembly and nothing else."
			elif linkerError is not None:
				input = "Unfortunately, I got a linker error:\n" + linkerError + "\n Can you fix the error? Output only the corrected assembly and nothing else."
				
			print(compilerError)
			print(linkerError)

			return self.conversation.predict(input=input)
			# return chain.run(unit)


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

import tempfile
import subprocess

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


for root, dirs, files in os.walk(os.path.join(os.getcwd(), "problems")):
	for file in files:
		if file.endswith(".c") and file.startswith("to_optimize"):
			file_path = os.path.join(root, file)
			try:
				with open(file_path, 'r', encoding='ISO-8859-1') as f:
					content = f.read()
					
					generator = AssemblyGenerator(content)
					
					compiler_error = None
					linker_error = None
					assembly = None
					compilation_unit_binary = None
					linked_binary = None
					
					while linked_binary is None:
						print("Compiler error: ")
						print(compiler_error)
						assembly = generator.generateAssembly(compilerError=compiler_error, linkerError=linker_error)
						compiler_error = None
						linker_error = None
						
						success, compiler_error, compilation_unit_binary = compile_assembly(assembly)
						print("compiler error 2")
						print(compiler_error)
						if success:
							# Look for driver object file
							driver_path = os.path.join(root, "test1.o")
							driver_binary = None
							with open(file_path, 'rb') as f:
								driver_binary = f.read()

							if driver_binary is None:
								break
							
							success, linker_error, linked_binary = link_binary([compilation_unit_binary])


					
# 					assembly = generator.generateAssembly()
# 					print(assembly)
# 					
# 					success, error_message, binary_data = compile_assembly(assembly)
# 					print(success, error_message, binary_data)
# 
# 					while not success:
# 						assembly = generator.retryGeneration(error_message)
# 						success, error_message, binary_data = compile_assembly(assembly)
# 						print(success, error_message, binary_data)

					

					break
			except Exception as e:
				print(e)
