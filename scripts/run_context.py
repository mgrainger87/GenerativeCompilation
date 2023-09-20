import os

class ModelContext:
	def __init__(self, model, rootDirectory):
		self.__model = model
		self.__rootDirectory = rootDirectory

	def __repr__(self):
		return f"ModelContext(Model: {self.__model})"

	def model(self):
		return self.__model

	def __get_path(self, sub_directory, *args):
		path = os.path.join(self.__rootDirectory, sub_directory, *args)
		if not os.path.exists(path):
			os.makedirs(path)
		return path

	def problemPath(self):
		return self.__get_path('problems')

	def generatedPath(self):
		return self.__get_path('generated', self.__model)
		
	def analysisPath(self):
		return self.__get_path('analysis', self.__model)
		
	def markdownSummaryPath(self):
		return os.path.join(self.analysisPath(), "charts.md")
		
	def errorCountPath(self):
		return os.path.join(self.analysisPath(), "error_counts.csv")
		
	def errorLaTeXGraphPath(self):
		return os.path.join(self.analysisPath(), "error_counts.tex")
		
	def performanceLaTeXGraphPath(self):
		return os.path.join(self.analysisPath(), "performance.tex")
		
	def iterationPerformancePath(self):
		return os.path.join(self.analysisPath(), "iteration_performance.csv")

	def iterationPerformanceLaTeXGraphPath(self):
		return os.path.join(self.analysisPath(), "iteration_performance.tex")
		
	def combinedAnalysisDataPath(self):
		return os.path.join(self.analysisPath(), "combined_data.csv")

	@classmethod
	def ModelContextsForDirectory(cls, rootDirectory):
		modelContexts = []
		
		generatedPath = os.path.join(rootDirectory, 'generated')
		if os.path.exists(generatedPath):
			for model in os.listdir(generatedPath):
				if os.path.isdir(os.path.join(generatedPath, model)):
					modelContext = cls(model, rootDirectory)
					modelContexts.append(modelContext)
		return modelContexts

	def GetProblemContexts(self):
		problem_contexts = []
		
		def is_numeric(n):
			try:
				int(n)
				return True
			except ValueError:
				return False
		
		# Filter and sort the problem numbers in ascending order
		problemNumbers = sorted(filter(is_numeric, os.listdir(self.problemPath())), key=lambda x: int(x))
		
		for problemNumber in problemNumbers:
			if os.path.isdir(os.path.join(self.problemPath(), problemNumber)):
				problemContext = ProblemContext(self.__model, problemNumber, self.__rootDirectory)
				problem_contexts.append(problemContext)
		
		return problem_contexts

class ProblemContext:
	def __init__(self, model, problemNumber, rootDirectory):
		self.__model = model
		self.__problemNumber = problemNumber
		self.__rootDirectory = rootDirectory

	def __repr__(self):
		return f"ProblemContext(Model: {self.__model}, Problem: {self.__problemNumber})"
	
	def model(self):
		return self.__model
	
	def problemNumber(self):
		return self.__problemNumber

	def __get_path(self, sub_directory, *args):
		path = os.path.join(self.__rootDirectory, sub_directory, *args)
		if not os.path.exists(path):
			os.makedirs(path)
		return path

	def problemPath(self):
		return self.__get_path('problems', self.__problemNumber)
	
	def generatedPath(self):
		return self.__get_path('generated', self.__model, self.__problemNumber)
	
	def profilingPath(self):
		return self.__get_path('profiling', self.__model, self.__problemNumber)

	def analysisPath(self):
		return self.__get_path('analysis', self.__model, self.__problemNumber)
		
	def failurePath(self):
		return self.__get_path('failures', self.__model, self.__problemNumber)
	
	def visualizationPath(self):
		return self.__get_path('visualization', self.__model, self.__problemNumber)
	
	def compilationUnitPath(self):
		return os.path.join(self.problemPath(), "compilation_unit.c")
	
	def testDataPath(self):
		return os.path.join(self.problemPath(), "test_data.csv")
	
	def techniquePath(self):
		return os.path.join(self.problemPath(), "technique.txt")
	
	def profilingResultsPath(self):
		return os.path.join(self.profilingPath(), "performance_results.csv")
		
	def generationFailurePath(self):
		return os.path.join(self.problemPath(), "generation_failure.asm")
		
	def optimizationFailurePath(self):
		return os.path.join(self.problemPath(), "optimization_failure.asm")
		
	def generatedSummaryPath(self):
		return os.path.join(self.generatedPath(), "generated_summary.csv")
		
	def failureSummaryPath(self):
		return os.path.join(self.failurePath(), "failure_types.csv")

		
	@classmethod
	def ProblemContextsForDirectory(cls, rootDirectory):
		problemsData = []
		generatedPath = os.path.join(rootDirectory, 'generated')
		for model in os.listdir(generatedPath):
			for problemNumber in os.listdir(os.path.join(generatedPath, model)):
				problemContext = cls(model, problemNumber, rootDirectory)
				problemsData.append(problemContext)
		return problemsData
					
	def GetExistingRunContexts(self):
		run_contexts = []
		
		# Assuming the structure is: generatedPath/model/problemNumber/runNumber
		
		def is_numeric(n):
			try:
				int(n)
				return True
			except ValueError:
				return False
		
		# Filter and sort the run numbers in ascending order
		runNumbers = sorted(filter(is_numeric, os.listdir(self.generatedPath())), key=lambda x: int(x))
		
		for runNumber in runNumbers:
			if os.path.isdir(os.path.join(self.generatedPath(), runNumber)):
				run_context = RunContext(self.__model, self.problemNumber(), runNumber, self.__rootDirectory)
				run_contexts.append(run_context)
				
		return run_contexts
		
	def GetRunContexts(self, runCount):
		run_contexts = []
		
		# Assuming the structure is: generatedPath/model/problemNumber/runNumber
		for runNumber in range(1, runCount+1):
			# Construct paths for problem, generated, profiling and visualization
			run_number = f"{runNumber:02}"
			run_context = RunContext(self.__model, self.problemNumber(), run_number, self.__rootDirectory)
			run_contexts.append(run_context)
				
		return run_contexts



