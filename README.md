# MARIE Assembly
## Laboratory No. 3a
Nombre del archivo fuente: sumamn.mas

Tiempo límite: 1

Implementar un programa en lenguaje ensamblador de MARIE, que dados dos (2) números enteros m y n (m ≤ n), calcule la suma desde m hasta n (inclusive).
### Input
La entrada se debe tomar desde la entrada estándar. Como primera línea un número que indica la cantidad de casos a revisar. Por cada caso, en líneas separadas, los números correspondientes a m y n.
### Output
La salida debe enviarse a la salida estándar. Por cada caso, en líneas separadas, la salida es la suma desde el m leído hasta el n leído (inclusive).

## Laboratory No. 3b
Nombre del archivo fuente: maxmin.mas

Tiempo límite: 1

Implementar un programa en lenguaje ensamblador de MARIE, que dados tres (3) números enteros escriba la suma del máximo y el mínimo de los tres (3) números.
### Input
La entrada se debe tomar desde la entrada estándar. Como primera línea un número que indica la cantidad de casos a revisar. Para cada caso, en líneas separadas, los tres (3) números. 
### Output
La salida debe enviarse a la salida estándar. Por cada caso, en líneas separadas, la salida es la suma del máximo y el mínimo de los tres (3) números del caso .


## Laboratory No. 3c
Nombre del archivo fuente: cuadratica.mas

Tiempo límite: 1

Implementar un programa en lenguaje ensamblador de MARIE, que dados los coeficientes de una ecuación cuadrática (aX^2 + bX + c), halle cuantas raíces reales tiene (aX^2 + bX + c = 0).
### Input
La entrada se debe tomar desde la entrada estándar. Como primera línea un número que indica la cantidad de casos a ´ revisar. Por cada caso, en líneas separadas, los coeficientes a, b, c de la ecuación cuadrática. 
### Output
La salida debe enviarse a la salida estándar. Por cada caso, en líneas separadas, la salida es el número de raíces reales.


## Laboratory No. 4a
Usando lenguaje ensamblador de MARIE, leer tres coeficientes a, b, c, leer el valor de X y evaluar el polinomio a * X ^ 2 + b * X + c, mostrar el resultado en pantalla.

## Laboratory No. 4b
Escriba un programa en lenguaje ensamblador MARIE, que resuelva la siguiente situación:

Una aerolínea que parte de Alemania lleva pasajeros a todo el mundo. Su sistema de compra de boletos
proporciona resultados del número de pasajeros que viajan a Bélgica, Inglaterra, Noruega, Irlanda y Francia. Se desea el mayor número de personas por avión y que todos los aviones tengan la misma capacidad.
Se debe calcular:
• Cuantos pasajeros habrá por avión.
• Cuantos aviones volaran a cada país.
• Cuantos aviones volaran en total.
### Input
La entrada se debe tomar desde la entrada estándar. La entrada está compuesta por el n ´ umero de pasajeros que viajan a Bélgica, Inglaterra, Noruega, Irlanda y Francia respectivamente. Como primera línea viene un número que indica cuantos casos se deben resolver.

### Output
La salida debe enviarse a la salida estándar.
La salida está compuesta por el número de pasajeros que habrá por avión, el número de aviones que volaran a cada país (Bélgica, Inglaterra, Noruega, Irlanda y Francia respectivamente) y el número de aviones que volaran en total.

## Laboratory No. 4c
Escriba un programa en lenguaje ensamblador MARIE que calcule la fracción egipcia de un número racional positivo. Una fracción egipcia es la suma de fracciones unitarias distintas, es decir, de fracciones de numerador 1 y cuyos denominadores sean enteros positivos distintos. Se puede demostrar que cualquier número racional positivo se puede escribir como fracción egipcia. Un algoritmo que produce la representación del número racional r = a b entre 0 y 1 como fracción egipcia es el algoritmo voraz de James Joseph Sylvester, que consiste en:
1. Encontrar la fracción unitaria más ajustada a r pero menor que r. El denominador se puede hallar dividiendo b entre a, ignorando el residuo y sumando
2. Si no hay residuo, r es una fracción unitaria, así que ya no hay que seguir calculando.
3. Restar la fracción unitaria de r y aplicar de nuevo el paso 1 utilizando la diferencia entre las dos fracciones como r.
### Input
La entrada se debe tomar desde la entrada estándar. La entrada está compuesta por dúos de líneas, donde cada línea contiene el numerador y el denominador de la fracción respectivamente. Como primera línea viene un número que indica cuantas fracciones se deben resolver
### Output
La salida debe enviarse a la salida estándar. La salida es una secuencia de líneas con los denominadores de la suma fracciones egipcias calculada y una línea que contiene un 0.
