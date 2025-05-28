## CPU ALU Operations

| Category                          | Operation | Opcode | Description                                                        | Done? | Verilog? |
|-----------------------------------|-----------|--------|--------------------------------------------------------------------|---|----------|
| Core ALU Operations               | ADD       | 000    | A ← A + r                                                          | ✅ | ✅        |
|                                   | ADC       |        | A ← A + r + C                                                      |   |          |
|                                   | SUB       | 010    | A ← A − r                                                          | ✅ ||
|                                   | SBC       |        | A ← A − r − C                                                      |   ||
|                                   | AND       | 100    | A ← A & r                                                          | ✅ ||
|                                   | OR        | 110    | A ← A &#124; r                                                     | ✅ ||
|                                   | XOR       | 101    | A ← A ⊕ r                                                          | ✅ ||
|                                   | CP        |        | Compare A − r (affects flags, result discarded)                    | ✅ ||
|                                   | INC       |        | Increment r (8/16-bit); affects flags                              |   ||
|                                   | DEC       |        | Decrement r (8/16-bit); affects flags                              |   ||
| Z80 Extended ALU/Bitwise/Flag Ops | RLC       |        | Rotate Left Circular (through bit 7 or 0)                          |   ||
|                                   | RRC       |        | Rotate Right Circular (through bit 7 or 0)                         |   ||
|                                   | RL        |        | Rotate Left through Carry                                          |   ||
|                                   | RR        |        | Rotate Right through Carry                                         |   ||
|                                   | SLA       |        | Shift Left Arithmetic                                              |   ||
|                                   | SRA       |        | Shift Right Arithmetic                                             |   ||
|                                   | SLL       |        | (undocumented) Shift Left Logical (undocumented on original Zilog) |   ||
|                                   | SRL       |        | Shift Right Logical                                                |   ||
|                                   | BIT       |        | Bit test, affects Z and PV                                         |   ||
|                                   | RES       |        | Reset individual bits                                              |   ||
|                                   | SET       |        | Set individual bits                                                |   ||
|                                   | CPL       |        | A ← ¬A (bitwise complement)                                        |   ||
|                                   | SCF       |        | Set Carry Flag                                                     |   ||
|                                   | CCF       |        | Complement Carry Flag                                              |   ||
|                                   | DAA       |        | Decimal Adjust A                                                   |   ||
|                                   | NEG       |        | A ← −A (two's complement)                                          |   ||
