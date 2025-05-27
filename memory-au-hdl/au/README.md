# 36-bit Arithmetic Logic Units (ALUs)

## Description
This project consists of a set of digital logic chips written in HDL to perform arithmetic operations on 36-bit values. Each 36-bit value is composed of three 12-bit segments (LSB to MSB: `in0`, `in1`, `in2`). The system supports operations such as addition, subtraction, negation, conditional logic, and controlled data routing.

The central unit is the AU (Arithmetic Unit), which interprets 3-bit instruction codes to perform different arithmetic actions across three 36-bit input buses. Supporting modules provide the necessary logic and control for arithmetic manipulation, validation, and conditional selection.

## Chip List

### Core Arithmetic Chips
- **AU.hdl**
    A 36-bit arithmetic unit controlled by a 3-bit instruction (`inst`).

    **Inputs**: `CIin[36]`, `Ain[36]`, `SLin[36]`

    **Outputs**: `CIout[36]`, `Aout[36]`, `SLout[36]`

    **Instruction Set**:
    - `000`: Pass `SLin` to `CIout`
    - `001`: Add `CIin` and `SLin` → `CIout`
    - `010`: Two’s complement of `SLin` → `Aout`
    - `011`: Pass `Ain` to `SLout`
    - `100/101`: Subtract SLin from `Ain` → `Aout`
    - `110`: If `Ain` is negative, increment `CIin` by 1 → `CIout`

### Supporting Chips
- **Addition36.hdl**
    Performs 36-bit addition using three 12-bit full-adder chains with carry propagation.

- **Substraction36.hdl**
    Subtracts two 36-bit values by computing the two’s complement of the subtrahend and adding it to the minuend.

- **Negative36.hdl**
    Computes the two’s complement of a 36-bit input.

- **ConditionalAddition36.hdl**
    Conditionally adds 1 to a 36-bit input value if a control input is negative (MSB = 1).

- **Validate12.hdl**
    A 12-bit conditional pass-through module. Performs bitwise AND between input and a single-bit enable signal.

- **Or12.hdl**
    A 12-bit bitwise OR gate. Performs `out[i] = a[i] OR b[i]` for all bits.

- **Mux2.hdl**
    A basic 2-way 1-bit multiplexer used for signal selection.

## Test Files
Each component is intended to be tested individually with custom test scripts and expected output files using the Nand2Tetris Hardware Simulator.

-   **AU.tst**:
    Test script for the AU component

-   **AU.cmp**:
    Expected output

-   **AU.out**:
    Output log generated during simulation

These files are part of the test workflow using the [Nand2Tetris Hardware Simulator](https://www.nand2tetris.org/software) or equivalent.

## File Structure
    au/
    ├── Addition36.hdl
    ├── AU.hdl
    ├── ConditionalAddition36.hdl
    ├── Mux2.hdl
    ├── Negative36.hdl
    ├── Or12.hdl
    ├── Substraction36.hdl
    ├── Validate12.hdl
    ├── AU.tst
    ├── AU.cmp
    ├── AU.out
    └── README.md

## How to Run Tests
1. Open the `Hardware Simulator` from the Nand2Tetris suite.
2. Load `AU.hdl`.
3. Open the `AU.tst` script.
4. Run the script.
5. Confirm that `AU.out` matches `AU.cmp`.

## Notes on Bit Structure
- 36-bit values are built using three 12-bit segments:
    - `in0` → LSB (least significant 12 bits)
    - `in1` → Middle 12 bits
    - `in2` → MSB (most significant 12 bits)
- Arithmetic operations handle segment overflow via carry chaining.
