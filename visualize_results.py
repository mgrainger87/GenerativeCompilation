
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

markdown_content = ""

# Iterate through each problem directory and extract the data
for problem_dir in sorted(os.listdir(problems_dir)):
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
                    
        # Add to Markdown file
        markdown_content += f"## Problem {problem_dir}\n"
        c_file_path = os.path.join(problem_path, "compilation_unit.c")
        png_file_path = f"problem_{problem_dir}_chart.png"
        with open(c_file_path, "r") as c_file:
            c_contents = c_file.read()
            markdown_content += f"### Compilation Unit\n"
            markdown_content += "```c\n" + c_contents + "\n```\n"
        
        markdown_content += f"### Results\n"
        markdown_content += f"![Chart for Problem {problem_dir}]({png_file_path})\n\n"

with open(os.path.join(analysis_dir, "charts.md"), "w") as output_file:
    output_file.write(markdown_content)


# Combining all dataframes into one
combined_df = pd.concat(dataframes, ignore_index=True)
combined_df['technique'] = techniques

# Save combined dataframe to CSV
combined_df.to_csv(os.path.join(analysis_dir, 'combined_data.csv'), index=False)

# Renaming 'Filename' values and column name
filename_renaming = {
    "clang_generated_unoptimized.asm": "Clang Unoptimized",
    "clang_generated_O1_optimized.asm": "Clang O1",
    "clang_generated_O2_optimized.asm": "Clang O2",
    "clang_generated_O3_optimized.asm": "Clang O3",
    "clang_generated_llm_optimized.asm": "Clang LLM optimized",
    "llm_generated.asm": "LLM generated"
}
combined_df['Generation Method'] = combined_df['Filename'].replace(filename_renaming)

# Set colors based on the presence of "LLM" in the Generation Method
unique_generation_methods = combined_df['Generation Method'].unique()
colors = {method: 'blue' if "LLM" in method else 'lightgray' for method in unique_generation_methods}

# Generate horizontal bar charts for each problem
problems_list = combined_df['problem'].unique()
for problem in problems_list:
    subset = combined_df[combined_df['problem'] == problem].sort_values(by='Normalized CPU Time', ascending=False)
    
    # Check if there are any missing generation method names and skip them
    valid_generation_methods = subset['Generation Method'].dropna().unique()
    valid_colors = [colors[val] for val in valid_generation_methods if val in colors]
    
    # Plotting
    plt.figure(figsize=(10, 3))
    subset[subset['Generation Method'].isin(valid_generation_methods)].plot(
        x='Generation Method', y='Normalized CPU Time', kind='barh', color=valid_colors, legend=False
    )
    plt.title(f"Problem {problem} - {subset['technique'].unique()[0]}")
    plt.xlabel("Normalized CPU Time")
    plt.xlim(0, 1.2)  # Adjusting the x-axis limit for more space between 0 and 1
    plt.figtext(0.5, 0.01, 'Shorter bars are better', wrap=True, horizontalalignment='center', fontsize=8, style='italic')
    plt.tight_layout()
    plt.savefig(os.path.join(analysis_dir, f'problem_{problem}_chart.png'))
    plt.close()
    
    

# Now, generate charts based on technique
techniques_list = combined_df['technique'].unique()

for technique in techniques_list:
    subset = combined_df[combined_df['technique'] == technique]
    
    # Group by generation method and calculate the mean for 'Normalized CPU Time'
    grouped_means = subset.groupby('Generation Method')['Normalized CPU Time'].mean().reset_index().sort_values(by='Normalized CPU Time', ascending=False)

    # Determine bar colors based on the presence of "LLM" in the generation method
    bar_colors = ['blue' if 'LLM' in method else 'lightgray' for method in grouped_means['Generation Method']]
    
    # Plotting
    plt.figure(figsize=(10, 5))
    plt.barh(grouped_means['Generation Method'], grouped_means['Normalized CPU Time'], color=bar_colors)
    plt.xlabel('Average Normalized CPU Time')
    plt.ylabel('Generation Method')
    plt.title(f'Average Performance by Generation Method for {technique.title()}')
    plt.grid(axis='x', linestyle='--', linewidth=0.5, alpha=0.7)
    plt.figtext(0.5, 0.01, 'Shorter bars are better', wrap=True, horizontalalignment='center', fontsize=8, style='italic')
    plt.tight_layout()
    
    filename = f'average_performance_for_{technique}.png'.replace(' ', '_')
    plt.savefig(os.path.join(analysis_dir, filename))
    
    plt.close()
