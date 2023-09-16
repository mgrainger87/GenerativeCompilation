import os
import sys
from run_context import ModelContext

def get_failure_histogram(folder_path):
	failure_histogram = {}

	for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
		for problem in modelContext.GetProblemContexts():
			for run in problem.GetExistingRunContexts():
				files = os.listdir(run.failurePath())
				count = sum(1 for file in files if file.startswith("generation_failure"))
				failure_histogram.setdefault(count, 0)
				failure_histogram[count] += 1

	return failure_histogram
	
def generate_latex_histogram(data):
	# Sort the dictionary by its keys
	sorted_data = sorted(data.items())
	
	# Extract keys and values
	keys = [str(item[0]) for item in sorted_data]
	values = [item[1] for item in sorted_data]
	
	# Create symbolic x coordinates
	symbolic_x_coords = ",".join(keys)
	
	# Create plot coordinates
	coordinates = " ".join([f"({key},{value})" for key, value in zip(keys, values)])
	
	# Construct the LaTeX code
	latex_code = f"""
\\begin{{tikzpicture}}
\\begin{{axis}}[
	ybar,
	enlargelimits=0.15,
	ylabel={{Count}},
	symbolic x coords={{{symbolic_x_coords}}},
	xtick=data,
	nodes near coords,
	nodes near coords align={{vertical}},
	]
\\addplot coordinates {{{coordinates}}};
\\end{{axis}}
\\end{{tikzpicture}}
"""
	
	return latex_code


if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)
	
	folder_path = sys.argv[1]
	
	failure_histogram = get_failure_histogram(folder_path)
	
	print("Frequencies:")
	print(failure_histogram)
	
	print("LaTeX:")
	print(generate_latex_histogram(failure_histogram))
