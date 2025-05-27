# Simple Computer Simulator – Memory and Arithmetic Unit Implementation

This project implements two essential components of a simple computer architecture: the **Memory Module** and the **Arithmetic Unit (AU)**. Both are designed in Hardware Description Language (HDL) and tested using simulation tools to showcase the core functionality of a basic digital system.

## 1. Memory Module

### Description

The Memory Module simulates a 32-word memory unit, each word composed of 36 bits arranged as three 12-bit segments. It supports synchronous read/write operations with controlled data loading through a write-enable signal.

### Specifications

- **Memory Size:** 32 locations
- **Word Size:** 36 bits (3 × 12-bit words)
- **Address Width:** 5 bits
- **Data Inputs:** `in0`, `in1`, `in2` (each 12-bit)
- **Write Enable:** 1-bit signal (`w`)
- **Outputs:** `out0`, `out1`, `out2` (each 12-bit)

### Core Chip

- `memory.hdl`: Implements the 3-channel memory unit with controlled synchronous writes.

### Supporting Chips

- `RAM32.hdl`: 32×12-bit RAM unit built from registers and multiplexers.
- `Reg12.hdl`: 12-bit register used for storage.
- Various multiplexers (`Mux2.hdl`, `Mux4Way12.hdl`, `Mux8Way.hdl`, `Mux8Way12.hdl`) for data routing and selection.

### Testing

Test scripts and expected outputs:

- `memory.tst` — test script
- `memory.cmp` — expected output
- `memory.out` — actual output from simulation

Tests validate proper memory operation, including data storage and retrieval.


## 2. Arithmetic Unit (AU)

### Description

The Arithmetic Unit performs arithmetic and logical operations on 36-bit inputs, divided into three 12-bit segments. It interprets a 3-bit instruction code to execute operations such as addition, subtraction, negation, conditional increments, and data routing.

### Specifications

- **Inputs:**  
  - `CIin0`, `CIin1`, `CIin2` (12-bit each)  
  - `Ain0`, `Ain1`, `Ain2` (12-bit each)  
  - `SLin0`, `SLin1`, `SLin2` (12-bit each)  
  - `inst` (3-bit instruction code)

- **Outputs:**  
  - `CIout0`, `CIout1`, `CIout2` (12-bit each)  
  - `Aout0`, `Aout1`, `Aout2` (12-bit each)  
  - `SLout0`, `SLout1`, `SLout2` (12-bit each)

### Instruction Set

| Instruction (`inst`) | Operation Description                         |
|---------------------|-----------------------------------------------|
| `000`               | `CIout ← SLin`                                |
| `001`               | `CIout ← CIin + SLin`                         |
| `010`               | `Aout ← -SLin` (two’s complement)             |
| `011`               | `SLout ← Ain`                                 |
| `100`               | `Aout ← Ain - SLin`                           |
| `101`               | `Aout ← Ain - SLin` (duplicate for testing)   |
| `110`               | If `Ain < 0`, then `CIout ← CIin + 1`         |
| `111`               | No operation (outputs zeroed)                  |

### Core Chip

- `AU.hdl`: Main arithmetic unit processing 36-bit values according to the instruction.

### Supporting Chips

- `Addition36.hdl`: 36-bit adder implemented via chained 12-bit full adders.
- `Substraction36.hdl`: 36-bit subtractor using two’s complement addition.
- `Negative36.hdl`: Two’s complement negation for 36-bit inputs.
- `ConditionalAddition36.hdl`: Adds 1 to input if control condition is met.
- `Validate12.hdl`, `Or12.hdl`, `Mux2.hdl`: Auxiliary logic components.

### Testing

Test files:

- `AU.tst` — test script
- `AU.cmp` — expected output
- `AU.out` — output from simulation


## Built-In Components Utilized

Both modules are constructed using the following built-in logic chips provided by the simulation environment:

- `Bit`
- `And`
- `Or`
- `Xor`
- `Not`
- `HalfAdder`
- `FullAdder`
- `DMux8Way`

These components enable the construction of arithmetic and logic circuits.


## Project Structure
    memory-adu-hdl/
    ├── au/
    │ ├── AU.hdl
    │ ├── Addition36.hdl
    │ ├── ConditionalAddition36.hdl
    │ ├── Mux2.hdl
    │ ├── Negative36.hdl
    │ ├── Or12.hdl
    │ ├── Substraction36.hdl
    │ ├── Validate12.hdl
    │ ├── AU.tst
    │ ├── AU.cmp
    │ ├── AU.out
    │ └── README.md
    └── memory/
      ├── memory.hdl
      ├── RAM32.hdl
      ├── Reg12.hdl
      ├── Mux2.hdl
      ├── Mux4Way12.hdl
      ├── Mux8Way.hdl
      ├── Mux8Way12.hdl
      ├── memory.tst
      ├── memory.cmp
      ├── memory.out
      └── README.md


## Tools and Software

- **NAND2Tetris IDE**: For compiling, simulating, and testing HDL circuits.  
  - [Web IDE](https://nand2tetris.github.io/web-ide/chip/)  
  - [Downloadable Package](https://drive.google.com/file/d/1IkIR8Pwq3PY49QgXpUJOkUUVht-TKIET/view)

- **Logisim**: Circuit visualization, simulation, and Boolean logic verification.  
  - [Logisim Guide](https://cburch.com/logisim/docs/2.6.0/en/guide/analyze/index.html)


## How to Run Tests

1. Open the Hardware Simulator from the Nand2Tetris suite.
2. Load the desired chip file (`memory.hdl` or `AU.hdl`).
3. Open the corresponding test script (`memory.tst` or `AU.tst`).
4. Run the test script.
5. Verify that the output (`memory.out` or `AU.out`) matches the expected output file (`memory.cmp` or `AU.cmp`).


## Requirements

- Basic knowledge of logic gates and digital circuit design.
- Familiarity with HDL syntax and simulation.
- NAND2Tetris Hardware Simulator or compatible HDL simulation tools.


## Summary

This project demonstrates fundamental principles of digital systems design by implementing a memory module and a versatile arithmetic unit. It provides a modular and scalable approach to building basic computer architecture components, including data storage, arithmetic, conditional logic, and data routing at the hardware level.

