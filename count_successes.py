import os
from collections import defaultdict
import csv
import sys
from run_context import ModelContext

def normalize_filename(filename):
	"""Remove trailing _1, _2, etc. suffixes from file names."""
	if "_" in filename:
		base, suffix = filename.rsplit("_", 1)
		if suffix.isdigit():
			return base
	return filename

def process_directory(directory_path):
	# Dictionary to store counts of valid files
	file_counts = defaultdict(int)

	# Traverse through the directory recursively
	for root, dirs, files in os.walk(directory_path):
		# Ignore the __MACOSX directory
		if "__MACOSX" not in root:
			for file in files:
				# Read the file content
				if os.path.splitext(file)[1] == ".asm":
					with open(os.path.join(root, file), 'r') as f:
						content = f.read().strip()
					
					# Check if content is not "Manually failed."
					if content != "Manually failed.":
						normalized_name = normalize_filename(file)
						file_counts[normalized_name] += 1
						
	return file_counts

def write_to_csv(file_counts, output_path):
	# Write the results to the CSV file
	with open(output_path, 'w', newline='') as csvfile:
		csv_writer = csv.writer(csvfile)
		
		# Write the header
		csv_writer.writerow(["Filename", "Count"])
		# Write the counts for each file
		for filename, count in file_counts.items():
			csv_writer.writerow([filename, count])

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Please provide the directory path as an argument.")
		sys.exit(1)
	
	directory_path = sys.argv[1]
	
	for model in ModelContext.ModelContextsForDirectory(directory_path):
		for problem in model.GetProblemContexts():
			# Get the failure counts
			successes_count = process_directory(problem.generatedPath())
			
			# Write to CSV
			csv_path = os.path.join(problem.generatedPath(), "generated_summary.csv")
			write_to_csv(successes_count, csv_path)
			print(f"Results written to: {csv_path}")
			
	
