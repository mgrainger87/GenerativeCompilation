
import os
import pandas as pd
import sys

def generate_latex_code_from_summary(folder_path):
	# Filenames to look for
	target_files = ["clang_generated_llm_optimized", "llm_generated"]
	
	# Dictionary to store count data for each model
	counts_data = {}
	model_folders = os.listdir(folder_path)

	# Iterate through each model folder
	for model in model_folders:
		model_path = os.path.join(folder_path, model)

		# Check if it's a directory (ignoring files like .DS_Store)
		if os.path.isdir(model_path):
			# Initialize count data for this model
			model_counts = {filename: 0 for filename in target_files}
			
			# Look for generated_summary.csv in each subfolder
			subfolders = [d for d in os.listdir(model_path) if os.path.isdir(os.path.join(model_path, d))]
			for subfolder in subfolders:
				csv_path = os.path.join(model_path, subfolder, "generated_summary.csv")
				if os.path.exists(csv_path):
					df = pd.read_csv(csv_path)
					for target in target_files:
						# Check for filenames with suffixes
						rows_with_target = df[df['Filename'].str.startswith(target)]
						for _, row in rows_with_target.iterrows():
							model_counts[target] += row['Count']
			
			counts_data[model] = model_counts

	# Generate LaTeX code based on the count data
	latex_code = []
	formatted_model_names = {
		'claude': 'Claude',
		'bard': 'Bard',
		'gpt-3.5': 'GPT-3.5',
		'gpt-4': 'GPT-4'
	}

	for target in target_files:
		coordinates = []
		for model in ['claude', 'bard', 'gpt-3.5', 'gpt-4']:
			count = counts_data[model][target]
			coordinates.append(f"({formatted_model_names[model]},{count})")
		latex_code.append(f"\\addplot[sharp plot, mark=*] coordinates {{{' '.join(coordinates)}}};")

	latex_output = "\n".join(latex_code)
	return latex_output

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)

	folder_path = sys.argv[1]
	latex_output = generate_latex_code_from_summary(os.path.join(folder_path, 'generated'))
	print(latex_output)
