import os
import pandas as pd
import sys
from run_context import ModelContext
import analysis

def get_counts_from_summary(folder_path, target_files):
	# Dictionary to store count data for each technique
	counts_data = {}
	
	# Iterate through each model folder
	for model in ModelContext.ModelContextsForDirectory(folder_path):                
		for problem in model.GetProblemContexts():
			technique_file = problem.techniquePath()
			if os.path.exists(technique_file):
				with open(technique_file, 'r') as f:
					technique = f.read().strip()
	
			csv_path = problem.generatedSummaryPath()
			if os.path.exists(csv_path):
				df = pd.read_csv(csv_path)
				for target in target_files:
					# Check for filenames with suffixes
					rows_with_target = df[df['Filename'].str.startswith(target)]
					for _, row in rows_with_target.iterrows():
						# Initialize technique if not exists
						if technique not in counts_data:
							counts_data[technique] = {}
						# Initialize target within technique if not exists
						if target not in counts_data[technique]:
							counts_data[technique][target] = {'Failures': 0, 'Successes': 0}
						counts_data[technique][target]['Failures'] += row['Failures']
						if 'Successes' in row:
							counts_data[technique][target]['Successes'] += row['Successes']
	return counts_data

def generate_latex_code_from_counts(counts_data, target_files, run_counts_dict):
	# Generate LaTeX code based on the count data
	latex_code = []
	formatted_model_names = {
		'claude': 'Claude',
		'bard': 'Bard',
		'gpt-3.5': 'GPT-3.5',
		'gpt-4': 'GPT-4'
	}
	
	techniques_order = ['simple', 'conditionals', 'loops', 'uses a helper function', 'recursion']
	
	for target in target_files:
		for metric in ['Failures', 'Successes']:
			latex_code.append(f"{target} {metric}:\n\n")
			coordinates = []
			for technique in techniques_order:
				if technique in counts_data and target in counts_data[technique]:
					count = counts_data[technique][target][metric] * 100 / run_counts_dict[technique]
					coordinates.append(f"({technique},{count})")
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
	
	countsDict = get_counts_from_summary(folder_path, target_files)
	run_counts_dict = analysis.count_runs_by_technique(folder_path)
	latex_output = generate_latex_code_from_counts(countsDict, target_files, run_counts_dict)
	print(latex_output)
