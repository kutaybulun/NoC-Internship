# NoC-Internship
# NoC Architecture Analysis and Implementation

The primary focus of the project is to analyze, implement, and simulate a Network-on-Chip (NoC) architecture for modern System-on-Chip (SoC) and FPGA designs.
See: https://github.com/aignacio/ravenoc

## Project Overview

The goal of this project was to determine the most suitable NoC architecture for complex digital systems. This involved:

- Learning about NoC architectures and their advantages over traditional bus systems.
- Analyzing various open-source NoC repositories.
- Implementing and modifying the selected NoC design using Verilog and SystemVerilog.
- Simulating the design using industry-standard tools.
- Synthesizing the design on the ZCU106 FPGA board.

## Tools and Technologies

- **HDL:** Verilog, SystemVerilog
- **Simulation:** Verilator, GTKWave, Vivado
- **Synthesis:** Vivado
- **Operating System:** Linux (with Docker for regression testing) and Windows
- **Version Control:** GitHub

## Repository Structure

- `RaveNoC_local_pe_test_verilog_wrapper_srcs/`: Source files for the 2x2 RaveNoC with AXI local PEs.
- `RaveNoC_srcs/`: Soruce files for original configurable RaveNoC.
