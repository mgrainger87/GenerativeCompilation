import os

class RunContext:
	def __init__(self, model, problem_number, run_number, problem_path, generated_path, profiling_path, visualization_path):
		self.model = model
		self.problem_number = problem_number
		self.run_number = run_number
		self.problem_path = problem_path
		self.generated_path = generated_path
		self.profiling_path = profiling_path
		self.visualization_path = visualization_path

	def __repr__(self):
		return f"RunContext(Model: {self.model}, Problem: {self.problem_number}, Run: {self.run_number})"
		
	def compilationUnitPath(self):
		return os.path.join(self.problem_path, "compilation_unit.c")
		
	def testDataPath(self):
		return os.path.join(self.problem_path, "test_data.csv")

	
	def profilingResultsPath(self):
		return os.path.join(self.profiling_path, "performance_results.csv")
	
	@classmethod
	def RunContextsForDirectory(cls, root_directory):
		runs_data = []

		# Start by iterating through the 'generated' directory
		generated_path = os.path.join(root_directory, 'generated')
		for model in os.listdir(generated_path):
			for problem_number in os.listdir(os.path.join(generated_path, model)):
				for run_number in os.listdir(os.path.join(generated_path, model, problem_number)):
					
					# Construct paths for problem, generated, profiling and visualization
					problem_path = os.path.join(root_directory, 'problems', problem_number)
					generated_run_path = os.path.join(generated_path, model, problem_number, run_number)
					profiling_run_path = os.path.join(root_directory, 'profiling', model, problem_number, run_number)
					visualization_run_path = os.path.join(root_directory, 'visualization', model, problem_number, run_number)
					
					run_context = cls(model, problem_number, run_number, problem_path, generated_run_path, profiling_run_path, visualization_run_path)
					runs_data.append(run_context)
					
		return runs_data
