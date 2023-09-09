
import pandas as pd
import os
import matplotlib.pyplot as plt
import sys
from run_context import ProblemContext, ModelContext
import re

filename_renaming = {
    "clang_generated_unoptimized.asm": "Clang Unoptimized",
    "clang_generated_O1_optimized.asm": "Clang O1",
    "clang_generated_O2_optimized.asm": "Clang O2",
    "clang_generated_O3_optimized.asm": "Clang O3",
    "clang_generated_llm_optimized.asm": "Clang LLM optimized",
    "llm_generated.asm": "LLM generated"
}

def generate_dataframes(modelContext):
    problemContexts = modelContext.GetProblemContexts()
    print(problemContexts)
    # Lists to store data
    techniques = []
    dataframes = []

    for context in problemContexts:
        # Read performance_results.csv file
        performance_file = context.profilingResultsPath()
        
        if os.path.exists(performance_file):
            df = pd.read_csv(performance_file)
            df['problem'] = context.problemNumber()
            dataframes.append(df)
            
            # Read technique.txt file
            technique_file = context.techniquePath()
            if os.path.exists(technique_file):
                with open(technique_file, 'r') as f:
                    technique = f.read().strip()
                    techniques.extend([technique] * df.shape[0])
                    
    # Combining all dataframes into one
    combined_df = pd.concat(dataframes, ignore_index=True)
    combined_df['technique'] = techniques
    
    # Save combined dataframe to CSV
    combined_df.to_csv(os.path.join(modelContext.analysisPath(), 'combined_data.csv'), index=False)
    
    # Renaming 'Filename' values and column name
    combined_df['Generation Method'] = combined_df['Filename'].replace(filename_renaming)

    return combined_df

def generate_error_count_csv(modelContext, combined_df):
    # Create a copy to prevent modifying the original dataframe
    df_copy = combined_df.copy()
    
    # Filter rows with "llm" in the filename
    df_copy = df_copy[df_copy['Filename'].str.contains('llm')]

    # Extract the prefix from the filename
    df_copy['prefix'] = df_copy['Filename'].apply(lambda x: int(re.findall('_(\d)', x)[0]) if re.findall('_(\d)', x) else 0)

    # Sort by problem, technique, and prefix
    df_copy = df_copy.sort_values(by=['problem', 'technique', 'prefix'])

    # Drop duplicates based on problem and technique, keeping the first occurrence (smallest prefix)
    df_copy = df_copy.drop_duplicates(subset=['problem', 'technique'], keep='first')

    # Create the desired output format
    df_output = df_copy[['problem', 'technique', 'Compiler Errors', 'Linker Errors', 'Execution Errors', 'Correctness Errors']]
    df_output.columns = ['Problem', 'Technique', 'Compilation Errors', 'Linking Errors', 'Execution Errors', 'Correctness Errors']
    
    # Write to CSV
    output_path = modelContext.errorCountPath()
    df_output.to_csv(output_path, index=False)
    
    return df_output

def generate_barcharts(modelContext, combined_df):
    # Renaming 'Filename' values and column name
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
        # plt.xlim(0, 1.2)  # Adjusting the x-axis limit for more space between 0 and 1
        plt.figtext(0.5, 0.01, 'Shorter bars are better', wrap=True, horizontalalignment='center', fontsize=8, style='italic')
        plt.tight_layout()
        plt.savefig(os.path.join(modelContext.analysisPath(), f'problem_{problem}_chart.png'))
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
        plt.savefig(os.path.join(modelContext.analysisPath(), filename))
        
        plt.close()
    
    # Now, generate one final chart with all the data.
        # Group by generation method and calculate the mean for 'Normalized CPU Time'
    grouped_means = combined_df.groupby('Generation Method')['Normalized CPU Time'].mean().reset_index().sort_values(by='Normalized CPU Time', ascending=False)
    
    # Determine bar colors based on the presence of "LLM" in the generation method
    bar_colors = ['blue' if 'LLM' in method else 'lightgray' for method in grouped_means['Generation Method']]
    
    # Plotting
    plt.figure(figsize=(10, 5))
    plt.barh(grouped_means['Generation Method'], grouped_means['Normalized CPU Time'], color=bar_colors)
    plt.xlabel('Average Normalized CPU Time')
    plt.ylabel('Generation Method')
    plt.title(f'Average Performance by Generation Method (all techniques)')
    plt.grid(axis='x', linestyle='--', linewidth=0.5, alpha=0.7)
    plt.figtext(0.5, 0.01, 'Shorter bars are better', wrap=True, horizontalalignment='center', fontsize=8, style='italic')
    plt.tight_layout()
    plt.savefig(os.path.join(modelContext.analysisPath(), 'average_performance_overall.png'))
    plt.close()
    pass
    
