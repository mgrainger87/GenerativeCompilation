#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>  // for fabs function

// Forward declaration of customFunction
void customFunction(int int1, int int2, 
					double double1, double double2, 
					int *outInt, double *outDouble);

// Helper function to parse keyword-based parameters
const char* getKeywordValue(const char *keyword, int argc, char *argv[]) {
	int length = strlen(keyword);
	for (int i = 1; i < argc; i++) {
		if (strncmp(argv[i], keyword, length) == 0 && argv[i][length] == '=') {
			return &argv[i][length + 1];
		}
	}
	return NULL;
}

int main(int argc, char *argv[]) {
	// Parse the inputs and expected outputs using keyword-based parameters
	const char *int1Str = getKeywordValue("int1", argc, argv);
	const char *int2Str = getKeywordValue("int2", argc, argv);
	const char *double1Str = getKeywordValue("double1", argc, argv);
	const char *double2Str = getKeywordValue("double2", argc, argv);
	const char *expectedIntStr = getKeywordValue("expectedInt", argc, argv);
	const char *expectedDoubleStr = getKeywordValue("expectedDouble", argc, argv);
	const char *iterationsStr = getKeywordValue("iterations", argc, argv);

	if (!int1Str || !int2Str || !double1Str || !double2Str ||
		!expectedIntStr || !expectedDoubleStr || !iterationsStr) {
		printf("Missing one or more required keyword-based parameters.\n");
		return 1;
	}

	int int1 = atoi(int1Str);
	int int2 = atoi(int2Str);
	double double1 = atof(double1Str);
	double double2 = atof(double2Str);
	int expectedInt = atoi(expectedIntStr);
	double expectedDouble = atof(expectedDoubleStr);
	int iterations = atoi(iterationsStr);

	printf("Running tests for %d iterations...\n", iterations);

	// Variables to hold the outputs
	int outInt = 0;
	double outDouble = 0;

	// Define a threshold for floating point comparison
	const double THRESHOLD = 1e-9;

	for (int i = 0; i < iterations; i++) {
		// Call the function
		customFunction(int1, int2, double1, double2, &outInt, &outDouble);
	
		// Compare outputs
		if (outInt != expectedInt || 
			fabs(outDouble - expectedDouble) > THRESHOLD) {
			
			// Print detailed failure information
			printf("Test failed on iteration %d:\n", i + 1);
			
			printf("Inputs:\n");
			printf("\tInteger 1: %d\n", int1);
			printf("\tInteger 2: %d\n", int2);
			printf("\tDouble 1: %f\n", double1);
			printf("\tDouble 2: %f\n", double2);
			
			printf("Expected outputs:\n");
			printf("\tInteger: %d\n", expectedInt);
			printf("\tDouble: %f\n", expectedDouble);
			
			printf("Actual outputs:\n");
			printf("\tInteger: %d\n", outInt);
			printf("\tDouble: %f\n", outDouble);

			return 1; // Non-zero exit code for failure
		}
	}
	
	printf("All tests passed!\n");
	return 0; // Zero exit code for success
}
