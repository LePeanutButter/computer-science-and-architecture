    .data
    .balign 4
a:      .word 0
b:      .word 0
c:      .word 0
x:      .word 0
res:    .word 0

input:  .asciz "%d"
output: .asciz "%d\n"

.text

.global main
.global scanf
.global printf

.func main
main:
    PUSH {LR}

    @ Leer variable a
    LDR   R0, =input
    LDR   R1, =a
    BL    scanf

    @ Leer variable b
    LDR   R0, =input
    LDR   R1, =b
    BL    scanf

    @ Leer variable c
    LDR   R0, =input
    LDR   R1, =c
    BL    scanf

    @ Leer variable x
    LDR   R0, =input
    LDR   R1, =x
    BL    scanf

    @ Cargar el valor de a en R1
    LDR   R0, =a
    LDR   R1, [R0]       @ R1 = a

    @ Cargar el valor de b en R2
    LDR   R0, =b
    LDR   R2, [R0]       @ R2 = b

    @ Cargar el valor de c en R3
    LDR   R0, =c
    LDR   R3, [R0]       @ R3 = c

    @ Cargar el valor de x en R4
    LDR   R0, =x
    LDR   R4, [R0]       @ R4 = x

    @ Calcular x^2 en R5: R5 = x * x
    MUL   R5, R4, R4

    @ Calcular a*x^2 en R6: R6 = a * (x^2)
    MUL   R6, R1, R5

    @ Calcular b*x en R7: R7 = b * x
    MUL   R7, R2, R4

    @ Sumar (a*x^2 + b*x) en R8
    ADD   R8, R6, R7

    @ Sumar c: R8 = a*x^2 + b*x + c
    ADD   R8, R8, R3

    @ Almacenar el resultado en la variable res
    LDR   R0, =res
    STR   R8, [R0]

    @ Imprimir el resultado
    LDR   R0, =output
    LDR   R1, =res
    LDR   R1, [R1]
    BL    printf

    POP   {LR}
    MOV   R0, #0
    BX    LR
.endfunc
