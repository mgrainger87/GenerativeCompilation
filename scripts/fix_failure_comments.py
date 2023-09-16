from run_context import ModelContext
import os
import sys

def uncomment_last_commented_line(directory_path):
	# Iterate over all files in the directory
	for filename in os.listdir(directory_path):
		if filename.endswith('.asm'):
			file_path = os.path.join(directory_path, filename)
			
			with open(file_path, 'r') as file:
				lines = file.readlines()
				
			in_comment_block = False
			index_to_uncomment = None
			
			# Iterate over lines to find the first block of comments
			for index, line in enumerate(lines):
				line_stripped = line.strip()
				
				# Check if the line starts with a comment
				if line_stripped.startswith(';'):
					in_comment_block = True
					index_to_uncomment = index
				elif in_comment_block:
					# Exiting the comment block
					break
					
			# Uncomment the identified line
			if index_to_uncomment is not None:
				lines[index_to_uncomment] = lines[index_to_uncomment].lstrip(';').lstrip()
				
				with open(file_path, 'w') as file:
					file.writelines(lines)

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)
	
	folder_path = sys.argv[1]
	
	for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
		for problemContext in modelContext.GetProblemContexts():
			for runContext in problemContext.GetExistingRunContexts():
				uncomment_last_commented_line(runContext.failurePath())
				
	# 
	# failure_data = get_failure_data(folder_path)
	# run_count_dict = analysis.count_runs_by_technique(folder_path)
	# latex_outputs = generate_latex_code(failure_data, run_count_dict)
	# 
	# for prefix, latex_output in latex_outputs.items():
	# 	print(f"\nLaTeX for {prefix}:\n")
	# 	print(latex_output)
	# 	
	# print("Total statistics:")
	# print(failure_data)
	

