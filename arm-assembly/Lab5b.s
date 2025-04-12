    .section .data
    .balign 4
amount:             .word 0        @ Número de casos
Belgium:            .word 0
England:            .word 0
Norway:             .word 0
Ireland:            .word 0
France:             .word 0
MCD:                .word 0
MIN:                .word 0
BelgiumPassengers:  .word 0
EnglandPassengers:  .word 0
NorwayPassengers:   .word 0
IrelandPassengers:  .word 0
FrancePassengers:   .word 0
total:              .word 0
TEMP:               .word 0
COUNT:              .word 3        @ Valor inicial para incorporar los 3 países extra
ZERO:               .word 0
ONE:                .word 1
TWO:                .word 2
THREE:              .word 3

input:              .asciz "%d"
output:             .asciz "%d\n"

    .section .text
    .global main
    .global scanf
    .global printf

    .func main
main:
    PUSH {LR}

    @ Leer el número de casos (almacenado en "amount")
    LDR   R0, =input         @ Dirección del formato
    LDR   R1, =amount        @ Dirección de amount
    BL    scanf

for:
    @ Verificar si se terminan los casos
    LDR   R1, =amount
    LDR   R0, [R1]
    CMP   R0, #0
    BLE   halt               @ Si amount < 0, terminamos

    @ Decrementar en 1 el contador de casos
    LDR   R1, =amount
    LDR   R0, [R1]
    SUB   R0, R0, #1         @ amount = amount - 1
    STR   R0, [R1]

    B     read

read:
    @ Reinicializar contadores y variables acumuladoras
    MOV   R0, #0
    LDR   R1, =TEMP
    STR   R0, [R1]
    LDR   R1, =BelgiumPassengers
    STR   R0, [R1]
    LDR   R1, =EnglandPassengers
    STR   R0, [R1]
    LDR   R1, =NorwayPassengers
    STR   R0, [R1]
    LDR   R1, =IrelandPassengers
    STR   R0, [R1]
    LDR   R1, =FrancePassengers
    STR   R0, [R1]
    LDR   R1, =total
    STR   R0, [R1]

    @ Reinicializar COUNT a 3 para este caso
    MOV   R0, #3
    LDR   R1, =COUNT
    STR   R0, [R1]

    @ Leer los pasajeros de cada país
    LDR   R0, =input
    LDR   R1, =Belgium
    BL    scanf

    LDR   R0, =input
    LDR   R1, =England
    BL    scanf

    LDR   R0, =input
    LDR   R1, =Norway
    BL    scanf

    LDR   R0, =input
    LDR   R1, =Ireland
    BL    scanf

    LDR   R0, =input
    LDR   R1, =France
    BL    scanf

    @ Inicializar el GCD usando Belgium y England
    LDR   R1, =Belgium
    LDR   R0, [R1]         @ R0 = Belgium
    LDR   R1, =MCD
    STR   R0, [R1]         @ MCD = Belgium

    LDR   R1, =England
    LDR   R0, [R1]         @ R0 = England
    LDR   R1, =MIN
    STR   R0, [R1]         @ MIN = England

    B     mcdCalc

mcdCalc:
    @ Calcular: R4 = MCD - MIN
    LDR   R1, =MCD
    LDR   R0, [R1]         @ R0 = MCD
    LDR   R1, =MIN
    LDR   R1, [R1]         @ R1 = MIN
    SUB   R4, R0, R1       @ R4 = MCD - MIN
    CMP   R4, #0
    BEQ   minChange       @ Si MCD == MIN, pasar a incorporar otro país
    BGT   mcdRecursion    @ Si MCD > MIN, seguir restando
    BLT   invertMin       @ Si MCD < MIN, intercambiar

mcdRecursion:
    CMP   R4, #0
    BLT   invertMin
    LDR   R1, =MCD
    STR   R4, [R1]        @ MCD = MCD - MIN
    B     mcdCalc

invertMin:
    @ Intercambiar MCD y MIN
    LDR   R1, =MCD
    LDR   R0, [R1]        @ R0 = MCD
    LDR   R2, =TEMP
    STR   R0, [R2]        @ TEMP = MCD
    LDR   R1, =MIN
    LDR   R0, [R1]        @ R0 = MIN
    LDR   R2, =MCD
    STR   R0, [R2]        @ MCD = MIN
    LDR   R1, =TEMP
    LDR   R0, [R1]        @ R0 = antiguo MCD
    LDR   R2, =MIN
    STR   R0, [R2]        @ MIN = antiguo MCD
    B     mcdCalc

minChange:
    @ Decisión sin actualizar COUNT permanentemente
    LDR   R1, =COUNT
    LDR   R0, [R1]        @ R0 = COUNT
    SUB   R2, R0, #1      @ R2 = COUNT - 1
    CMP   R2, #0
    BGT   norwayNext      @ Si (COUNT-1) > 0, ir a norwayNext
    B     bpassengers     @ Si (COUNT-1) <= 0, terminar la incorporación de países

norwayNext:
    @ Evaluar: Si (COUNT-3)==0, usar Norway; de lo contrario, ir a irelandNext
    LDR   R1, =COUNT
    LDR   R0, [R1]        @ R0 = COUNT
    SUB   R0, R0, #3
    CMP   R0, #0
    BEQ   setNorway
    B     irelandNext

irelandNext:
    @ Evaluar: Si (COUNT-2)==0, usar Ireland; de lo contrario, usar France
    LDR   R1, =COUNT
    LDR   R0, [R1]        @ R0 = COUNT
    SUB   R0, R0, #2
    CMP   R0, #0
    BEQ   setIreland
    B     setFrance

