/**
 * @file lab1b.c
 * @brief Laboratory 1b - High-precision multiplication in base 10
 *
 * This program reads a set of string representations of large positive integers in base 10
 * and performs multiplication for each pair. The result is printed without leading zeros.
 *
 * Input:
 * The first line contains an integer indicating the number of test cases.
 * Each test case consists of two lines, each containing a large integer (up to 500 digits).
 *
 * Output:
 * For each test case, the program outputs a line containing the result of the multiplication
 * in base 10 (up to 1000 digits), with no leading zeros.
 *
 * Time Limit: 1
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


/**
 * @brief Performs multiplication of two large base-10 integers represented as strings.
 *
 * @param num1 Pointer to the first number (as a string).
 * @param num2 Pointer to the second number (as a string).
 * @param resultado Pointer to the buffer where the result will be stored.
 *
 * This function simulates the traditional multiplication algorithm by multiplying
 * each digit of one number by each digit of the other, accumulating results into a temporary array,
 * and finally constructing the result as a string.
 */
void multiplicarBaseDiez(char *num1, char *num2, char *resultado) {
    int len1 = strlen(num1);
    int len2 = strlen(num2);
    int temp[1001] = {0};
    int i, j, k;

    for (i = len1 - 1; i >= 0; i--) {
        for (j = len2 - 1; j >= 0; j--) {
            int digito1 = num1[i] - '0';
            int digito2 = num2[j] - '0';

            temp[len1 + len2 - 2 - i - j] += digito1 * digito2;

            if (temp[len1 + len2 - 2 - i - j] >= 10) {
                temp[len1 + len2 - 2 - i - j + 1] += temp[len1 + len2 - 2 - i - j] / 10;
                temp[len1 + len2 - 2 - i - j] %= 10;
            }
        }
    }

    k = len1 + len2 - 1;
    while (k >= 0 && temp[k] == 0) k--;
    if (k < 0) {
        strcpy(resultado, "0");
    } else {
        for (i = k; i >= 0; i--) {
            resultado[k - i] = temp[i] + '0';
        }
        resultado[k + 1] = '\0';
    }
}

/**
 * @brief Main function: reads input, processes cases, and prints results.
 *
 * @return int Exit status
 */
int main() {
    int casos, i;
    scanf("%d", &casos);
    char num1[501], num2[501], resultado[1001];

    for (i = 0; i < casos; i++) {
        scanf("%s %s", num1, num2);
        multiplicarBaseDiez(num1, num2, resultado);
        printf("%s\n", resultado);
    }

    return 0;
}