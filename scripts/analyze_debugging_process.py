import os
import sys
import pandas as pd
from collections import defaultdict
from collections import Counter	
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
		
		# Filter the DataFrame based on the current (problem_number, run_number, iteration_number) pair
		filtered_df = data_df[(data_df['problem_number'] == problem_number) & 
						  	(data_df['run_number'] == run_number) & 
						  	(data_df['iteration_number'] == iteration_number)]
		
		# Sort the filtered data by failure_number to ensure the failures are processed in order
		filtered_df = filtered_df.sort_values(by='failure_number').reset_index(drop=True)
		current_error_type = None
		consecutive_count = 0
		previous_failure_number = -1  # Initialize with -1 since failure_number starts from 1
		
		for index, row in filtered_df.iterrows():
			error_type = row['failure_type']
			failure_number = row['failure_number']

			if error_type != current_error_type or (failure_number != previous_failure_number + 1):
				# When the error type changes or a new sequence of the same error type starts,
				# update the total errors and occurrences for the current error type
				if current_error_type is not None:
					total_consecutive_error_counts[current_error_type] += consecutive_count
					occurrence_counts[current_error_type] += 1
				# Reset the consecutive count and update the current error type
				consecutive_count = 1
				current_error_type = error_type
			else:
				# If the error type remains the same and the failure number is consecutive,
				# increment the consecutive count
				consecutive_count += 1
			previous_failure_number = failure_number  # Update the previous failure number
		
		# Update the total errors and occurrences for the last error type in the filtered DataFrame
		if current_error_type is not None:
			total_consecutive_error_counts[current_error_type] += consecutive_count
			occurrence_counts[current_error_type] += 1
	
	# Calculate the average number of consecutive errors for each error type
	average_consecutive_errors = {
		error_type: total_count / occurrence_counts[error_type] 
		for error_type, total_count in total_consecutive_error_counts.items()
	}
	
	return average_consecutive_errors

def calculate_number_of_failure_sequences(data_df):
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
	total_errors_including_first_failure = defaultdict(list)  # List of total errors including the first failure per error type

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
		
		seen_error_type = None
		# Iterate through each row in the filtered DataFrame
		for index, row in filtered_df.iterrows():
			error_type = row['failure_type']
			
			if error_type != seen_error_type:
				seen_error_type = error_type
				# If a new occurrence of a failure type is found,
				# count all subsequent failures including the current one
				total_errors = len(filtered_df) - index
				# Add the total errors count to the list for the current error type
				total_errors_including_first_failure[error_type].append(total_errors)

	# Calculate the average number of errors including the first failure for each error type
	average_errors_including_first_failure = {
		error_type: sum(counts) / len(counts) if counts else 0
		for error_type, counts in total_errors_including_first_failure.items()
	}

	return average_errors_including_first_failure

def calculate_total_terminal_failures(data_df):
	terminal_failure_counts = defaultdict(int)  # Counts for terminal failures per error type

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
		consecutive_count = 0  # Counter for consecutive failures of the current error type
		
		# Iterate through each row in the filtered DataFrame
		for index, row in filtered_df.iterrows():
			error_type = row['failure_type']
			if error_type != current_error_type:
				# Check for terminal failure conditions for the previous error type
				if consecutive_count >= 5:
					terminal_failure_counts[current_error_type] += 1
				# Reset the counters and update the current error type
				consecutive_count = 1
				current_error_type = error_type
			else:
				# If the error type remains the same, increment the consecutive count
				consecutive_count += 1
		
		# Check for terminal failure conditions for the last error type in the filtered DataFrame
		if consecutive_count >= 5:
			terminal_failure_counts[current_error_type] += 1
		if index >= 9:
			terminal_failure_counts[current_error_type] += 1

	return terminal_failure_counts


def count_failures_by_type(data_df):
	# Group the data by failure_type and count the occurrences of each type
	failure_counts = data_df.groupby('failure_type').size().to_dict()
	return failure_counts