setNorway:
    @ Incorporar Noruega
    LDR   R1, =Norway
    LDR   R0, [R1]
    LDR   R1, =MIN
    STR   R0, [R1]        @ MIN = Norway
    B     countReduce

setIreland:
    @ Incorporar Irlanda
    LDR   R1, =Ireland
    LDR   R0, [R1]
    LDR   R1, =MIN
    STR   R0, [R1]        @ MIN = Ireland
    B     countReduce

setFrance:
    @ Incorporar Francia
    LDR   R1, =France
    LDR   R0, [R1]
    LDR   R1, =MIN
    STR   R0, [R1]        @ MIN = France
    B     countReduce

countReduce:
    @ Actualizar COUNT (efecto “oficial”) y retomar el GCD
    LDR   R1, =COUNT
    LDR   R0, [R1]
    SUB   R0, R0, #1
    STR   R0, [R1]
    B     mcdCalc

bpassengers:
    @ Calcular número de aviones para Bélgica
bpassLoop:
    LDR   R1, =Belgium
    LDR   R0, [R1]
    CMP   R0, #0
    BLE   epassengers     @ Si Belgium <= 0, pasar a England
    LDR   R1, =MCD
    LDR   R1, [R1]
    SUB   R0, R0, R1      @ Belgium = Belgium - MCD
    LDR   R2, =Belgium
    STR   R0, [R2]
    LDR   R1, =BelgiumPassengers
    LDR   R0, [R1]
    ADD   R0, R0, #1
    LDR   R1, =BelgiumPassengers
    STR   R0, [R1]
    B     bpassLoop

epassengers:
    @ -Calcular número de aviones para Inglaterra
epassLoop:
    LDR   R1, =England
    LDR   R0, [R1]
    CMP   R0, #0
    BLE   npassengers
    LDR   R1, =MCD
    LDR   R1, [R1]
    SUB   R0, R0, R1      @ England = England - MCD
    LDR   R2, =England
    STR   R0, [R2]
    LDR   R1, =EnglandPassengers
    LDR   R0, [R1]
    ADD   R0, R0, #1
    LDR   R1, =EnglandPassengers
    STR   R0, [R1]
    B     epassLoop

npassengers:
    @ Calcular número de aviones para Noruega
npassLoop:
    LDR   R1, =Norway
    LDR   R0, [R1]
    CMP   R0, #0
    BLE   ipassengers
    LDR   R1, =MCD
    LDR   R1, [R1]
    SUB   R0, R0, R1      @ Norway = Norway - MCD
    LDR   R2, =Norway
    STR   R0, [R2]
    LDR   R1, =NorwayPassengers
    LDR   R0, [R1]
    ADD   R0, R0, #1
    LDR   R1, =NorwayPassengers
    STR   R0, [R1]
    B     npassLoop

ipassengers:
    @ Calcular número de aviones para Irlanda
ipassLoop:
    LDR   R1, =Ireland
    LDR   R0, [R1]
    CMP   R0, #0
    BLE   fpassengers
    LDR   R1, =MCD
    LDR   R1, [R1]
    SUB   R0, R0, R1      @ Ireland = Ireland - MCD
    LDR   R2, =Ireland
    STR   R0, [R2]
    LDR   R1, =IrelandPassengers
    LDR   R0, [R1]
    ADD   R0, R0, #1
    LDR   R1, =IrelandPassengers
    STR   R0, [R1]
    B     ipassLoop

fpassengers:
    @ Calcular número de aviones para Francia
fpassLoop:
    LDR   R1, =France
    LDR   R0, [R1]
    CMP   R0, #0
    BLE   totalPassengers
    LDR   R1, =MCD
    LDR   R1, [R1]
    SUB   R0, R0, R1      @ France = France - MCD
    LDR   R2, =France
    STR   R0, [R2]
    LDR   R1, =FrancePassengers
    LDR   R0, [R1]
    ADD   R0, R0, #1
    LDR   R1, =FrancePassengers
    STR   R0, [R1]
    B     fpassLoop

totalPassengers:
    @ Calcular el total de aviones (suma de los contadores)
    LDR   R1, =BelgiumPassengers
    LDR   R0, [R1]
    LDR   R1, =EnglandPassengers
    LDR   R2, [R1]
    ADD   R0, R0, R2
    LDR   R1, =NorwayPassengers
    LDR   R2, [R1]
    ADD   R0, R0, R2
    LDR   R1, =IrelandPassengers
    LDR   R2, [R1]
    ADD   R0, R0, R2
    LDR   R1, =FrancePassengers
    LDR   R2, [R1]
    ADD   R0, R0, R2
    LDR   R1, =total
    STR   R0, [R1]
    B     end

end:
    @ Imprimir la capacidad (MCD), los vuelos por país y el total
    LDR   R0, =output
    LDR   R1, =MCD
    LDR   R1, [R1]
    BL    printf

    LDR   R0, =output
    LDR   R1, =BelgiumPassengers
    LDR   R1, [R1]
    BL    printf

    LDR   R0, =output
    LDR   R1, =EnglandPassengers
    LDR   R1, [R1]
    BL    printf

    LDR   R0, =output
    LDR   R1, =NorwayPassengers
    LDR   R1, [R1]
    BL    printf

    LDR   R0, =output
    LDR   R1, =IrelandPassengers
    LDR   R1, [R1]
    BL    printf

    LDR   R0, =output
    LDR   R1, =FrancePassengers
    LDR   R1, [R1]
    BL    printf

    LDR   R0, =output
    LDR   R1, =total
    LDR   R1, [R1]
    BL    printf

    B     for

halt:
    POP   {LR}
    MOV   R0, #0
    BX    LR
.endfunc
