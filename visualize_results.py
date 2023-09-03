
import pandas as pd
import os
import matplotlib.pyplot as plt
import sys

# Check if the user has provided a command-line argument
if len(sys.argv) < 3:
    print("Please provide the problem and analysis paths as command-line arguments.")
    sys.exit(1)


# Load data from directory
problems_dir = sys.argv[1]
analysis_dir = sys.argv[2]

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
    "clang_generated_unoptimized.asm": "Clang Unoptimized"
}
combined_df['Generation Method'] = combined_df['Filename'].replace(filename_renaming)

# Set colors based on the presence of "LLM" in the Generation Method
unique_generation_methods = combined_df['Generation Method'].unique()
colors = {method: 'blue' if "LLM" in method else 'lightgray' for method in unique_generation_methods}

# Generate horizontal bar charts for each problem
problems_list = combined_df['problem'].unique()
for problem in problems_list:
    subset = combined_df[combined_df['problem'] == problem]
    
    # Check if there are any missing generation method names and skip them
    valid_generation_methods = subset['Generation Method'].dropna().unique()
    valid_colors = [colors[val] for val in valid_generation_methods if val in colors]
    
    # Plotting
    plt.figure(figsize=(10, 3))
    subset[subset['Generation Method'].isin(valid_generation_methods)].plot(
        x='Generation Method', y='Normalized CPU Time', kind='barh', color=valid_colors, legend=False
    )
    plt.title(f"Problem {problem}")
    plt.xlabel("Normalized CPU Time")
    plt.xlim(0, 1.2)  # Adjusting the x-axis limit for more space between 0 and 1
    plt.tight_layout()
    plt.savefig(os.path.join(analysis_dir, f'problem_{problem}_chart.png'))
    plt.close()
    
    

# Now, generate charts based on technique
techniques_list = combined_df['technique'].unique()

for technique in techniques_list:
    subset = combined_df[combined_df['technique'] == technique]
    
    # Group by generation method and calculate the mean for 'Normalized CPU Time'
    grouped_means = subset.groupby('Generation Method')['Normalized CPU Time'].mean().reset_index().sort_values(by='Normalized CPU Time', ascending=True)
    
    # Plotting
    plt.figure(figsize=(10, 5))
    plt.barh(grouped_means['Generation Method'], grouped_means['Normalized CPU Time'], color=[colors[val] for val in unique_generation_methods])
    plt.xlabel('Average Normalized CPU Time')
    plt.ylabel('Generation Method')
    plt.title(f'Average Performance by Generation Method for {technique}')
    plt.grid(axis='x', linestyle='--', linewidth=0.5, alpha=0.7)
    plt.tight_layout()
    plt.savefig(os.path.join(analysis_dir, f'average_performance_for_{technique}.png'))
    plt.close()
