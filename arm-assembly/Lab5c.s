    .section .data
    .balign 4
amount:       .word 0
A:            .word 0
B:            .word 0
AC:           .word 0
BC:           .word 0
tempA:        .word 0
tempB:        .word 0
TEMP:         .word 0
ACOUNT:       .word 0
BCOUNT:       .word 0
MCD:          .word 0
MIN:          .word 0
COEFICIENT:   .word 0
ZERO:         .word 0
ONE:          .word 1

input:        .asciz "%d"
output:       .asciz "%d\n"

    .section .text
    .global main
    .global scanf
    .global printf
    .func main
main:
    PUSH {LR}

    @ Leer el valor de 'amount'
    LDR   R0, =input       @ Dirección de la cadena de formato
    LDR   R1, =amount      @ Dirección de la variable amount
    BL    scanf

loop:
    @ Cargar 'amount' y verificar: si amount <= 0, terminar
    LDR   R0, =amount
    LDR   R0, [R0]
    CMP   R0, #0
    BLE   endLoop

    @ Restar ONE a 'amount'
    LDR   R1, =ONE
    LDR   R1, [R1]
    SUB   R0, R0, R1       @ amount = amount - 1
    LDR   R1, =amount
    STR   R0, [R1]

    @ Leer variable A y duplicar en tempA
    LDR   R0, =input
    LDR   R1, =A
    BL    scanf
    LDR   R1, =A
    LDR   R0, [R1]
    LDR   R2, =tempA
    STR   R0, [R2]

    @ Leer variable B y duplicar en tempB
    LDR   R0, =input
    LDR   R1, =B
    BL    scanf
    LDR   R1, =B
    LDR   R0, [R1]
    LDR   R2, =tempB
    STR   R0, [R2]

setMCDVariables:
    @ Inicializar MCD con A
    LDR   R0, =A
    LDR   R0, [R0]
    LDR   R1, =MCD
    STR   R0, [R1]
    @ Inicializar MIN con B
    LDR   R0, =B
    LDR   R0, [R0]
    LDR   R1, =MIN
    STR   R0, [R1]

mcdCalcOriginal:
    @ Calcular: MCD - MIN
    LDR   R0, =MCD
    LDR   R0, [R0]
    LDR   R1, =MIN
    LDR   R1, [R1]
    SUB   R0, R0, R1      @ R0 = MCD - MIN
    CMP   R0, #0
    BEQ   numeratorFractionOriginal  @ Si cero, se salta al bloque siguiente
    B     mcdRecursionOriginal

mcdRecursionOriginal:
    @ Si (MCD - MIN) > 0 se salta la inversión; si es negativo se invierten MCD y MIN
    CMP   R0, #0
    BGT   mcdRecSkip
    B     invertMinOriginal
mcdRecSkip:
    LDR   R1, =MCD
    STR   R0, [R1]       @ MCD = MCD - MIN (resultado positivo)
    B     mcdCalcOriginal

invertMinOriginal:
    @ Intercambiar MCD y MIN
    LDR   R0, =MCD
    LDR   R0, [R0]       @ R0 = MCD
    LDR   R2, =TEMP
    STR   R0, [R2]       @ TEMP = MCD
    LDR   R0, =MIN
    LDR   R0, [R0]       @ R0 = MIN
    LDR   R1, =MCD
    STR   R0, [R1]       @ MCD = MIN
    LDR   R0, =TEMP
    LDR   R0, [R0]       @ R0 = antiguo MCD
    LDR   R1, =MIN
    STR   R0, [R1]       @ MIN = antiguo MCD
    B     mcdCalcOriginal

numeratorFractionOriginal:
    @ Reducir A restando MCD mientras A > 0
    LDR   R0, =A
    LDR   R0, [R0]
    CMP   R0, #0
    BLE   denominatorFractionOriginal
    @ A = A - MCD
    LDR   R1, =MCD
    LDR   R1, [R1]
    SUB   R0, R0, R1
    LDR   R2, =A
    STR   R0, [R2]
    @ Incrementar ACOUNT
    LDR   R0, =ACOUNT
    LDR   R0, [R0]
    LDR   R1, =ONE
    LDR   R1, [R1]
    ADD   R0, R0, R1
    LDR   R2, =ACOUNT
    STR   R0, [R2]
    B     numeratorFractionOriginal

denominatorFractionOriginal:
    @ Reducir B restando MCD mientras B > 0
    LDR   R0, =B
    LDR   R0, [R0]
    CMP   R0, #0
    BLE   fractionReduceOriginal
    @ B = B - MCD
    LDR   R1, =MCD
    LDR   R1, [R1]
    SUB   R0, R0, R1
    LDR   R2, =B
    STR   R0, [R2]
    @ Incrementar BCOUNT
    LDR   R0, =BCOUNT
    LDR   R0, [R0]
    LDR   R1, =ONE
    LDR   R1, [R1]
    ADD   R0, R0, R1
    LDR   R2, =BCOUNT
    STR   R0, [R2]
    B     denominatorFractionOriginal

