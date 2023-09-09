import os

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
