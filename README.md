# Basic Verilog Modules

## Overview

This repository contains **fundamental Verilog modules** and examples for learning HDL design. It includes basic building blocks and modules commonly used in digital design.

## Modules Included

- **Logic Gates:** AND, OR, NOT, XOR implementations
- **Combinational Circuits:** Multiplexers, decoders, encoders
- **Arithmetic:** Adders, subtractors, comparators
- **Sequential Logic:** Flip-flops, latches, registers
- **Memory:** Simple RAM/ROM implementations
- **Counters:** Binary counters, shift registers

## Features

- **Educational Focus:** Clear, well-commented code
- **Synthesizable:** All modules can be synthesized to hardware
- **Parameterized:** Generic modules with configurable width/depth
- **Testbenches:** Verification code for each module
- **Self-Contained:** Each module is independent and reusable

## Getting Started

### Prerequisites
- Verilog simulator (ModelSim, Vivado, etc.)
- Basic digital logic knowledge
- FPGA board (optional)

### Simulation

```bash
vlog module_name.v testbench.v
vsim work.testbench
run -all
```

## Module Categories

### Combinational
- Multiplexer/Demultiplexer
- Decoder/Encoder
- Priority Encoder
- Barrel Shifter

### Sequential
- D Flip-Flop
- SR Latch
- Counter (binary, BCD)
- Shift Register

### Arithmetic
- Adder/Subtractor
- Comparator
- Multiplier
- Divider

## Design Patterns

- Parameter usage for generalization
- Proper clock management
- Reset signal handling
- Synthesizable coding practices

## Applications

- Digital design learning
- FPGA prototyping
- Educational projects
- RTL design reference

## References

- Verilog HDL Design books
- IEEE 1364 Verilog Standard
- FPGA design tutorials

## License

MIT License

## Author

Gagandeep-25
