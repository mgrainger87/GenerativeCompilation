import os

class ModelContext:
	def __init__(self, model, rootDirectory):
		self.__model = model
		self.__rootDirectory = rootDirectory

	def __repr__(self):
		return f"ModelContext(Model: {self.__model})"

	def __get_path(self, sub_directory, *args):
		path = os.path.join(self.__rootDirectory, sub_directory, *args)
		if not os.path.exists(path):
			os.makedirs(path)
		return path

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

	@classmethod
	def ModelContextsForDirectory(cls, rootDirectory):
		modelContexts = []
		generatedPath = os.path.join(rootDirectory, 'generated')
		for model in os.listdir(generatedPath):
			modelContext = cls(model, rootDirectory)
			modelContexts.append(modelContext)
		return modelContexts

	def GetProblemContexts(self):
		problem_contexts = []
		
		for problemNumber in os.listdir(self.generatedPath()):
			problemContext = ProblemContext(self.__model, problemNumber, self.__rootDirectory)
			problem_contexts.append(problemContext)
		
		return problem_contexts


class ProblemContext:
	def __init__(self, model, problemNumber, rootDirectory):
		print(f"initialized problemContext with model {model}")
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
		
	@classmethod
	def ProblemContextsForDirectory(cls, rootDirectory):
		problemsData = []
		generatedPath = os.path.join(rootDirectory, 'generated')
		for model in os.listdir(generatedPath):
			for problemNumber in os.listdir(os.path.join(generatedPath, model)):
				problemContext = cls(model, problemNumber, rootDirectory)
				problemsData.append(problemContext)
		return problemsData
					
	def GetRunContexts(self):
		run_contexts = []
		
		print(f"generated path {self.generatedPath()}")
		# Assuming the structure is: generatedPath/model/problemNumber/runNumber
		for runNumber in os.listdir(self.generatedPath()):
			# Construct paths for problem, generated, profiling and visualization
			generatedRunPath = os.path.join(self.generatedPath(), runNumber)
			profilingRunPath = os.path.join(self.profilingPath(), runNumber)
			visualizationRunPath = os.path.join(self.visualizationPath(), runNumber)
			
			run_context = RunContext(self.__model, self.problemNumber(), runNumber, self.problemPath(), generatedRunPath, profilingRunPath, visualizationRunPath)
			run_contexts.append(run_context)
				
		return run_contexts


class RunContext:
	def __init__(self, model, problemNumber, runNumber, problemPath, generatedPath, profilingPath, visualizationPath):
		self.__model = model
		self.__problemNumber = problemNumber
		self.__runNumber = runNumber
		self.__problemPath = problemPath
		self.__generatedPath = generatedPath
		self.__profilingPath = profilingPath
		self.__visualizationPath = visualizationPath

	def __repr__(self):
		return f"RunContext(Model: {self.__model}, Problem: {self.__problemNumber}, Run: {self.__runNumber})"
	
	def model(self):
		return self.__model
	
	def problemNumber(self):
		return self.__problemNumber

	def runNumber(self):
		return self.__runNumber

	def problemPath(self):
		if not os.path.exists(self.__problemPath):
			os.makedirs(self.__problemPath)
		return self.__problemPath

	def generatedPath(self):
		if not os.path.exists(self.__generatedPath):
			os.makedirs(self.__generatedPath)
		return self.__generatedPath

	def profilingPath(self):
		if not os.path.exists(self.__profilingPath):
			os.makedirs(self.__profilingPath)
		return self.__profilingPath

	def visualizationPath(self):
		if not os.path.exists(self.__visualizationPath):
			os.makedirs(self.__visualizationPath)
		return self.__visualizationPath
		
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
