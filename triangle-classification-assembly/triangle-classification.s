@  TRIANGLE GEOMETRY ANALYSIS
@  Author: Santiago Botero
@  Description:
@    This ARM program reads the coordinates of three points multiple times,
@    determines whether they form a valid triangle, and if so:
@    - Calculates the distances between points (sides)
@    - Computes the perimeter and area
@    - Classifies the triangle by sides and angles
@    The results are printed for each set.

.section .data
.balign 4
@ VARIABLES 
n:                  .word 0
x1:                 .word 0
y1:                 .word 0
x2:                 .word 0
y2:                 .word 0
x3:                 .word 0
y3:                 .word 0
a:                  .word 0
b:                  .word 0
c:                  .word 0

@TRIANGLE CLASS METHODS VARIABLES AND PARAMETERS
@ Distance function parameters and variables
d_x1:               .word 0
d_x2:               .word 0
d_y1:               .word 0
d_y2:               .word 0
d_distance:         .word 0

@ GLOBAL FUNCTIONS VARIABLES AND PARAMETERS
@ Square root function parameter and variables
sqrt_n:             .word 0
sqrt_count:         .word 0

@ Division function parameters and variables
d_a:                .word 0
d_b:                .word 0
d_count:            .word 0

@ MESSAGES
ERROR_MESSAGE:      .word -200
LINE_SKIP:          .word -100




input:              .asciz "%d"
output:             .asciz "%d\n"

.text
.global main
.extern scanf
.extern printf
.func main

@ MAIN LOGIC
main: 
    PUSH {LR}

    LDR   R0, =input    @ Read number of triangles to process
    LDR   R1, =n
    BL    scanf

@ Load triangle counter
for:
    LDR   R1, =n
    LDR   R0, [R1]
    CMP   R0, #0
    BLE   end

    LDR   R1, =n
    LDR   R0, [R1]
    SUB   R0, R0, #1
    STR   R0, [R1]

@ Read coordinates for points A(x1,y1), B(x2,y2), C(x3,y3)
triangle:
    LDR   R0, =input
    LDR   R1, =x1           @ Set x1
    BL    scanf
    LDR   R0, =input
    LDR   R1, =y1           @ Set y1
    BL    scanf
    LDR   R0, =input
    LDR   R1, =x2           @ Set x2
    BL    scanf
    LDR   R0, =input
    LDR   R1, =y2           @ Set y2
    BL    scanf
    LDR   R0, =input
    LDR   R1, =x3           @ Set x3
    BL    scanf
    LDR   R0, =input
    LDR   R1, =y3           @ Set y3
    BL    scanf

    PUSH  {LR}
    BL    is_triangle
    POP   {LR}

    B     display_properties

display_properties:
    PUSH  {LR}
    BL    set_distances
    POP   {LR}

    PUSH  {LR}
    BL    area
    POP   {LR}

    PUSH  {LR}
    BL    perimeter
    POP   {LR}

    PUSH  {LR}
    BL    side
    POP   {LR}

    PUSH  {LR}
    BL    angle
    POP   {LR}

    LDR   R0, =output
    LDR   R1, =LINE_SKIP
    LDR   R1, [R1]

    PUSH  {LR}
    BL    printf
    POP   {LR}

    B     for

@ Set distances for sides a, b, c
set_distances:
    PUSH  {LR}
    BL    set_a
    POP   {LR}

    PUSH  {LR}
    BL    set_b
    POP   {LR}

    PUSH  {LR}
    BL    set_c
    POP   {LR}

    BX    LR

set_a:
    LDR   R0, =d_x1
    LDR   R1, =x1
    STR   R1, [R0]

    LDR   R0, =d_y1
    LDR   R1, =y1
    STR   R1, [R0]

    LDR   R0, =d_x2
    LDR   R1, =x2
    STR   R1, [R0]

    LDR   R0, =d_y2
    LDR   R1, =y2
    STR   R1, [R0]

    PUSH  {LR}
    BL    distance
    POP   {LR}

    LDR   R0, =d_distance
    LDR   R1, [R0]
    LDR   R0, =a
    STR   R1, [R0]

    BX    LR

set_b:
    LDR   R0, =d_x1
    LDR   R1, =x2
    STR   R1, [R0]

    LDR   R0, =d_y1
    LDR   R1, =y2
    STR   R1, [R0]

    LDR   R0, =d_x2
    LDR   R1, =x3
    STR   R1, [R0]

    LDR   R0, =d_y2
    LDR   R1, =y3
    STR   R1, [R0]

    PUSH  {LR}
    BL    distance
    POP   {LR}

    LDR   R0, =d_distance
    LDR   R1, [R0]
    LDR   R0, =b
    STR   R1, [R0]

    BX    LR

set_c:
    LDR   R0, =d_x1
    LDR   R1, =x3
    STR   R1, [R0]

    LDR   R0, =d_y1
    LDR   R1, =y3
    STR   R1, [R0]

    LDR   R0, =d_x2
    LDR   R1, =x1
    STR   R1, [R0]

    LDR   R0, =d_y2
    LDR   R1, =y1
    STR   R1, [R0]

    PUSH  {LR}
    BL    distance
    POP   {LR}

    LDR   R0, =d_distance
    LDR   R1, [R0]
    LDR   R0, =c
    STR   R1, [R0]

    BX    LR


