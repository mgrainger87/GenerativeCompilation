import os
import pandas as pd
import sys
from run_context import ModelContext

def get_failure_data(folder_path):
	# Adjusted mapping for failure types based on the sample CSV
	failure_mapping = {
		'COMPILER': 'Assembler',
		'LINKER': 'Linker',
		'EXECUTION': 'Execution',
		'CORRECTNESS': 'Correctness'
	}

	failure_data = {}
	for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
		model = modelContext.model()          
		# Iterate through each problem to read failure_types.csv
		for problem in modelContext.GetProblemContexts():
			csv_path = problem.failureSummaryPath()
			if os.path.exists(csv_path):
				df = pd.read_csv(csv_path)
				# Group by prefix and aggregate the counts
				for prefix, group in df.groupby('Prefix'):
					for index, row in group.iterrows():
						failure_type = failure_mapping.get(row['Failure Type'], None)
						if failure_type:
							failure_data.setdefault(prefix, {}).setdefault(model, {}).setdefault(failure_type, 0)
							failure_data[prefix][model][failure_type] += row['Count']
							
	return failure_data
	

def generate_latex_code(failure_data):
	# Generate LaTeX code based on the failure data
	failure_types_order = ['Assembler', 'Linker', 'Execution', 'Correctness']
	fill_colors = ['cyan', None, None, 'lightgray']
	formatted_model_names = {
		'claude': 'Claude',
		'bard': 'Bard',
		'gpt-3.5': 'GPT-3.5',
		'gpt-4': 'GPT-4'
	}

	latex_outputs = {}
	for prefix, data in failure_data.items():
		latex_code = []
		for i, failure_type in enumerate(failure_types_order):
			coordinates = []
			for model in data.keys():
				avg_failures = data[model].get(failure_type, 0)
				coordinates.append(f"({formatted_model_names[model]},{avg_failures:.2f})")
			fill_option = f"fill={fill_colors[i]}" if fill_colors[i] else ""
			latex_code.append(f"\\addplot+[ybar, {fill_option}] plot coordinates {{{' '.join(coordinates)}}};")
		
		latex_outputs[prefix] = "\n".join(latex_code) + "\n\\legend{Assembler,Linker,Execution,Correctness}"

	return latex_outputs

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)

	folder_path = sys.argv[1]
	
	failure_data = get_failure_data(folder_path)
	print(failure_data)
	latex_outputs = generate_latex_code(failure_data)
	
	for prefix, latex_output in latex_outputs.items():
		print(f"\nLaTeX for {prefix}:\n")
		print(latex_output)