def generate_error_count_latex(modelContext, df):
    # Start building the LaTeX code
    latex_code = r"""
\begin{tikzpicture}
\begin{axis}[
    ybar stacked,
    symbolic x coords={""" 
    
    # Add problem types to x coords
    problems = df['Problem'].unique()
    for problem in problems:
        latex_code += f"{problem},"
    latex_code = latex_code[:-1]  # Remove trailing comma
    
    latex_code += r"""},
    xtick=data,
    ylabel={Number of Errors},
    legend pos=north west,
    legend cell align={left},
    legend style={draw=none}
]

\addplot+[ybar] plot coordinates {"""
    
    # Add Compilation Errors data
    for _, row in df.iterrows():
        latex_code += f"({row['Problem']},{row['Compilation Errors']})"
    latex_code += r"""};
\addlegendentry{Compilation Errors}

\addplot+[ybar] plot coordinates {"""
    
    # Add Linking Errors data
    for _, row in df.iterrows():
        latex_code += f"({row['Problem']},{row['Linking Errors']})"
    latex_code += r"""};
\addlegendentry{Linking Errors}

\addplot+[ybar] plot coordinates {"""
    
    # Add Execution Errors data
    for _, row in df.iterrows():
        latex_code += f"({row['Problem']},{row['Execution Errors']})"
    latex_code += r"""};
\addlegendentry{Execution Errors}

\addplot+[ybar] plot coordinates {"""
    
    # Add Correctness Errors data
    for _, row in df.iterrows():
        latex_code += f"({row['Problem']},{row['Correctness Errors']})"
    latex_code += r"""};
\addlegendentry{Correctness Errors}

\end{axis}
\end{tikzpicture}
"""

    with open(modelContext.errorLaTeXGraphPath(), "w") as output_file:
        output_file.write(latex_code)