fractionReduceOriginal:
    @ Copiar ACOUNT en A y en tempA
    LDR   R0, =ACOUNT
    LDR   R0, [R0]
    LDR   R1, =A
    STR   R0, [R1]
    LDR   R1, =tempA
    STR   R0, [R1]
    @ Copiar BCOUNT en B y en tempB
    LDR   R0, =BCOUNT
    LDR   R0, [R0]
    LDR   R1, =B
    STR   R0, [R1]
    LDR   R1, =tempB
    STR   R0, [R1]
    @ Limpiar: poner 0 en TEMP, ACOUNT, BCOUNT, MCD, MIN, AC, BC y COEFICIENT
    MOV   R0, #0
    LDR   R1, =TEMP
    STR   R0, [R1]
    LDR   R1, =ACOUNT
    STR   R0, [R1]
    LDR   R1, =BCOUNT
    STR   R0, [R1]
    LDR   R1, =MCD
    STR   R0, [R1]
    LDR   R1, =MIN
    STR   R0, [R1]
    LDR   R1, =AC
    STR   R0, [R1]
    LDR   R1, =BC
    STR   R0, [R1]
    LDR   R1, =COEFICIENT
    STR   R0, [R1]
    B     division

division:
    @ División por restas sucesivas: actualizar tempB y aumentar COEFICIENT
    LDR   R0, =tempB
    LDR   R0, [R0]       @ R0 = tempB
    LDR   R1, =tempA
    LDR   R1, [R1]       @ R1 = tempA
    SUB   R0, R0, R1     @ R0 = tempB - tempA
    CMP   R0, #0
    BLE   isZero        @ Si tempB - tempA <= 0, saltar a isZero
    @ Actualizar tempB
    LDR   R2, =tempB
    STR   R0, [R2]
    @ Incrementar COEFICIENT
    LDR   R0, =COEFICIENT
    LDR   R0, [R0]
    LDR   R1, =ONE
    LDR   R1, [R1]
    ADD   R0, R0, R1
    LDR   R2, =COEFICIENT
    STR   R0, [R2]
    B     division

isZero:
    @ Si el resultado de la resta es cero: según SkipCond 400 se omite el salto
    CMP   R0, #0
    BEQ   common_isZero   @ Si R0 == 0, omite Jump ACcalc y ejecuta el bloque siguiente
    B     ACcalc

common_isZero:
    @ Incrementar COEFICIENT y saltar a end
    LDR   R0, =COEFICIENT
    LDR   R0, [R0]
    LDR   R1, =ONE
    LDR   R1, [R1]
    ADD   R0, R0, R1
    LDR   R2, =COEFICIENT
    STR   R0, [R2]
    B     end

ACcalc:
    @ Asignar B a tempB y actualizar COEFICIENT
    LDR   R0, =B
    LDR   R0, [R0]
    LDR   R1, =tempB
    STR   R0, [R1]
    LDR   R0, =COEFICIENT
    LDR   R0, [R0]
    LDR   R1, =ONE
    LDR   R1, [R1]
    ADD   R0, R0, R1
    LDR   R2, =COEFICIENT
    STR   R0, [R2]
    @ Imprimir COEFICIENT
    LDR   R0, =output
    LDR   R1, =COEFICIENT
    LDR   R1, [R1]
    BL    printf

multiplyAC:
    @ Incrementar AC según tempA
    LDR   R0, =tempA
    LDR   R0, [R0]
    CMP   R0, #0
    BLE   numerator      @ Si tempA <= 0, saltar a numerator
    LDR   R1, =ONE
    LDR   R1, [R1]
    SUB   R0, R0, R1     @ tempA = tempA - 1
    LDR   R2, =tempA
    STR   R0, [R2]
    @ AC = AC + COEFICIENT
    LDR   R0, =AC
    LDR   R0, [R0]
    LDR   R1, =COEFICIENT
    LDR   R1, [R1]
    ADD   R0, R0, R1
    LDR   R2, =AC
    STR   R0, [R2]
    B     multiplyAC

numerator:
    @ Calcular A = AC - B
    LDR   R0, =AC
    LDR   R0, [R0]
    LDR   R1, =B
    LDR   R1, [R1]
    SUB   R0, R0, R1
    LDR   R2, =A
    STR   R0, [R2]
    B     multiplyBC

multiplyBC:
    @ Incrementar BC según tempB
    LDR   R0, =tempB
    LDR   R0, [R0]
    CMP   R0, #0
    BLE   clearVariables  @ Si tempB <= 0, continuar con clearVariables
    LDR   R1, =ONE
    LDR   R1, [R1]
    SUB   R0, R0, R1     @ tempB = tempB - 1
    LDR   R2, =tempB
    STR   R0, [R2]
    @ BC = BC + COEFICIENT
    LDR   R0, =BC
    LDR   R0, [R0]
    LDR   R1, =COEFICIENT
    LDR   R1, [R1]
    ADD   R0, R0, R1
    LDR   R2, =BC
    STR   R0, [R2]
    B     multiplyBC

clearVariables:
    @ tempA = A; B y tempB se actualizan con BC
    LDR   R0, =A
    LDR   R0, [R0]
    LDR   R1, =tempA
    STR   R0, [R1]
    LDR   R0, =BC
    LDR   R0, [R0]
    LDR   R1, =B
    STR   R0, [R1]
    LDR   R1, =tempB
    STR   R0, [R1]
    B     setMCDVariables

end:
    @ Imprimir COEFICIENT
    LDR   R0, =output
    LDR   R1, =COEFICIENT
    LDR   R1, [R1]
    BL    printf
    @ Imprimir ZERO
    LDR   R0, =output
    LDR   R1, =ZERO
    LDR   R1, [R1]
    BL    printf
    @ Reiniciar COEFICIENT a 0 y repetir el ciclo
    MOV   R0, #0
    LDR   R1, =COEFICIENT
    STR   R0, [R1]
    B     loop

endLoop:
    @ Finalizar el programa
    POP   {LR}
    MOV   R0, #0
    BX    LR
.endfunc
