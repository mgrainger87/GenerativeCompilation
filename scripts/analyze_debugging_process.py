import os
import sys
import pandas as pd
from collections import defaultdict

import os
from collections import defaultdict
import pandas as pd
import re


def collect_data(directory):
	data_list = []
	for root, dirs, files in os.walk(directory):
		for file_name in files:
			if file_name.endswith('.asm'):
				# Extract failure_type
				failure_type = file_name.split('_')[-1].split('.')[0]
				# Extract iteration_number and failure_number
				iteration_failure_match = re.match(r'.*_(\d+)?_failure_(\d+)_', file_name)
				if iteration_failure_match:
					iteration_number = int(iteration_failure_match.group(1)) if iteration_failure_match.group(1) else -1
					failure_number = int(iteration_failure_match.group(2))
				else:
					# Handle the case where the filename does not match the regex pattern
					parts = file_name.split('_')
					iteration_number = -1 if 'failure' in parts[-3] else int(parts[-3])
					failure_number = int(parts[-2])
				# Extract problem_number and run_number
				path_parts = root.split('/')
				problem_number = int(path_parts[-2])
				run_number = int(path_parts[-1])  # Convert run_number to int
				file_path = os.path.join(root, file_name)
				data_list.append({
					'problem_number': problem_number,
					'run_number': run_number,
					'iteration_number': iteration_number,
					'failure_number': failure_number,
					'failure_type': failure_type,
					'file_path': file_path
				})
	return pd.DataFrame(data_list)

def calculate_average_consecutive_errors(data_df):
	total_consecutive_error_counts = defaultdict(int)  # Total count of consecutive errors per failure type
	occurrence_counts = defaultdict(int)  # Count of occurrences per failure type
	
	# Get all unique (problem_number, run_number, iteration_number) pairs
	unique_pairs = data_df[['problem_number', 'run_number', 'iteration_number']].drop_duplicates().values
	
	for pair in unique_pairs:
		problem_number, run_number, iteration_number = pair
		consecutive_error_counts = calculate_consecutive_errors(data_df, problem_number, run_number, iteration_number)
		
		# Update the total counts and occurrence counts
		for error_type, count in consecutive_error_counts.items():
			total_consecutive_error_counts[error_type] += count
			occurrence_counts[error_type] += 1
	
	# Calculate the average number of consecutive errors for each error type
	average_consecutive_errors = {
		error_type: total_count / occurrence_counts[error_type] 
		for error_type, total_count in total_consecutive_error_counts.items()
	}
	
	return average_consecutive_errors

def calculate_number_of_failures(data_df):
	# Initialize variables to keep track of the number of failure sequences for each error type
	failure_sequence_counts = defaultdict(int)
	
	# Get all unique (problem_number, run_number, iteration_number) pairs
	unique_pairs = data_df[['problem_number', 'run_number', 'iteration_number']].drop_duplicates().values
	
	for pair in unique_pairs:
		problem_number, run_number, iteration_number = pair
		
		# Filter the DataFrame based on the current (problem_number, run_number, iteration_number) pair
		filtered_df = data_df[(data_df['problem_number'] == problem_number) & 
							  (data_df['run_number'] == run_number) & 
							  (data_df['iteration_number'] == iteration_number)]
		
		# Sort the filtered data by failure_number to ensure the failures are processed in order
		filtered_df = filtered_df.sort_values(by='failure_number').reset_index(drop=True)
		
		current_error_type = None  # The current error type being processed
		
		# Iterate through each row in the filtered DataFrame
		for index, row in filtered_df.iterrows():
			error_type = row['failure_type']
			# If the error type has changed, increment the failure sequence count for the current error type
			if error_type != current_error_type:
				failure_sequence_counts[error_type] += 1
				# Update the current error type
				current_error_type = error_type
	
	return failure_sequence_counts
	
