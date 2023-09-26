import os
import sys
import pandas as pd
from collections import defaultdict

def analyze_data(extraction_dir):
	# Collect data from the extracted files
	data_list = []
	for root, dirs, files in os.walk(extraction_dir):
		for file_name in files:
			if file_name.endswith('.asm'):
				parts = file_name.split('_')
				error_type = parts[-1].split('.')[0]
				count = int(parts[-2])
				file_path = os.path.join(root, file_name)
				print(file_path)
				data_list.append({'error_count': count, 'error_type': error_type, 'file_path': file_path})

	# Convert the data list to a DataFrame
	data_df = pd.DataFrame(data_list)
	print(data_df)

	# Calculate metrics
	metrics = {}

	# 1. Average Consecutive Errors
	average_consecutive_errors = data_df.groupby('error_type')['error_count'].mean().to_dict()
	metrics['Average Consecutive Errors'] = average_consecutive_errors
	print(metrics)
	# 2. Average Errors After First Failure
	error_groups = data_df.groupby((data_df['error_type'] != data_df['error_type'].shift()).cumsum())
	average_errors_after_first_failure = error_groups['error_count'].sum().groupby(data_df['error_type']).mean().to_dict()
	metrics['Average Errors After First Failure'] = average_errors_after_first_failure

	# 3. Average Reach Rate to 10 Total Failures or 5 Failures of the Same Type
	reach_rate_data = defaultdict(lambda: {'reach_10_total': 0, 'reach_5_same_type': 0, 'total_sequences': 0})
	total_failures = 0
	previous_error_type = None
	for index, row in data_df.iterrows():
		error_type = row['error_type']
		error_count = row['error_count']
		total_failures += error_count
		if error_type != previous_error_type:
			# New failure sequence
			reach_rate_data[error_type]['total_sequences'] += 1
			if total_failures >= 10:
				reach_rate_data[error_type]['reach_10_total'] += 1
			if error_count >= 5:
				reach_rate_data[error_type]['reach_5_same_type'] += 1
			total_failures = error_count
		previous_error_type = error_type
	average_reach_rate = {
		error_type: (data['reach_10_total'] + data['reach_5_same_type']) / (2 * data['total_sequences'])
		for error_type, data in reach_rate_data.items()
	}
	metrics['Average Reach Rate to 10 Total Failures or 5 Failures of the Same Type'] = average_reach_rate

	# 4. Total Failure Sequences
	total_failure_sequences = data_df.groupby('error_type').size().to_dict()
	metrics['Total Failure Sequences'] = total_failure_sequences

	return metrics

def generate_latex_plot(metrics, output_file_path):
	# Prepare the data for the plot
	error_types_mapping = {
		'Assembler': 'COMPILER',
		'Linker': 'LINKER',
		'Execution': 'EXECUTION',
		'Correctness': 'CORRECTNESS'
	}
	error_types = ['Assembler', 'Linker', 'Execution', 'Correctness']
	average_consecutive_errors = [metrics['Average Consecutive Errors'].get(error_types_mapping[et], 0) for et in error_types]
	difference = [
		metrics['Average Errors After First Failure'].get(et, 0) - metrics['Average Consecutive Errors'].get(error_types_mapping[et], 0)
		for et in error_types
	]
	average_reach_rate_percent = [
		metrics['Average Reach Rate to 10 Total Failures or 5 Failures of the Same Type'].get(error_types_mapping[et], 0) * 100
		for et in error_types
	]

	# Create the LaTeX tikzpicture environment for the plot
	latex_plot = """
\\begin{{tikzpicture}}
\\begin{{axis}}[
	title={{Optimization}},
	xlabel={{Error Type}},
	ylabel={{Average Errors}},
	symbolic x coords={{'Assembler','Linker','Execution','Correctness'}},
	xtick=data,
	ybar stacked,
	bar width=30pt,
	legend style={{at={{(0.5,-0.15)}},
	anchor=north,legend columns=-1}},
	axis y line*=left,
]
\\addplot coordinates {{{{
	{0}
}}}};
\\addplot coordinates {{{{
	{1}
}}}};
\\legend{{Errors of Same Type, Further Errors}}
\\end{{axis}}

\\begin{{axis}}[
	ylabel={{Reach Rate (\\%)}},
	symbolic x coords={{'Assembler','Linker','Execution','Correctness'}},
	xtick=data,
	axis y line*=right,
	ymin=0, ymax=100,
	ytick={{0,20,...,100}},
	hide x axis
]
\\addplot[sharp plot, red, mark=*] coordinates {{{{
	{2}
}}}};
\\end{{axis}}
\\end{{tikzpicture}}
""".format(
		','.join(f'({et},{value})' for et, value in zip(error_types, average_consecutive_errors)),
		','.join(f'({et},{value})' for et, value in zip(error_types, difference)),
		','.join(f'({et},{value})' for et, value in zip(error_types, average_reach_rate_percent)),
	)

	# Write the LaTeX plot to the output file
	with open(output_file_path, 'w') as output_file:
		output_file.write(latex_plot)
		
def main():
	
	if len(sys.argv) < 3:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)
	
	directory = sys.argv[1]
	output_file_path = sys.argv[2]
	metrics = analyze_data(directory)
	generate_latex_plot(metrics, output_file_path)

if __name__ == '__main__':
	main()