def generate_performance_latex(modelContext, df):
    # Extract base filenames without numeric suffix
    df['Base Filename'] = df['Filename'].str.replace(r'_\d+\.asm$', '.asm')

    # Sort the dataframe by 'Normalized CPU Time' and then drop duplicates, keeping the one with the lowest "Normalized CPU Time"
    filtered_df = df.sort_values('Normalized CPU Time').drop_duplicates(subset='Base Filename', keep='first')

    # Define the label mapping
    label_mapping = {
        "clang_generated_unoptimized.asm": "Clang Unoptimized",
        "clang_generated_O1_optimized.asm": "Clang O1",
        "clang_generated_O2_optimized.asm": "Clang O2",
        "clang_generated_O3_optimized.asm": "Clang O3",
        "clang_generated_llm_optimized.asm": "Clang LLM optimized",
        "llm_generated.asm": "LLM generated"
    }

    # Translate the labels
    filtered_df['Label'] = filtered_df['Base Filename'].map(label_mapping)

    # Filter out rows where label translation exists
    filtered_df = filtered_df[filtered_df['Label'].notna()]

    # Get the minimum value among "Clang O1", "Clang O2", and "Clang O3"
    optimized_clang = filtered_df[filtered_df['Label'].isin(["Clang O1", "Clang O2", "Clang O3"])]['Normalized CPU Time'].min()

    # Remove the individual entries for "Clang O1", "Clang O2", and "Clang O3"
    filtered_df = filtered_df[~filtered_df['Label'].isin(["Clang O1", "Clang O2", "Clang O3"])]
    
    # Add the "Clang optimized" entry using loc
    filtered_df.loc[len(filtered_df)] = {'Label': 'Clang optimized', 'Normalized CPU Time': optimized_clang}

    # Sort by "Normalized CPU Time" again for better visualization
    filtered_df = filtered_df.sort_values('Normalized CPU Time')

    labels = filtered_df['Label'].tolist()
    values = filtered_df['Normalized CPU Time'].tolist()

    # Create color values for the bars
    colors = ["lightgray" if "LLM" not in label else "blue" for label in labels]

    # Generate the LaTeX code using \addplot coordinates with symbolic y-coordinates
    latex_code = r"""
\begin{tikzpicture}
\begin{axis}[
    xbar,
    bar width=0.5cm,
    xmin=0,
    xlabel={Normalized CPU Time},
    ytick={%s},
    yticklabels={%s},
    nodes near coords,
    nodes near coords align={horizontal},
    every axis plot/.append style={
      bar shift=0pt,
      fill
    },
    ]
%s
\end{axis}
\end{tikzpicture}
""" % (
        ",".join([str(len(labels) - 1 - index) for index in range(len(labels))]),
        ", ".join(['{' + label + '}' for label in reversed(labels)]),
        "\n".join(['\\addplot [fill=' + colors[index] + '] coordinates {( ' + str(value) + ' , ' + str(len(labels) - 1 - index) + ' )};' for index, value in enumerate(values)])
    )

    with open(modelContext.performanceLaTeXGraphPath(), "w") as output_file:
        output_file.write(latex_code)


def generate_markdown(modelContext):
    markdown_content = ""
    
    for context in modelContext.GetProblemContexts():        
        # Add to Markdown file
        problem_number = context.problemNumber()
        markdown_content += f"## Problem {problem_number}\n"
        c_file_path = context.compilationUnitPath()
        png_file_path = f"problem_{problem_number}_chart.png"
        with open(c_file_path, "r") as c_file:
            c_contents = c_file.read()
            markdown_content += f"### Compilation Unit\n"
            markdown_content += "```c\n" + c_contents + "\n```\n"
            
        generated_assembly_links = []
        relative_generated_directory_path = os.path.relpath(context.generatedPath(), start=context.visualizationPath())
        for generated_assembly_filename in sorted(os.listdir(context.generatedPath())):
            if generated_assembly_filename in filename_renaming.keys():
                relative_generated_assembly_file_path = os.path.join(relative_generated_directory_path, generated_assembly_filename)
                highlight = "**" if "llm" in generated_assembly_filename else ""
                generated_assembly_links.append(f"{highlight}[{filename_renaming[generated_assembly_filename]}]({relative_generated_assembly_file_path}){highlight}")
        
        # Add links to generated assembly
        if generated_assembly_links:
            markdown_content += f"- Generated Assembly: {', '.join(generated_assembly_links)}\n"
    
        markdown_content += f"### Results\n"
        markdown_content += f"![Chart for Problem {problem_number}]({png_file_path})\n\n"
    
    with open(modelContext.markdownSummaryPath(), "w") as output_file:
        output_file.write(markdown_content)

if __name__ == "__main__":    
    # Check if the user has provided a command-line argument
    if len(sys.argv) < 2:
        print("Please provide the folder path as a command-line argument.")
        sys.exit(1)
    
    folder_path = sys.argv[1]
    
    # Check if the given folder path exists
    if os.path.exists(folder_path):
        modelContexts = ModelContext.ModelContextsForDirectory(folder_path)
        for modelContext in modelContexts:
            generate_markdown(modelContext)
            dataframe = generate_dataframes(modelContext)
            generate_barcharts(modelContext, dataframe)
            error_df = generate_error_count_csv(modelContext, dataframe)
            generate_error_count_latex(modelContext, error_df)
            generate_performance_latex(modelContext, dataframe)
    else:
        print("The provided folder path does not exist.")


