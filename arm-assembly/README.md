# ARM Assembly
## Laboratory No. 5a  
Source file name: Lab5a.s  

Using ARM Assembly language, read three coefficients a, b, c, read the value of X, and evaluate the polynomial a * X ^ 2 + b * X + c, displaying the result on screen.

## Laboratory No. 5b
Source file name: Lab5b.s

Write a program in ARM Assembly language that solves the following situation:

An airline departing from Germany flies passengers all over the world. Its ticket purchasing system provides data on the number of passengers traveling to Belgium, England, Norway, Ireland, and France. The goal is to find the maximum number of passengers per airplane so that all airplanes have the same capacity.
The program should calculate:
• How many passengers there will be per airplane.
• How many airplanes will fly to each country.
• How many airplanes will fly in total.
### Input
Input should be taken from standard input. The input consists of the number of passengers traveling to Belgium, England, Norway, Ireland, and France respectively. The first line indicates how many cases need to be resolved.

### Output
Output should be sent to standard output.
The output consists of the number of passengers per airplane, the number of airplanes flying to each country (Belgium, England, Norway, Ireland, and France respectively), and the total number of airplanes that will fly.

## Laboratory No. 5c
Source file name: Lab5c.s

Write a program in ARM Assembly language that calculates the Egyptian fraction of a positive rational number. An Egyptian fraction is the sum of distinct unit fractions, i.e., fractions with numerator 1 and positive integer denominators. It can be proven that any positive rational number can be written as an Egyptian fraction. An algorithm that produces the representation of the rational number r = a/b between 0 and 1 as an Egyptian fraction is James Joseph Sylvester's greedy algorithm, which consists of:
1. Finding the closest unit fraction less than r. The denominator can be found by dividing b by a, ignoring the remainder, and adding 1.
2. If there is no remainder, r is a unit fraction, so no further calculation is needed.
3. Subtract the unit fraction from r and repeat step 1 using the difference as the new r.
### Input
Input should be taken from standard input. The input consists of pairs of lines, where each pair contains the numerator and denominator of the fraction respectively. The first line indicates how many fractions need to be resolved.
### Output
Output should be sent to standard output. The output is a sequence of lines with the denominators of the calculated Egyptian fractions and a line containing a 0.