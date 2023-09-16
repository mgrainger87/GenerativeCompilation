import os
import pandas as pd
import sys
from run_context import ModelContext

def get_counts_from_summary(folder_path, target_files):
	
	# Dictionary to store count data for each model
	counts_data = {}
	model_folders = os.listdir(folder_path)
	# Iterate through each model folder
	for model in ModelContext.ModelContextsForDirectory(folder_path):
		model_counts = {filename: {'Failures': 0, 'Successes': 0} for filename in target_files}
		for problem in model.GetProblemContexts():
			csv_path = problem.generatedSummaryPath()

			technique_file = problem.techniquePath()
			if os.path.exists(technique_file):
				with open(technique_file, 'r') as f:
					technique = f.read().strip()
			if os.path.exists(csv_path):
				df = pd.read_csv(csv_path)
				for target in target_files:
					# Check for filenames with suffixes
					rows_with_target = df[df['Filename'].str.startswith(target)]
					for _, row in rows_with_target.iterrows():
						model_counts[target]['Failures'] += row['Failures']
						if 'Successes' in row:
							model_counts[target]['Successes'] += row['Successes']
		counts_data[model.model()] = model_counts
	return counts_data

def generate_latex_code_from_counts(counts_data, target_files):
	# Generate LaTeX code based on the count data
	latex_code = []
	formatted_model_names = {
		'claude': 'Claude',
		'bard': 'Bard',
		'gpt-3.5': 'GPT-3.5',
		'gpt-4': 'GPT-4'
	}

	for target in target_files:
		for metric in ['Failures', 'Successes']:
			latex_code.append(f"{target} {metric}:")
			coordinates = []
			for model in ['claude', 'bard', 'gpt-3.5', 'gpt-4']:
				if model in counts_data:
					count = counts_data[model][target][metric]
					coordinates.append(f"({formatted_model_names[model]},{count})")
			latex_code.append(f"\\addplot[sharp plot, mark=*] coordinates {{{' '.join(coordinates)}}};\n")

	latex_output = "\n".join(latex_code)
	return latex_output

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)

	folder_path = sys.argv[1]
	
	# Filenames to look for
	target_files = ["clang_generated_llm_optimized", "llm_generated", "generation_failure", "optimization_failure"]
	
	counts = get_counts_from_summary(folder_path, target_files)
	latex_output = generate_latex_code_from_counts(counts, target_files)
	print(latex_output)
