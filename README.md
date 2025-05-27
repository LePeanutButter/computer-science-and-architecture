# Computer Science And Architecture

This repository contains various scripts, assembly code, hardware description language projects, and virtual machine installation logs. The materials in this repository aim to help you learn different aspects of programming, system administration, virtualization, hardware design, and low-level system concepts. Each folder is focused on a specific area, such as assembly programming, scripting, hardware design, and virtualization setups.

## Directory Structure

- **`arm-assembly/`**: Contains ARM assembly language programs and examples for understanding low-level programming and ARM architecture.
  
- **`cross-base-scripts/`**: Includes C programs that perform base conversions between different numerical systems. These scripts handle tasks like adding, multiplying, and converting numbers between different bases (binary, decimal, hexadecimal, etc.).

- **`marie-assembly/`**: Houses assembly programs written for the MARIE architecture, useful for learning about assembly language concepts and the MARIE computer architecture.

- **`powershell-scripts/`**: Features various PowerShell scripts for automating tasks in Windows environments, such as system diagnostics and file management.

- **`solaris-scripts/`**: Contains shell scripts for Solaris, focused on system administration and file management specific to the Solaris OS.

- **`vm-installation-logs/`**: Provides logs of the installation processes for virtual machines, including Slackware Linux, Windows Server, and Solaris, using VirtualBox and VMware Workstation. These logs contain detailed instructions and configurations used to set up each virtual machine.

- **`triangle-classification-assembly/`**: Implements a triangle classification and geometry computation program in ARM and MARIE assembly languages, demonstrating fixed-point arithmetic and low-level geometric computations on resource-constrained environments.

- **`memory-au-hdl/`**: Hardware Description Language (HDL) project implementing core computer architecture components: a Memory Module and an Arithmetic Unit (AU). This project covers synchronous memory design and arithmetic/logical operations on 36-bit data words, tested using simulation tools.

## Usage and Project Descriptions

### ARM Assembly
Explore and experiment with ARM assembly programs to understand the low-level operations of ARM processors. These programs will help you get familiar with instruction sets, registers, and memory handling.

### Cross Base Scripts
The `cross-base-scripts` folder contains C programs that perform conversions between different numerical bases. These programs include:
- Base 10 addition and multiplication with large numbers
- Base conversion between different positional numeral systems and base 10
- Implementations of these conversions using efficient algorithms in C

You can compile and run these C programs to experiment with different number systems and perform calculations across different bases.

### MARIE Assembly
This folder is dedicated to the MARIE assembly language and the programs that run on the MARIE architecture. Use these programs to learn about assembly concepts like memory management, stack operations, and basic instruction sets.

### PowerShell Scripts
The `powershell-scripts` folder includes scripts for automating tasks on Windows using PowerShell.

### Solaris Scripts
The `solaris-scripts` folder includes similar shell scripts for Solaris.

### VM Installation Logs
The `vm-installation-logs` folder includes detailed logs of virtual machine installations. These logs cover the installation of:
- **Slackware Linux** on VirtualBox
- **Windows Server** on VirtualBox
- **Solaris** on VMware Workstation

These logs document every step of the process, including network configuration, disk partitioning, and troubleshooting steps.

### Triangle Classification in Assembly (ARM & MARIE)
This project demonstrates how to classify triangles and compute their geometric properties using only integer arithmetic and fixed-point numbers in ARM and MARIE assembly languages. It handles input of point coordinates and determines:

- Validity of the triangle
- Area and perimeter
- Triangle type by side lengths (Equilateral, Isosceles, Scalene)
- Triangle type by angles (Right, Acute, Obtuse)

This project is ideal for understanding fixed-point arithmetic and assembly-level geometric computations under constrained instruction sets.

### Simple Computer Simulator – Memory and Arithmetic Unit (HDL)
This HDL project implements two fundamental computer architecture components:

- **Memory Module**: A 32-location memory unit with 36-bit words, supporting synchronous read/write operations with write-enable control.

- **Arithmetic Unit (AU)**: A unit performing arithmetic and logical operations on 36-bit inputs based on a 3-bit instruction set, including addition, subtraction, negation, and conditional increments.

The project includes simulation test scripts, expected outputs, and usage instructions, showcasing the design of basic hardware building blocks for digital systems using the NAND2Tetris HDL environment.

## Authors
**Santiago Botero** - [LePeanutButter](https://github.com/LePeanutButter)