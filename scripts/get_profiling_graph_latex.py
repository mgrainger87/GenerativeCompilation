import pandas as pd
from run_context import ModelContext
import sys
import os

def generate_latex_for_technique_averaged_filled(technique_df, technique_name, threshold=0.05):
	# Initialize LaTeX output
	latex_output = f"\\begin{{figure}}[h]\n\\begin{{tikzpicture}}\n"
	latex_output += "\\begin{axis}[\n"
	latex_output += "    xlabel={Optimization Passes},\n"
	latex_output += "    ylabel={Normalized CPU Time},\n"
	latex_output += "    xmin=0, xmax=5,\n"
	latex_output += "    ymin=0, ymax=1.01,\n"
	latex_output += "    xtick={1,2,3,4,5},\n"
	latex_output += "    ymajorgrids=true,\n"
	latex_output += "    grid style=dashed,\n"
	latex_output += "]\n\n"

	# Generate LaTeX for the averaged data
	latex_output += "\\addplot[\n    color=blue,\n    mark=square,\n    ] coordinates {\n"
	latex_output += "	(0,1)\n"
	# Compute the average for each file type with filling missing values
	for i in range(1, 6):
		file_values = []
		for _, problem_df in technique_df.groupby('problem'):
			file_pattern = f"clang_generated_llm_optimized_{i}.asm"
			value = problem_df[problem_df['Filename'] == file_pattern]['Normalized CPU Time'].values
			
			# If the value is missing, search for previous files
			j = i - 1
			while len(value) == 0 and j >= 1:
				file_pattern = f"clang_generated_llm_optimized_{j}.asm"
				value = problem_df[problem_df['Filename'] == file_pattern]['Normalized CPU Time'].values
				j -= 1

			# Append the found value or 0 if none is found
			file_values.append(value[0] if len(value) > 0 else 0)
		
		# Compute average for the current file type
		avg_cpu_time = sum(file_values) / len(file_values) if file_values else 0
		latex_output += f"    ({i},{avg_cpu_time})\n"

	latex_output += "};\n"
	
	# Compute the average values for the specified filenames
	filenames = [
		"clang_generated_O3_optimized.asm",
		"clang_generated_unoptimized.asm",
		"clang_generated_O1_optimized.asm",
		"clang_generated_O2_optimized.asm"
	]
	labels = ["Clang O3", "Clang Unoptimized", "Clang O1", "Clang O2"]
	averages_lines = {label: technique_df[technique_df['Filename'] == filename]['Normalized CPU Time'].mean() for label, filename in zip(labels, filenames)}

	# Sort by priority and decide which lines to draw
	drawn_values = []
	for label, avg in averages_lines.items():
		draw = True
		for drawn_value in drawn_values:
			if abs(drawn_value - avg) < threshold:
				draw = False
				break
		if draw:
			latex_output += f"\\draw [dashed, red] (axis cs: 0,{avg}) -- (axis cs: 5,{avg}) node[anchor=east, pos=1, yshift=-2mm] {{{label}}};\n"
			drawn_values.append(avg)

	latex_output += "\\end{axis}\n" 
	latex_output += "\\end{tikzpicture}\n"
	latex_output += f"\\caption{{Optimization results for {technique_name}.}}\n"
	latex_output += f"\\label{{fig:optimization_{technique_name.replace(' ', '')}}}\n"
	latex_output += "\\end{figure}\n"
	return latex_output

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python script_name.py <folder_path>")
		sys.exit(1)
	
	folder_path = sys.argv[1]
	
	for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
		combinedDataPath = modelContext.combinedAnalysisDataPath()
		if os.path.exists(combinedDataPath):
			combined_df = pd.read_csv(combinedDataPath)
			print(generate_latex_for_technique_averaged_filled(combined_df, "overall"))
			for technique_name, technique_df in combined_df.groupby('technique'):
				# print(f"\n\nTechnique: {technique_name}")
				print(generate_latex_for_technique_averaged_filled(technique_df, technique_name))
