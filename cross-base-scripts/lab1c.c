/**
 * @file lab1c.c
 * @brief Laboratory 1c - Base conversion from any positional base (2–36) to base 10
 *
 * This program reads a series of numbers in positional bases (from 2 to 36) and
 * converts each of them to their base 10 equivalent.
 *
 * ### Input:
 * The first line contains an integer indicating how many conversions will be performed.
 * Each following line contains two elements: a base (integer from 2 to 36),
 * and a string representing a positive integer in that base (up to 1000 characters).
 *
 * ### Output:
 * For each input line, the base-10 representation of the given number is printed on a new line.
 * Leading zeros are removed.
 *
 * ### Time Limit:
 * 1
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>


/**
 * @brief Converts a number from an arbitrary base (2–36) to base 10.
 *
 * @param numero The number to convert (as a string).
 * @param baseOrigen The base in which the input number is expressed.
 * @param resultado Buffer where the base 10 result will be stored as a string.
 *
 * This function simulates long multiplication by accumulating the value of each digit,
 * validating each character, and performing digit-wise base conversion with carry management.
 */
void convertirABase10(char *numero, int baseOrigen, char *resultado) {
    int len = strlen(numero);
    int temp[1001] = {0};
    int i, j;
    int res_len = 0;

    for (i = 0; i < len; i++) {
        char digito = numero[i];
        int valor;

        if ('0' <= digito && digito <= '9') {
            valor = digito - '0';
        } else if ('A' <= digito && digito <= 'Z') {
            valor = digito - 'A' + 10;
        } else if ('a' <= digito && digito <= 'z') {
            valor = digito - 'a' + 10;
        } else {
            printf("Error: Dígito inválido: %c\n", digito);
            strcpy(resultado, "0");
            return;
        }

        if (valor >= baseOrigen) {
            printf("Error: Dígito fuera de rango para la base %d: %c\n", baseOrigen, digito);
            strcpy(resultado, "0");
            return;
        }

        for (j = 0; j < res_len; j++) {
            temp[j] *= baseOrigen;
        }
        temp[0] += valor;

        for (j = 0; j < res_len || temp[j] != 0; j++) {
            if (j == res_len) res_len++;
            temp[j + 1] += temp[j] / 10;
            temp[j] %= 10;
        }
    }

    i = res_len - 1;
    while (i >= 0 && temp[i] == 0) {
        i--;
    }

    if (i < 0) {
        strcpy(resultado, "0");
    } else {
        int k = 0;
        for (; i >= 0; i--) {
            resultado[k++] = temp[i] + '0';
        }
        resultado[k] = '\0';
    }
}


/**
 * @brief Main function: handles input and output of the conversion program.
 *
 * @return int Exit code.
 */
int main() {
    int casos, baseOrigen, i;
    char numero[1001];
    char resultado[2002];

    scanf("%d", &casos);

    for (i = 0; i < casos; i++) {
        scanf("%d %s", &baseOrigen, numero);

        if (baseOrigen < 2 || baseOrigen > 36) {
            printf("Error: Base fuera del rango permitido (2-36)\n");
            continue;
        }

        convertirABase10(numero, baseOrigen, resultado);
        printf("%s\n", resultado);
    }

    return 0;
}