/**
 * @file lab1a.c
 * @brief Laboratory 1a - High-precision addition in base 10
 *
 * This program reads a set of string representations of large positive integers in base 10
 * and performs addition for each pair. The result is printed without leading zeros.
 *
 * Input:
 * The first line contains an integer indicating the number of test cases.
 * Each test case consists of two lines, each containing a large integer (up to 1000 digits).
 *
 * Output:
 * For each test case, the program outputs a line containing the result of the addition
 * in base 10, with no leading zeros.
 *
 * Time Limit: 1
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


/**
 * @brief Performs addition of two large base-10 integers represented as strings.
 *
 * @param num1 Pointer to the first number (as a string).
 * @param num2 Pointer to the second number (as a string).
 * @param resultado Pointer to the buffer where the result will be stored.
 *
 * This function simulates digit-by-digit addition from right to left,
 * handling carry propagation. The result is stored as a null-terminated string.
 */
void sumaBaseDiez(char *num1, char *num2, char *resultado) {
    int i = strlen(num1) - 1, j = strlen(num2) - 1, k = 0, m;
    int carry = 0;
    int temp[1002];
    while (i >= 0 || j >= 0 || carry) {
        int digito1 = (i >= 0) ? num1[i--] - '0' : 0;
        int digito2 = (j >= 0) ? num2[j--] - '0' : 0;
        int suma = digito1 + digito2 + carry;

        temp[k++] = suma % 10;
        carry = suma / 10;
    }

    for (m = 0; m < k; m++) {
        resultado[m] = temp[k - m - 1] + '0';
    }

    resultado[k] = '\0';
}

/**
 * @brief Removes leading zeros from a string representing a number.
 *
 * @param numero Pointer to the string representing the number.
 *
 * If the number is all zeros, the string is replaced with "0".
 */
void eliminarCerosIniciales(char *numero) {
    int i = 0;
    while (numero[i] == '0') {
        i++;
    }

    if (numero[i] == '\0') {
        strcpy(numero, "0");
    } else {
        memmove(numero, numero + i, strlen(numero) - i + 1);
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
    char num1[1001], num2[1001], resultado[1002];

    for (i = 0; i < casos; i++) {
        scanf("%s %s", num1, num2);
        sumaBaseDiez(num1, num2, resultado);
        eliminarCerosIniciales(resultado);
        printf("%s\n", resultado);
    }

    return 0;
}