class RunContext:
	def __init__(self, model, problemNumber, runNumber, rootDirectory):
		self.__model = model
		self.__problemNumber = problemNumber
		self.__runNumber = runNumber
		self.__rootDirectory = rootDirectory

	def __repr__(self):
		return f"RunContext(Model: {self.__model}, Problem: {self.__problemNumber}, Run: {self.__runNumber})"
	
	def model(self):
		return self.__model
	
	def problemNumber(self):
		return self.__problemNumber

	def runNumber(self):
		return self.__runNumber
		
	def __get_path(self, sub_directory, *args):
		path = os.path.join(self.__rootDirectory, sub_directory, *args)
		if not os.path.exists(path):
			os.makedirs(path)
		return path

	def problemPath(self):
		return self.__get_path('problems', self.__problemNumber)
	
	def generatedPath(self):
		return self.__get_path('generated', self.__model, self.__problemNumber, self.__runNumber)
	
	def profilingPath(self):
		return self.__get_path('profiling', self.__model, self.__problemNumber, self.__runNumber)
	
	def analysisPath(self):
		return self.__get_path('analysis', self.__model, self.__problemNumber, self.__runNumber)
	
	def failurePath(self):
		return self.__get_path('failures', self.__model, self.__problemNumber, self.__runNumber)
	
	def compilationUnitPath(self):
		return os.path.join(self.problemPath(), "compilation_unit.c")
	
	def testDataPath(self):
		return os.path.join(self.problemPath(), "test_data.csv")
		
	def profilingResultsPath(self):
		return os.path.join(self.profilingPath(), "performance_results.csv")

	@classmethod
	def RunContextsForDirectory(cls, rootDirectory):
		runsData = []

		# Start by iterating through the 'generated' directory
		generatedPath = os.path.join(rootDirectory, 'generated')
		for model in os.listdir(generatedPath):
			for problemNumber in os.listdir(os.path.join(generatedPath, model)):
				for runNumber in os.listdir(os.path.join(generatedPath, model, problemNumber)):
					
					# Construct paths for problem, generated, profiling and visualization
					problemPath = os.path.join(rootDirectory, 'problems', problemNumber)
					generatedRunPath = os.path.join(generatedPath, model, problemNumber, runNumber)
					profilingRunPath = os.path.join(rootDirectory, 'profiling', model, problemNumber, runNumber)
					visualizationRunPath = os.path.join(rootDirectory, 'visualization', model, problemNumber, runNumber)
					
					runContext = cls(model, problemNumber, runNumber, problemPath, generatedRunPath, profilingRunPath, visualizationRunPath)
					runsData.append(runContext)
					
		return runsData
		
	def createProblemContext(self):
		# Remove the run number from the paths
		generatedPath = os.path.join(os.path.dirname(os.path.dirname(self.__generatedPath)))
		profilingPath = os.path.join(os.path.dirname(os.path.dirname(self.__profilingPath)))
		visualizationPath = os.path.join(os.path.dirname(os.path.dirname(self.__visualizationPath)))
		
		return ProblemContext(
			self.model(),
			self.problemNumber(),
			self.problemPath(),
			generatedPath,
			profilingPath,
			visualizationPath
		)
