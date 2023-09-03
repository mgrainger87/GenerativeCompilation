
import pandas as pd
import os
import matplotlib.pyplot as plt
import sys
import seaborn as sns

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

# Dynamically assign colors based on unique approaches
unique_approaches = combined_df['Approach'].unique()
colors = dict(zip(unique_approaches, sns.color_palette("husl", len(unique_approaches))))

# Generate horizontal bar charts for each problem
problems_list = combined_df['problem'].unique()
for problem in problems_list:
    subset = combined_df[combined_df['problem'] == problem]
    
    # Check if there are any missing approach names and skip them
    valid_approaches = subset['Approach'].dropna().unique()
    valid_colors = [colors[val] for val in valid_approaches if val in colors]
    
    # Plotting
    plt.figure(figsize=(10, 3))
    subset[subset['Approach'].isin(valid_approaches)].plot(
        x='Approach', y='Normalized CPU Time', kind='barh', color=valid_colors, legend=False
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
    
    # Group by approach and calculate the mean for 'Normalized CPU Time'
    grouped_means = subset.groupby('Approach')['Normalized CPU Time'].mean().reset_index().sort_values(by='Normalized CPU Time', ascending=True)
    
    # Dynamically assign colors based on unique approaches
    unique_approaches = grouped_means['Approach'].unique()
    colors = dict(zip(unique_approaches, sns.color_palette("husl", len(unique_approaches))))
    
    # Plotting
    plt.figure(figsize=(10, 5))
    plt.barh(grouped_means['Approach'], grouped_means['Normalized CPU Time'], color=[colors[val] for val in unique_approaches])
    plt.xlabel('Average Normalized CPU Time')
    plt.ylabel('Approach')
    plt.title(f'Average Performance by Approach for {technique}')
    plt.grid(axis='x', linestyle='--', linewidth=0.5, alpha=0.7)
    plt.tight_layout()
    plt.savefig(os.path.join(analysis_dir, f'average_performance_for_{technique}.png'))
    plt.close()
