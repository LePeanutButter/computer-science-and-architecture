// -----------------------------------------------------------------------------
// Author: Santiago Botero
// Date: 22/05/2025
// Description: Test script for the AU (Arithmetic Unit) chip designed in HDL.
//              This script loads the AU chip, runs a series of tests with
//              different instruction values (inst), and outputs results
//              to validate expected behavior.
// -----------------------------------------------------------------------------

// Load the AU chip
load AU.hdl;

// Define the output file where the test results will be saved
output-file AU.out;

// Define the comparison file used to verify correctness
compare-to AU.cmp;

// Define which signals should appear in the output
output-list inst%B1.3.1 // 3-bit instruction
            CIin0%B1.12.1 CIin1%B1.12.1 CIin2%B1.12.1   // CIin inputs
            Ain0%B1.12.1 Ain1%B1.12.1 Ain2%B1.12.1      // Ain inputs
            SLin0%B1.12.1 SLin1%B1.12.1 SLin2%B1.12.1   // SLin inputs
            CIout0%B1.12.1 CIout1%B1.12.1 CIout2%B1.12.1    // CIout outputs
            Aout0%B1.12.1 Aout1%B1.12.1 Aout2%B1.12.1   // Aout outputs
            SLout0%B1.12.1 SLout1%B1.12.1 SLout2%B1.12.1;   // SLout outputs
            
// ------------------
// Test 1: inst == 000 (SLin -> CIout)
// This test checks if the SLin input is passed directly to the CIout output.
// ------------------
set inst 0; // %B000
set CIin0 0; set CIin1 0; set CIin2 0; // Reset previous CIin values
set Ain0 0; set Ain1 0; set Ain2 0; // Reset previous Ain values
set SLin0 1; //%B000000000001
set SLin1 2; //%B000000000010
set SLin2 4; //%B000000000100
eval;
output;

// ------------------
// Test 2: inst == 001 (CIin + SLin -> CIout)
// This test checks if the chip correctly adds CIin and SLin and outputs to CIout.
set inst 1; //%B001
set Ain0 0; set Ain1 0; set Ain2 0; // Reset previous Ain values
set CIin0 1; //%B000000000001
set CIin1 2; //%B000000000010
set CIin2 4; //%B000000000100
set SLin0 1; //%B000000000001
set SLin1 2; //%B000000000010
set SLin2 4; //%B000000000100
eval;
output;

// Test 3: inst == 010 (-SLin -> Aout)
set inst 2; //%B010
set CIin0 0; set CIin1 0; set CIin2 0; // Reset previous CIin values
set Ain0 0; set Ain1 0; set Ain2 0; // Reset previous Ain values
set SLin0 1; //%B000000000001
set SLin1 2; //%B000000000010
set SLin2 4; //%B000000000100
eval;
output;

// Test 4: inst == 011 (Ain -> SLout)
set inst 3; //%B011
set CIin0 0; set CIin1 0; set CIin2 0; // Reset previous CIin values
set SLin0 0; set SLin1 0; set SLin2 0; // Reset previous SLin values
set Ain0 1; //%B000000000001
set Ain1 2; //%B000000000010
set Ain2 4; //%B000000000100
eval;
output;

// Test 5: inst == 100 (Ain - SLin -> Aout)
set inst 4; //%B100
set CIin0 0; set CIin1 0; set CIin2 0; // Reset previous CIin values
set Ain0 2; //%B000000000010
set Ain1 4; //%B000000000100
set Ain2 8; //%B000000001000
set SLin0 1; //%B000000000001
set SLin1 2; //%B000000000010
set SLin2 4; //%B000000000100
eval;
output;

// Test 6: inst == 101 (Ain - SLin -> Aout)
set inst 5; //%B101
set CIin0 0; set CIin1 0; set CIin2 0; // Reset previous CIin values
set Ain0 2; //%B000000000010
set Ain1 4; //%B000000000100
set Ain2 8; //%B000000001000
set SLin0 1; //%B000000000001
set SLin1 2; //%B000000000010
set SLin2 4; //%B000000000100
eval;
output;

// Test 7: inst == 110 (Conditional Addition: Ain < 0)
set inst 6; //%B110
set SLin0 0; set SLin1 0; set SLin2 0; // Reset previous SLin values
set Ain0 -2; //%B111111111110
set Ain1 -3; //%B111111111101
set Ain2 -5; //%B111111111011
set CIin0 1; //%B000000000001
set CIin1 2; //%B000000000010
set CIin2 4; //%B000000000100
eval;
output;
