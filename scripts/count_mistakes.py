import os
import csv
from collections import defaultdict
import sys
from run_context import ModelContext

def count_failures(directory_path):
    # Define failure types and prefixes
    failure_types = ["COMPILER", "LINKER", "EXECUTION", "CORRECTNESS"]
    failure_prefixes = ["generation_failure", "optimization_failure"]
    
    # Initialize a dictionary to count the failures
    failures_count = defaultdict(lambda: defaultdict(int))

    # Traverse the directory and count failures
    for root, dirs, files in os.walk(directory_path):
        # Ignore the __MACOSX directory
        if "__MACOSX" not in root:
            for file in files:
                for failure_type in failure_types:
                    for prefix in failure_prefixes:
                        if failure_type in file and file.startswith(prefix):
                            failures_count[prefix][failure_type] += 1

    return failures_count

def write_to_csv(failures_count, output_path):
    # Write the counts to the CSV file
    with open(output_path, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(['Failure Type', 'Prefix', 'Count'])
        for prefix, failure_dict in failures_count.items():
            for failure_type, count in failure_dict.items():
                csvwriter.writerow([failure_type, prefix, count])

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide the directory path as an argument.")
        sys.exit(1)

    directory_path = sys.argv[1]

    for model in ModelContext.ModelContextsForDirectory(directory_path):
        for problem in model.GetProblemContexts():
            # Get the failure counts
            failures_count = count_failures(problem.failurePath())
            
            # Write to CSV
            csv_path = os.path.join(problem.failurePath(), "failure_types.csv")
            write_to_csv(failures_count, csv_path)
            print(f"Results written to: {csv_path}")
