# Triangle Classification in Assembly (ARM & MARIE)

This project implements a triangle classification and geometry computation program in two low-level assembly languages (ARM and MARIE). The objective is to demonstrate how basic geometric calculations can be performed using only integer arithmetic and fixed-point representations in resource-constrained environments.

## Overview

Given the coordinates of three points on the Cartesian plane, the system determines whether those points form a valid triangle. If they do, the program computes the triangle’s:

- Area
- Perimeter
- Type based on side lengths:
  - 1 = Equilateral
  - 2 = Isosceles
  - 3 = Scalene
- Type based on internal angles:
  - 1 = Right
  - 2 = Acute
  - 3 = Obtuse

Each input is a set of three (x, y) coordinates, read multiple times based on the user-defined number of triangle evaluations.

## Problem Statement

### MARIE Version

1. The program reads an integer N indicating how many sets of coordinates will be analyzed.
2. For each set, it reads three pairs of coordinates (x, y).
3. Coordinates are represented in fixed-point decimal with **2 decimal digits**. For example:
   - `132` represents `1.32`
   - `3` represents `0.03`
4. Valid range for coordinates is **[-128, 127]**.
5. MARIE's instruction set constraints require handling fixed-point and geometric calculations using basic integer operations only.

### ARM Version

1. The program reads an integer N representing how many sets of three points will be analyzed.
2. For each set, it reads three pairs of coordinates (x, y).
3. Coordinates are represented in fixed-point decimal with **4 decimal digits**, using integers. For example:
   - `12345` represents `1.2345`
   - `3` represents `0.0003`
4. Coordinate values are in the range **[-12800, 12700]**.
5. All calculations are performed using integer arithmetic.

## Development Tools and Environment

### Editors and Tools Used

- **Visual Studio Code**: Used for editing ARM and Python code with syntax highlighting and extensions for assembly development.
- **MARIE Simulators**:
  - [marie.js](https://marie.js.org/): Online MARIE machine simulator for lightweight testing and rapid prototyping.
  - [MarieSim v1.3.01](http://computerscience.jbpub.com/ecoa/2e/student_resources.cfm): Offline Java-based MARIE simulator used for more comprehensive testing.
- **Raspberry Pi OS (Virtual Environment)**: The ARM code was tested within a virtualized Raspberry Pi environment running Raspberry Pi OS, utilizing the QEMU emulator. QEMU simulates the ARM architecture, providing an environment that closely mimics actual Raspberry Pi hardware. This approach enabled accurate execution of ARM assembly code without the need for physical hardware. The ARM source code was assembled and linked using GCC and standard C libraries.

## Usage

### Running MARIE Code

Use one of the MARIE simulators:
- marie.js (browser-based):
    - Open https://marie.js.org/
    - Paste the contents of .mas and run.

- MarieSim (offline Java-based tool):
    - Download and extract [MarieSim v1.3.01](http://hwmath.net/dev/MarieSim/).
    - Load triangle-classification.mas, assemble, and simulate the program.
    - Refer to this [video](https://www.youtube.com/watch?v=PCXpweC2_qM&ab_channel=KmmKatey%28Kmmkatey%29) for usage guidance.

### Running ARM Code

To assemble and execute the ARM program in a Raspberry Pi OS environment:

```bash
$ s -g -mfpu=vfpv2 -o triangle-classification.o triangle-classification.s
$ gcc -o triangle-classification triangle-classification.o
$ ./triangle-classification
```

### Technical Considerations
- All arithmetic is performed using integer operations.

- Real numbers are represented using fixed-point arithmetic to accommodate the limitations of both ARM and MARIE.

- No floating-point operations are used at any point in the project.

### Limitations
- The MARIE implementation is constrained by the simplicity of the instruction set and limited memory model.

- Precision is bounded by the number of decimal places used in the fixed-point representation (2 for MARIE, 4 for ARM).

- User input/output in assembly is handled based on the capabilities of each simulation tool.