def identify_special_cases(data_df):
	special_cases_counts = defaultdict(int)  # Dictionary to keep track of special cases counts per failure type
	
	# Get all unique (problem_number, run_number, iteration_number) pairs
	unique_pairs = data_df[['problem_number', 'run_number', 'iteration_number']].drop_duplicates().values
	
	for pair in unique_pairs:
		problem_number, run_number, iteration_number = pair
		
		# Filter the DataFrame based on the current (problem_number, run_number, iteration_number) pair
		filtered_df = data_df[(data_df['problem_number'] == problem_number) & 
							  (data_df['run_number'] == run_number) & 
							  (data_df['iteration_number'] == iteration_number)]
		
		# Sort the filtered data by failure_number to ensure the failures are processed in order
		filtered_df = filtered_df.sort_values(by='failure_number').reset_index(drop=True)
		
		current_error_type = None  # The current error type being processed
		current_total_errors = 0  # Reset total errors for each new pair
		current_error_type_errors = 0  # Reset error type errors for each new pair
		
		# Iterate through each row in the filtered DataFrame
		for index, row in filtered_df.iterrows():
			error_type = row['failure_type']
			
			# Reset counts if error type changes
			if error_type != current_error_type:
				current_error_type = error_type
				current_error_type_errors = 1  # Reset to 1 as we are encountering a failure
			else:
				current_error_type_errors += 1
			
			# Always increment total errors for each failure
			current_total_errors += 1
			
			# Check the conditions for special cases
			if current_error_type_errors == 5 or current_total_errors == 10:
				special_cases_counts[error_type] += 1  # Increment the count for the current error type
	
	return special_cases_counts

def calculate_average_errors_including_first_failure(data_df):
		total_errors_including_first_failure = defaultdict(int)  # Total errors including the first failure per error type
		error_type_occurrences = defaultdict(int)  # Number of occurrences per error type
	
		# Get all unique (problem_number, run_number, iteration_number) pairs
		unique_pairs = data_df[['problem_number', 'run_number', 'iteration_number']].drop_duplicates().values
		
		for pair in unique_pairs:
			problem_number, run_number, iteration_number = pair
			
			# Filter the DataFrame based on the current (problem_number, run_number, iteration_number) pair
			filtered_df = data_df[(data_df['problem_number'] == problem_number) & 
								  (data_df['run_number'] == run_number) & 
								  (data_df['iteration_number'] == iteration_number)]
			
			# Sort the filtered data by failure_number to ensure the failures are processed in order
			filtered_df = filtered_df.sort_values(by='failure_number').reset_index(drop=True)
			
			current_error_type = None  # The current error type being processed
			error_sequence_count = 0  # Counter for the number of errors in the current sequence
			
			# Iterate through each row in the filtered DataFrame
			for index, row in filtered_df.iterrows():
				error_type = row['failure_type']
				if error_type != current_error_type:
					# If the error type changes, update the total errors count for the previous error type
					if current_error_type is not None:
						total_errors_including_first_failure[current_error_type] += error_sequence_count
						error_type_occurrences[current_error_type] += 1
					# Reset the error sequence count and update the current error type
					error_sequence_count = 1
					current_error_type = error_type
				else:
					# If the error type remains the same, increment the error sequence count
					error_sequence_count += 1
			
			# Update the total errors count for the last error type in the filtered DataFrame
			if current_error_type is not None:
				total_errors_including_first_failure[current_error_type] += error_sequence_count
				error_type_occurrences[current_error_type] += 1
		
		# Calculate the average number of errors including the first failure for each error type
		average_errors_including_first_failure = {
			error_type: total_errors / max(occurrences, 1)
			for error_type, total_errors, occurrences in zip(
				total_errors_including_first_failure.keys(),
				total_errors_including_first_failure.values(),
				error_type_occurrences.values())
		}
		
		return average_errors_including_first_failure
	
	# Recalculate the average number of errors including the first failure for each error type
	average_errors_including_first_failure = calculate_errors_including_first_failure(extracted_data_df)
	average_errors_including_first_failure

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



def count_failures_by_type(data_df):
	# Group the data by failure_type and count the occurrences of each type
	failure_counts = data_df.groupby('failure_type').size().to_dict()
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
	average_errors_after_first_failure = calculate_average_errors_including_first_failure(data_df)
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
