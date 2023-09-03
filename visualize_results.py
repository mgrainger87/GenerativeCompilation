
import pandas as pd
import os
import matplotlib.pyplot as plt
import sys

# Check if the user has provided a command-line argument
if len(sys.argv) < 2:
    print("Please provide the folder path as a command-line argument.")
    sys.exit(1)


# Load data from directory
problems_dir = sys.argv[1]
analysis_dir = os.path.join(problems_dir, 'analysis')

if not os.path.exists(analysis_dir):
    os.makedirs(analysis_dir)

# Lists to store data
dataframes = []
techniques = []

# Iterate through each problem directory and extract the data
for problem_dir in os.listdir(problems_dir):
    problem_path = os.path.join(problems_dir, problem_dir)
    if os.path.isdir(problem_path):
        # Read performance_results.csv file
        performance_file = os.path.join(problem_path, 'performance_results.csv')
        if os.path.exists(performance_file):
            df = pd.read_csv(performance_file)
            df['problem'] = problem_dir
            dataframes.append(df)
            
            # Read technique.txt file
            technique_file = os.path.join(problem_path, 'technique.txt')
            if os.path.exists(technique_file):
                with open(technique_file, 'r') as f:
                    technique = f.read().strip()
                    techniques.extend([technique] * df.shape[0])

# Combining all dataframes into one
combined_df = pd.concat(dataframes, ignore_index=True)
combined_df['technique'] = techniques

# Save combined dataframe to CSV
combined_df.to_csv(os.path.join(analysis_dir, 'combined_data.csv'), index=False)

# Renaming 'Filename' values and column name
filename_renaming = {
    "clang_generated_O3_optimized.asm": "Clang O3",
    "clang_generated_llm_optimized.asm": "LLM optimized",
    "clang_generated_unoptimized.asm": "Unoptimized"
}
combined_df['Approach'] = combined_df['Filename'].replace(filename_renaming)

# Colors for the bars
colors = {
    "Clang O3": 'green',
    "LLM optimized": 'red',
    "Unoptimized": 'blue'
}

# Generate horizontal bar charts for each problem
problems_list = combined_df['problem'].unique()
for problem in problems_list:
    subset = combined_df[combined_df['problem'] == problem]
    
    # Plotting
    plt.figure(figsize=(10, 3))
    subset.plot(x='Approach', y='Normalized CPU Time', kind='barh', color=[colors[val] for val in subset['Approach']], legend=False)
    plt.title(f"Problem {problem}")
    plt.xlabel("Normalized CPU Time")
    plt.xlim(0, 1.2)  # Adjusting the x-axis limit for more space between 0 and 1
    plt.tight_layout()
    plt.savefig(os.path.join(analysis_dir, f'problem_{problem}_chart.png'))
    plt.close()