@ FUNCTION: is_triangle
@ Description: Determines whether points A(x1,y1), B(x2,y2), and C(x3,y3)
@ form a valid triangle using the determinant method.
@ det = x1*(y2 - y3) - y1*(x2 - x3) + x2*y3 - y2*x3
@ If determinant = 0 → Not a triangle.
is_triangle:
    @ Load x1
    LDR   R0, =x1
    LDR   R1, [R0]      @ R1 = x1

    @ Compute y2 - y3
    LDR   R0, =y2
    LDR   R2, [R0]
    LDR   R0, =y3
    LDR   R3, [R0]
    SUB   R4, R2, R3    @ R4 = y2 - y3

    @ Compute x1*(y2 - y3)
    MOV   R4, R2        @ Copies (y2 - y3) in R2
    MUL   R4, R1, R2    @ R4 = x1*(y2 - y3)

    @ Load y1
    LDR   R0, =y1
    LDR   R1, [R0]      @ R1 = y1

    @ Compute x2 - x3
    LDR   R0, =x2
    LDR   R2, [R0]
    LDR   R0, =x3
    LDR   R3, [R0]
    SUB   R5, R2, R3    @ R5 = x2 - x3

    @ Compute y1*(x2 - x3)
    MOV   R2, R5        @ Copies (x2 - x3) in R2
    MUL   R5, R1, R2    @ R5 = y1*(x2 - x3)

    @ Compute x2*y3
    LDR   R0, =x2
    LDR   R1, [R0]
    LDR   R0, =y3
    LDR   R2, [R0]
    MUL   R6, R1, R2    @ R6 = x2*y3

    @ Compute y2*x3
    LDR   R0, =y2
    LDR   R1, [R0]
    LDR   R0, =x3
    LDR   R2, [R0]
    MUL   R7, R1, R2    @ R7 = y2*x3

    @ Compute determinant
    SUB   R1, R4, R5    @ R1 = x1*(y2 - y3) - y1*(x2 - x3)
    SUB   R2, R6, R7    @ R2 = x2*y3 - y2*x3
    ADD   R3, R1, R2    @ R3 = determinant

    CMP   R3, #0    @ If determinant == 0, points are colinear
    BEQ   not_triangle
    BX    LR    @ Valid triangle, continue processing

not_triangle:
    LDR   R0, =output
    LDR   R1, =ERROR_MESSAGE
    LDR   R1, [R1]

    PUSH  {LR}
    BL    printf
    POP   {LR}

    B     for

@ FUNCTION: distance
@ Description: Calculates distance between two points using:
@   √[(x2 - x1)² + (y2 - y1)²]
@ Uses auxiliary multiplication and sqrt routines.
distance:
    @ Clear variables
    LDR   R0, =d_distance
    MOV   R1, #0
    STR   R1, [R0]

    LDR   R0, =d_x1
    LDR   R1, [R0]
    LDR   R0, =d_x2
    LDR   R2, [R0]
    SUB   R3, R2, R1   @ R3 = x2 - x1
    MUL   R4, R3, R3   @ R4 = (x2 - x1)²

    LDR   R0, =d_y1
    LDR   R1, [R0]
    LDR   R0, =d_y2
    LDR   R2, [R0]
    SUB   R3, R2, R1   @ R3 = y2 - y1
    MUL   R5, R3, R3   @ R5 = (y2 - y1)²
    ADD   R6, R4, R5   @ R6 = (x2 - x1)² + (y2 - y1)²

    LDR    R0, =sqrt_n
    STR    R6, [R0]

    PUSH   {LR}
    BL     sqrt
    POP    {LR}

    LDR    R0, =sqrt_count
    LDR    R1, [R0]
    LDR    R0, =d_distance
    STR    R1, [R0]
    BX     LR

@ FUNCTION: area
@ Description: Uses determinants to calculate the area:
@ Area = [x1*(y2-y3)+x2*(y3-y1)+x3*(y1-y2)]/2 */
area:
    LDR   R0, =x1
    LDR   R1, [R0]
    LDR   R0, =y2
    LDR   R2, [R0]
    LDR   R0, =y3
    LDR   R3, [R0]
    SUB   R2, R2, R3
    MUL   R4, R1, R2    @ R4 = x1*(y2-y3)

    LDR   R0, =x2
    LDR   R1, [R0]
    LDR   R0, =y3
    LDR   R2, [R0]
    LDR   R0, =y1
    LDR   R3, [R0]
    SUB   R2, R2, R3
    MUL   R5, R1, R2    @ R5 = x2*(y3-y1)

    LDR   R0, =x3
    LDR   R1, [R0]
    LDR   R0, =y1
    LDR   R2, [R0]
    LDR   R0, =y2
    LDR   R3, [R0]
    SUB   R2, R2, R3
    MUL   R6, R1, R2    @ R6 = x3*(y1-y2)

    ADD   R1, R4, R5
    ADD   R2, R1, R6    @ R2 = x1*(y2-y3)+x2*(y3-y1)+x3*(y1-y2)

    LDR   R0, =d_a
    STR   R2, [R0]
    LDR   R0, =d_b
    MOV   R1, #2
    STR   R1, [R0]

    PUSH  {LR}
    BL    division
    POP   {LR}

    @ Load result and print it
    LDR   R0, =d_count
    LDR   R1, [R0]
    LDR   R0, =output

    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

