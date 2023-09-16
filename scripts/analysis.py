from run_context import ModelContext
import os

def count_runs_by_technique(folder_path):
	runs_by_technique = {}
	for modelContext in ModelContext.ModelContextsForDirectory(folder_path):
		for problemContext in modelContext.GetProblemContexts():
			
			technique_file = problemContext.techniquePath()
			if os.path.exists(technique_file):
				with open(technique_file, 'r') as f:
					technique = f.read().strip()
	
			runs_by_technique.setdefault(technique, 0)
			runCount = 0
			for runContext in problemContext.GetExistingRunContexts():
				runCount += 1
			runs_by_technique[technique] += runCount
				
	return runs_by_technique
