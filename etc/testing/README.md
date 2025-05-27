## CPU ALU Operations

```
# Core ALU Operations

ADD - A ← A + r
ADC - A ← A + r + C
SUB - A ← A − r
SBC - A ← A − r − C
AND - A ← A & r
OR - A ← A | r
XOR - A ← A ⊕ r
CP - Compare A − r (affects flags, result discarded)
INC - Increment r (8/16-bit); affects flags
DEC - Decrement r (8/16-bit); affects flags

# Z80 Extended ALU/Bitwise/Flag Ops

RLC, RRC - Rotate Left/Right Circular (through bit 7 or 0)
RL, RR - Rotate Left/Right through Carry
SLA, SRA - Shift Left/Right Arithmetic
SLL - (undocumented) Shift Left Logical (undocumented on original Zilog)
SRL - Shift Right Logical
BIT - Bit test, affects Z and PV
RES, SET - Reset or Set individual bits
CPL - A ← ¬A (bitwise complement)
SCF - Set Carry Flag
CCF - Complement Carry Flag
DAA - Decimal Adjust A
NEG - A ← −A (two's complement)
```