@ FUNCTION: perimeter
@ Description: Adds up side lengths a + b + c.
perimeter:
    @ Load parameters into the acumulator
    LDR   R0, =a
    LDR   R1, [R0]
    LDR   R0, =b
    LDR   R2, [R0]
    LDR   R0, =c
    LDR   R3, [R0]

    ADD   R1, R1, R2
    ADD   R1, R1, R3

    LDR   R0, =output
    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

@ FUNCTION: side
@ Description: Classifies triangle by its sides:
@   - Equilateral: all sides equal
@   - Isosceles: two sides equal
@   - Scalene: all sides different
side:
    @ Load parameters into the acumulator
    LDR   R0, =a
    LDR   R1, [R0]
    LDR   R0, =b
    LDR   R2, [R0]
    LDR   R0, =c
    LDR   R3, [R0]

    CMP   R1, R2
    BEQ   a_b_equal
    CMP   R1, R3
    BEQ   isoceles_triangle
    CMP   R2, R3
    BEQ   isoceles_triangle
    B     scalene_triangle

a_b_equal:
    CMP   R2, R3
    BEQ   equilateral_triangle
    B     isoceles_triangle

equilateral_triangle:
    LDR   R0, =output
    MOV   R1, #1

    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

isoceles_triangle:
    LDR   R0, =output
    MOV   R1, #2

    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

scalene_triangle:
    LDR   R0, =output
    MOV   R1, #3

    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

@ FUNCTION: angle
@ Description: Classifies triangle by angles using Pythagorean Theorem:
@   - Right: c² = a² + b²
@   - Acute: c² < a² + b²
@   - Obtuse: c² > a² + b²
angle:
    @ Load parameters into the acumulator
    LDR   R0, =a
    LDR   R1, [R0]
    LDR   R0, =b
    LDR   R2, [R0]
    LDR   R0, =c
    LDR   R3, [R0]
    @ R4 for temporal variable

angle_loop:
    CMP   R1, R2
    BGT   ABSwap
    CMP   R2, R3
    BGT   BCSwap

    B     angle_ops

ABSwap:
    MOV   R4, R1
    MOV   R1, R2
    MOV   R2, R4
    B     angle_loop

BCSwap:
    MOV   R4, R2
    MOV   R2, R3
    MOV   R3, R4
    B     angle_loop

angle_ops:
    MOV   R9, R1        @ Copies a in R9
    MUL   R1, R9, R9    @ R1 = a²
    MOV   R9, R2        @ Copies b in R9
    MUL   R2, R9, R9    @ R2 = b²
    MOV   R9, R3        @ Copies c in R9
    MUL   R3, R9, R9    @ R3 = c²

    ADD   R1, R1, R2    @ R1 = a² + b²
    CMP   R1, R3
    BEQ   rectangle_triangle
    BGT   acute_triangle
    B     obtuse_triangle
    
rectangle_triangle:
    LDR   R0, =output
    MOV   R1, #1

    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

acute_triangle:
    LDR   R0, =output
    MOV   R1, #2

    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

obtuse_triangle:
    LDR   R0, =output
    MOV   R1, #3

    PUSH  {LR}
    BL    printf
    POP   {LR}

    BX    LR

@ AUXILIARY FUNCTIONS:
@  - division: repeated subtraction
@  - sqrt: successive subtraction of odd numbers

@ Division function
division:
    @ Clear variables
    LDR   R0, =d_count
    MOV   R1, #0
    STR   R1, [R0]

    @ Load parameters into the acumulator
    LDR   R0, =d_a
    LDR   R1, [R0]
    LDR   R0, =d_b
    LDR   R2, [R0]
    MOV   R3, #0    @ d_count

div_loop:
    CMP   R1, R2
    BGE   div_ops
    LDR   R0, =d_count
    STR   R3, [R0]
    BX    LR

div_ops:
    SUB   R1, R1, R2    @ R1 = a - b
    ADD   R3, #1        @ R3 += 1
    B     div_loop

@ Square root function
sqrt:
    @ Clear variables
    LDR   R0, =sqrt_count
    MOV   R1, #0
    STR   R1, [R0]

    @ Load parameters into the acumulator
    LDR   R0, =sqrt_n
    LDR   R1, [R0]
    MOV   R2, #0    @ sqrt_count
    MOV   R3, #1    @ sqrt_odd

s_loop:
    CMP   R1, R3
    BGE   s_ops
    LDR   R0, =sqrt_count
    STR   R2, [R0]
    BX    LR

s_ops:
    SUB   R1, R1, R3
    ADD   R3, R3, #2
    ADD   R2, R2, #1
    B     s_loop

@ End script execution
end:
    MOV R0, #0      @ return 0
    POP {LR}
    BX LR
