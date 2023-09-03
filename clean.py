
import os
import argparse
import shutil

def clean_tests(base_path):
    problem_dirs = [os.path.join(base_path, d) for d in os.listdir(base_path) if os.path.isdir(os.path.join(base_path, d))]
    for problem_dir in problem_dirs:
        test_data_path = os.path.join(problem_dir, "test_data.txt")
        if os.path.exists(test_data_path):
            os.remove(test_data_path)

def clean_generated(base_path):
    problem_dirs = [os.path.join(base_path, d) for d in os.listdir(base_path) if os.path.isdir(os.path.join(base_path, d))]
    for problem_dir in problem_dirs:
        generated_path = os.path.join(problem_dir, "generated")
        if os.path.exists(generated_path):
            shutil.rmtree(generated_path)

def clean_performance(base_path):
    problem_dirs = [os.path.join(base_path, d) for d in os.listdir(base_path) if os.path.isdir(os.path.join(base_path, d))]
    for problem_dir in problem_dirs:
        performance_path = os.path.join(problem_dir, "performance_results.csv")
        if os.path.exists(performance_path):
            os.remove(performance_path)

def clean_analysis():
    analysis_path = os.path.join(os.getcwd(), "analysis")
    if os.path.exists(analysis_path):
        shutil.rmtree(analysis_path)

def main():
    parser = argparse.ArgumentParser(description="Clean up files in the repository.")
    parser.add_argument("clean_type", choices=["tests", "generated", "performance", "analysis", "all"],
                        help="Indicate what to clean up.")
    args = parser.parse_args()

    base_path = os.path.join(os.getcwd(), "problems")
    if args.clean_type == "tests":
        clean_tests(base_path)
    elif args.clean_type == "generated":
        clean_generated(base_path)
    elif args.clean_type == "performance":
        clean_performance(base_path)
    elif args.clean_type == "analysis":
        clean_analysis()
    elif args.clean_type == "all":
        clean_tests(base_path)
        clean_generated(base_path)
        clean_performance(base_path)
        clean_analysis()

if __name__ == "__main__":
    main()
