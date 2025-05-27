// -----------------------------------------------------------------------------
// Author: Santiago Botero
// Date: 24/05/2025
// Description: Test script for the memory chip with 'w' as input.
//              This version ensures correct control of writing using 'w'.
// -----------------------------------------------------------------------------

// Load the memory chip definition
load memory.hdl,

// Define the output file where simulation results will be saved
output-file memory.out,

// Define the comparison file to validate simulation outputs
compare-to memory.cmp;

// Define signals to be monitored in the output:
output-list a%B1.5.1
            in0%B1.12.1 in1%B1.12.1 in2%B1.12.1
            w%B1.1.1
            out0%B1.12.1 out1%B1.12.1 out2%B1.12.1;

// -----------------------------
// Test 1: Write to an empty address (address 00001)
// -----------------------------
set a %B00001,
set in0 %B000000000001,
set in1 %B000000000010,
set in2 %B000000000011,
set w 1,
tick, tock,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 2: Read the same address (00001) without writing
// -----------------------------
set a %B00001,
set in0 %B111111111111,
set in1 %B111111111111,
set in2 %B111111111111,
set w 0,
tick, tock,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 3: Write to a different empty address (00010)
// -----------------------------
set a %B00010,
set in0 %B000000000100,
set in1 %B000000000101,
set in2 %B000000000110,
set w 1,
tick, tock,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 4: Read address 00010
// -----------------------------
set a %B00010,
set in0 %B000000000000,
set in1 %B000000000000,
set in2 %B000000000000,
set w 0,
tick, tock,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 5: Read address 00001
// -----------------------------
set a %B00001,
set in0 %B000000000100,
set in1 %B000000000101,
set in2 %B000000000110,
set w 0,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 6: Overwrite address 00001 with new data
// -----------------------------
set a %B00001,
set in0 %B000000001111,
set in1 %B000000010000,
set in2 %B000000010001,
set w 1,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 7: Read after overwrite (00001)
// -----------------------------
set a %B00001,
set in0 %B000000000000,
set in1 %B000000000000,
set in2 %B000000000000,
set w 0,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 8: Write to max address (11111)
// -----------------------------
set a %B11111,
set in0 %B000000111111,
set in1 %B000001000000,
set in2 %B000001000001,
set w 1,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 9: Read max address (11111)
// -----------------------------
set a %B11111,
set in0 %B000000000000,
set in1 %B000000000000,
set in2 %B000000000000,
set w 0,
tick, tock,
tick, tock,
output,

// -----------------------------
// Test 10: Read from unwritten address (00100)
// -----------------------------
set a %B00100,
set in0 %B000000000000,
set in1 %B000000000000,
set in2 %B000000000000,
set w 0,
tick, tock,
tick, tock,
output,
