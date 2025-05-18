## Registers
Registers are small, fast storage elements used to hold data temporarily within a digital circuit. They are typically implemented using flip-flops and are used to store binary information like data, addresses, or control information. Registers are essential in digital circuits for data manipulation, synchronization, and temporary data storage during processing.

Common Operations in Registers:
Load: Storing data into the register.
Clear/Reset: Setting all bits to zero.
Shift: Moving data within the register (left or right).
Hold: Retaining the current data.

Registers are classified into - **Shift Registers** and **Buffer Registers**.
### Shift Registers:
These registers are capable of shifting data either left or right, parallel load, serial input and ouput etc. Based on the data movement and configuration, shift Regusters are again classififed as,
Serial-In, Serial-Out (SISO): Data enters and exits one bit at a time.
Serial-In, Parallel-Out (SIPO): Data enters serially and is output in parallel.
Parallel-In, Serial-Out (PISO): Data enters in parallel and is output serially.
Parallel-In, Parallel-Out (PIPO): Data enters and exits in parallel.

### Bidirectional Shift Register: 
Capable of shifting it's data to the left or right based on the mode (selection lines of the MUX).

### Buffer Registers:
Used to store n-bit data. They act as a holding area for data, ensuring smooth data transfer between devices or subsystems.
A Buffer Register is constructed using D-FlipFlops. 


## FSM
An FSM (Finite State Machine) is a mathematical model used to design sequential logic circuits. It consists of a finite number of states, transitions between those states, inputs, and outputs. The current state and input determine the next state and output.
Types of FSMs:
**Moore Machine**:
Output depends only on the current state.
Output is associated with the state itself.

**Mealy Machine**:
Output depends on both the current state and the input.
More responsive since the output can change immediately based on the input.

## FPGA design flow:
