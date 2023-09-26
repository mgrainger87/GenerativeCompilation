import os
import sys
import pandas as pd
from collections import defaultdict

import os
from collections import defaultdict
import pandas as pd

def collect_data(directory):
	data_list = []
	for subdir in os.listdir(directory):
		subdir_path = os.path.join(directory, subdir)
		if os.path.isdir(subdir_path):
			for subsubdir in os.listdir(subdir_path):
				subsubdir_path = os.path.join(subdir_path, subsubdir)
				if os.path.isdir(subsubdir_path):
					for file_name in os.listdir(subsubdir_path):
						if file_name.endswith('.asm'):
							parts = file_name.split('_')
							error_type = parts[-1].split('.')[0]
							count = int(parts[-2])
							file_path = os.path.join(subsubdir_path, file_name)
							data_list.append({'error_count': count, 'error_type': error_type, 'file_path': file_path})
	return pd.DataFrame(data_list)

def calculate_consecutive_errors(data_df):
	data_df = data_df.sort_values(by='error_count').reset_index(drop=True)
	consecutive_error_counts = defaultdict(list)
	current_error_type = None
	consecutive_count = 0
	for index, row in data_df.iterrows():
		error_type = row['error_type']
		if error_type != current_error_type or index == len(data_df) - 1:
			if current_error_type is not None:
				consecutive_error_counts[current_error_type].append(consecutive_count)
			consecutive_count = 1
			current_error_type = error_type
		else:
			consecutive_count += 1
	average_consecutive_errors = {error_type: sum(counts) / len(counts) for error_type, counts in consecutive_error_counts.items()}
	return average_consecutive_errors

def calculate_number_of_failures(data_df):
	# Sort the data by error_count to ensure the data is in order
	data_df = data_df.sort_values(by='error_count').reset_index(drop=True)
	
	# Initialize variables to keep track of the number of failures for each error type
	failure_counts = defaultdict(int)
	current_error_type = None  # The current error type being processed
	
	# Iterate through each row in the DataFrame
	for index, row in data_df.iterrows():
		error_type = row['error_type']
		# If the error type has changed, increment the failure count for the current error type
		if error_type != current_error_type:
			failure_counts[error_type] += 1
			# Update the current error type
			current_error_type = error_type
	
	return failure_counts	

def identify_special_cases(data_df):
	special_cases = defaultdict(list)
	current_error_type = None
	current_total_errors = 0
	current_error_type_errors = 0
	
	for index, row in data_df.iterrows():
		error_type = row['error_type']
		error_count = row['error_count']
		file_path = row['file_path']
	
		# Reset counts if error type changes
		if error_type != current_error_type:
			current_error_type = error_type
			current_total_errors = error_count
			current_error_type_errors = error_count
		else:
			current_total_errors += error_count
			current_error_type_errors += error_count
	
		# Check the conditions for special cases
		if current_error_type_errors >= 5 or current_total_errors >= 10:
			special_cases[current_error_type].append(file_path)
	
	return special_cases

def calculate_average_errors_after_first_failure(data_df):
	data_df = data_df.sort_values(by='error_count').reset_index(drop=True)
	total_errors_after_first_failure = defaultdict(int)
	error_type_occurrences = defaultdict(int)
	current_error_type = None
	for index, row in data_df.iterrows():
		error_type = row['error_type']
		error_count = row['error_count']
		if error_type != current_error_type:
			current_error_type = error_type
			error_type_occurrences[error_type] += 1
		total_errors_after_first_failure[error_type] += error_count - 1  # Subtract 1 to exclude the first error
	average_errors_after_first_failure = {error_type: total_errors / max(occurrences, 1)
										  for error_type, total_errors, occurrences in zip(
											  total_errors_after_first_failure.keys(),
											  total_errors_after_first_failure.values(),
											  error_type_occurrences.values())}
	return average_errors_after_first_failure

def calculate_failure_reach(data_df):
	data_df = data_df.sort_values(by='error_count').reset_index(drop=True)
	reach_counts = defaultdict(int)
	error_type_occurrences = defaultdict(int)
	current_error_type = None
	current_error_count = 0
	for index, row in data_df.iterrows():
		error_type = row['error_type']
		error_count = row['error_count']
		if error_type != current_error_type:
			current_error_type = error_type
			current_error_count = error_count
		error_type_occurrences[error_type] += 1
		if error_count >= 10 or current_error_count >= 5:
			reach_counts[error_type] += 1
	average_reach_rate = {error_type: reach_count / occurrences
						  for error_type, reach_count, occurrences in zip(
							  reach_counts.keys(),
							  reach_counts.values(),
							  error_type_occurrences.values())}
	return average_reach_rate



def count_failures_by_file_paths(directory):
	failure_counts = defaultdict(int)
	for subdir in os.listdir(directory):
		subdir_path = os.path.join(directory, subdir)
		if os.path.isdir(subdir_path):
			for subsubdir in os.listdir(subdir_path):
				subsubdir_path = os.path.join(subdir_path, subsubdir)
				if os.path.isdir(subsubdir_path):
					for file_name in os.listdir(subsubdir_path):
						for error_type in ['COMPILER', 'CORRECTNESS', 'EXECUTION', 'LINKER']:
							if error_type in file_name:
								failure_counts[error_type] += 1
	return failure_counts

def verify_calculations(directory, number_of_failures, average_consecutive_errors):
	failure_counts_by_file_paths = count_failures_by_file_paths(directory)
	verification_results = {}
	for error_type in failure_counts_by_file_paths.keys():
		expected_total_failures = number_of_failures[error_type] * average_consecutive_errors[error_type]
		verification_results[error_type] = {
			'Expected Total Failures': expected_total_failures,
			'Actual Total Failures': failure_counts_by_file_paths[error_type],
			'Verification': expected_total_failures == failure_counts_by_file_paths[error_type]
		}
	return verification_results

def generate_latex_plot(metrics):
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
		metrics['Average Errors After First Failure'].get(error_types_mapping[et], 0) - metrics['Average Consecutive Errors'].get(error_types_mapping[et], 0)
		for et in error_types
	]
	average_reach_rate_percent = [
		metrics['Average Reach Rate to 10 Total Failures or 5 Failures of the Same Type'].get(error_types_mapping[et], 0) * 100
		for et in error_types
	]

	# Create the LaTeX tikzpicture environment for the plot
	latex_plot = """
\\begin{{tikzpicture}}
%%%%% GENERATING CODE FROM SOURCE
% Primary y-axis (bar chart)
\\begin{{axis}}[
	ybar stacked,
	bar width=1cm,
	width=8cm,
	height=7cm,
	enlargelimits=0.15,
	legend style={{
		at={{(0.5,-0.2)}},
		anchor=north,
		legend columns=2,
		column sep=0.5cm,
		legend cell align=left,
	}},
	ylabel={{Mistakes per Compilation Attempt}},
	ylabel near ticks,
	ymin=0,
	ymax=5,
	axis y line*=left,
	symbolic x coords={{Assembler,Linker,Execution,Correctness}},
	xtick=data,
	xticklabels={{Assembler, Linker, Execution, Correctness}},
	xticklabel style={{rotate=0, anchor=north, align=center, text width=1.5cm,xshift=0pt}},
	xtick style={{draw=none}},
	legend entries={{Assembler,Linker,Execution,Correctness}},
	]
\\addplot+[ybar, fill=cyan] coordinates {{
	{0}
}};
\\addplot+[ybar] coordinates {{
	{1}
}};
\\legend{{Errors of Same Type, Further Errors}}
\\end{{axis}}

% Secondary y-axis (line graph)
\\begin{{axis}}[
	width=8cm,
	height=7cm,
	enlargelimits=0.15,
	axis y line*=right,
	axis x line=none,
	symbolic x coords={{Assembler,Linker,Execution,Correctness}},
	xtick=data,
	ylabel={{Compilation Success Rate (\\%)}},
	ylabel near ticks,
	ymin=0,
	ymax=100,
	ytick={{0,20,...,100}},
	yticklabel=$\\pgfmathprintnumber{{\\tick}}$
	]
\\addplot[sharp plot, mark=*] coordinates {{
	{2}
}};
\\end{{axis}}
\\end{{tikzpicture}}
""".format(
		' '.join(f'({et},{value})' for et, value in zip(error_types, average_consecutive_errors)),
		' '.join(f'({et},{value})' for et, value in zip(error_types, difference)),
		' '.join(f'({et},{value})' for et, value in zip(error_types, average_reach_rate_percent)),
	)

	return latex_plot
		
def main():
	
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)
	
	directory = sys.argv[1]
	data_df = collect_data(directory)
	
	average_consecutive_errors = calculate_consecutive_errors(data_df)
	average_errors_after_first_failure = calculate_average_errors_after_first_failure(data_df)
	average_reach_rate = calculate_failure_reach(data_df)
	number_of_failures = calculate_number_of_failures(data_df)
	special_cases = identify_special_cases(data_df)
	verification_results = verify_calculations(directory, number_of_failures, average_consecutive_errors)

	analysis_results = {
		'Average Consecutive Errors': average_consecutive_errors,
		'Average Errors After First Failure': average_errors_after_first_failure,
		'Average Reach Rate to 10 Total Failures or 5 Failures of the Same Type': average_reach_rate,
		'Total Failure Sequences': number_of_failures,
		'Special Cases File Paths': special_cases,
		'Verification Results': verification_results
	}
	
	return analysis_results

if __name__ == '__main__':
	results = main()
	for key, value in results.items():
		print(f'{key}: {value}')
		
	print(generate_latex_plot(results))
