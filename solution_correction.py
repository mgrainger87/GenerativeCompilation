import sys

if __name__ == "__main__":
# Check if the user has provided a command-line argument
if len(sys.argv) < 5:
	print("Please provide correct arguments.")
	sys.exit(1)
	
folder_path = sys.argv[1]
model_name = sys.argv[2]

# Check if the given folder path exists
if os.path.exists(folder_path):
	modelContext = ModelContext(model_name, folder_path)
	
	problem_contexts = modelContext.GetProblemContexts()
	
	print(problem_contexts)
	
	for problemContext in problem_contexts:
		handle_problem(problemContext, solutions_per_problem, optimizations_per_solution)

else:
	print("The provided folder path does not exist.")
