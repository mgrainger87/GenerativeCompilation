import os
import pandas as pd
import sys
from run_context import ModelContext
import analysis

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
			technique_file = problem.techniquePath()
			if os.path.exists(technique_file):
				with open(technique_file, 'r') as f:
					technique = f.read().strip()

			csv_path = problem.failureSummaryPath()
			if os.path.exists(csv_path):
				df = pd.read_csv(csv_path)
				# Group by prefix and aggregate the counts
				for prefix, group in df.groupby('Prefix'):
					for index, row in group.iterrows():
						failure_type = failure_mapping.get(row['Failure Type'], None)
						if failure_type:
							failure_data.setdefault(prefix, {}).setdefault(technique, {}).setdefault(failure_type, 0)
							failure_data[prefix].setdefault('Total', {}).setdefault(failure_type, 0)
							
							count = row['Count']							
							failure_data[prefix][technique][failure_type] += count
							failure_data[prefix]['Total'][failure_type] += count
							
	return failure_data


def generate_latex_code(failure_data, run_counts_dict):
	# Generate LaTeX code based on the failure data
	failure_types_order = ['Assembler', 'Linker', 'Execution', 'Correctness']
	fill_colors = ['cyan', None, None, 'lightgray']
	formatted_technique_names = {
		'simple': 'simple',
		'conditionals': 'conditionals',
		'loops': 'loops',
		'uses a helper function': 'helper',
		'recursion': 'recursion',
	}
	techniques_order = ['simple', 'conditionals', 'loops', 'uses a helper function', 'recursion']
	
	latex_outputs = {}
	for prefix, data in failure_data.items():
		latex_code = []
		for i, failure_type in enumerate(failure_types_order):
			coordinates = []
			
			for technique in techniques_order:
				if technique in data:
					avg_failures = data[technique].get(failure_type, 0) / run_counts_dict[technique]
					coordinates.append(f"({formatted_technique_names[technique]},{avg_failures:.2f})")
					
			fill_option = f"fill={fill_colors[i]}" if fill_colors[i] else ""
			latex_code.append(f"\\addplot+[ybar, {fill_option}] plot coordinates {{{' '.join(coordinates)}}};")
		
		latex_outputs[prefix] = "\n".join(latex_code) + "\n\\legend{" + ",".join(failure_types_order) + "}"
	
	return latex_outputs

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)

	folder_path = sys.argv[1]
	
	failure_data = get_failure_data(folder_path)
	run_count_dict = analysis.count_runs_by_technique(folder_path)
	latex_outputs = generate_latex_code(failure_data, run_count_dict)
	
	for prefix, latex_output in latex_outputs.items():
		print(f"\nLaTeX for {prefix}:\n")
		print(latex_output)
		
	print("Total statistics:")
	print(failure_data)