def verify_calculations(dataframe, number_of_failures, average_errors_including_first_failure):
	failure_counts_by_file_paths = count_failures_by_type(dataframe)
	verification_results = {}
	for error_type in failure_counts_by_file_paths.keys():
		expected_total_failures = number_of_failures[error_type] * average_errors_including_first_failure[error_type]
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
	average_failures_after_first = [metrics['Average Errors After First Failure'].get(error_types_mapping[et], 0) for et in error_types]
	difference = [
		metrics['Average Errors After First Failure'].get(error_types_mapping[et], 0) - metrics['Average Consecutive Errors'].get(error_types_mapping[et], 0)
		for et in error_types
	]
	average_reach_rate_percent = [
		(1-metrics['Average Reach Rate to 10 Total Failures or 5 Failures of the Same Type'].get(error_types_mapping[et], 0)) * 100
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
		at={{(0.5,-0.1)}},
		anchor=north,
		legend columns=1,
		column sep=0.5cm,
		legend cell align=left,
	}},
	ylabel={{Average Mistake Count}},
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
{2}
\\legend{{Consecutive mistakes in phase, Further mistakes in compilation attempt}}
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
	ylabel={{Error Resolution Success Rate (\\%)}},
	ylabel near ticks,
	ymin=0,
	ymax=100,
	ytick={{0,20,...,100}},
	yticklabel=$\\pgfmathprintnumber{{\\tick}}$,
	nodes near coords={{
	\\pgfmathprintnumber[precision=0, fixed zerofill]{{\pgfplotspointmeta}}
	}},
	every node near coord/.append style={{font=\\tiny}}
	]
\\addplot[sharp plot, mark=*] coordinates {{
	{3}
}};
\\end{{axis}}
\\end{{tikzpicture}}
""".format(
		' '.join(f'({et},{value})' for et, value in zip(error_types, average_consecutive_errors)),
		' '.join(f'({et},{value})' for et, value in zip(error_types, difference)),
		'\n'.join(f'\\node at (axis cs:{et},{value}) [above] {{{value:.2f}}};' for et, value in zip(error_types, average_failures_after_first)),
		' '.join(f'({et},{value})' for et, value in zip(error_types, average_reach_rate_percent)),
	)

	return latex_plot
		
def main():
	
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)
	
	directory = sys.argv[1]
	data_df = collect_data(directory)
	
	# When an error type occurs, how many of them happen in a row?
	average_consecutive_errors = calculate_average_consecutive_errors(data_df)
	
	# When an error type occurs, how many more errors are there for that run?
	average_total_errors_after_first_failure = calculate_average_errors_including_first_failure(data_df)
	
	# How many total failure sequences were there?
	number_of_failure_sequences = calculate_number_of_failure_sequences(data_df)
	
	# Total errors = average consecutive errors * number of failure sequences
	verification_results = verify_calculations(data_df, number_of_failure_sequences, average_consecutive_errors)

	# How many failure sequences ended the run?
	total_terminal_failures = calculate_total_terminal_failures(data_df)

	terminal_failure_rates = {
			error_type: (total_terminal_failures[error_type] / max(number_of_failure_sequences[error_type], 1))
			for error_type in total_terminal_failures
		}

	analysis_results = {
		'Average Consecutive Errors': average_consecutive_errors,
		'Average Errors After First Failure': average_total_errors_after_first_failure,
		'Total Terminal Failures': total_terminal_failures,
		'Average Reach Rate to 10 Total Failures or 5 Failures of the Same Type': terminal_failure_rates,
		'Total Failure Sequences': number_of_failure_sequences,
		'Verification Results': verification_results
	}
	
	return analysis_results

if __name__ == '__main__':
	results = main()
	for key, value in results.items():
		print(f'{key}: {value}')
	print('\n\nLaTeX:\n')
	print(generate_latex_plot(results))
