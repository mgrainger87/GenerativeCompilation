import os
import pandas as pd
import sys

def generate_latex_code(folder_path):
	# Adjusted mapping for failure types based on the sample CSV
	failure_mapping = {
		'COMPILER': 'Assembler',
		'LINKER': 'Linker',
		'EXECUTION': 'Execution',
		'CORRECTNESS': 'Correctness'
	}

	# Dictionary to store failure data for each model
	failure_data = {}
	model_folders = os.listdir(folder_path)

	# Iterate through each model folder
	for model in model_folders:
		model_path = os.path.join(folder_path, model)

		# Check if it's a directory (ignoring files like .DS_Store)
		if os.path.isdir(model_path):
			subfolders = [d for d in os.listdir(model_path) if os.path.isdir(os.path.join(model_path, d))]
			total_subfolders = len(subfolders)

			# Initialize failure counts for this model
			failure_counts = {
				'Assembler': 0,
				'Linker': 0,
				'Execution': 0,
				'Correctness': 0
			}

			# Iterate through each subfolder to read failure_types.csv
			for subfolder in subfolders:
				csv_path = os.path.join(model_path, subfolder, "failure_types.csv")
				if os.path.exists(csv_path):
					df = pd.read_csv(csv_path)

					# Check if 'Failure Type' column exists
					if 'Failure Type' in df.columns:
						for index, row in df.iterrows():
							failure_type = failure_mapping.get(row['Failure Type'], None)
							if failure_type:
								failure_counts[failure_type] += row['Count']

			# Compute average failures for this model
			for key in failure_counts:
				failure_counts[key] /= total_subfolders

			failure_data[model] = failure_counts

	# Generate LaTeX code based on the failure data
	latex_code = []
	failure_types_order = ['Assembler', 'Linker', 'Execution', 'Correctness']
	fill_colors = ['cyan', None, None, 'lightgray']
	formatted_model_names = {
		'claude': 'Claude',
		'bard': 'Bard',
		'gpt-3.5': 'GPT-3.5',
		'gpt-4': 'GPT-4'
	}

	for i, failure_type in enumerate(failure_types_order):
		coordinates = []
		for model in failure_data.keys():
			avg_failures = failure_data[model][failure_type]
			coordinates.append(f"({formatted_model_names[model]},{avg_failures:.2f})")
		fill_option = f"fill={fill_colors[i]}" if fill_colors[i] else ""
		latex_code.append(f"\\addplot+[ybar, {fill_option}] plot coordinates {{{' '.join(coordinates)}}};")

	latex_output = "\n".join(latex_code) + "\n\\legend{Assembler,Linker,Execution,Correctness}"
	return latex_output

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)

	folder_path = sys.argv[1]
	latex_output = generate_latex_code(os.path.join(folder_path, 'failures'))
	print(latex_output)
