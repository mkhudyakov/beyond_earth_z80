## CPU ALU Operations

| Category                          | Operation | Opcode | Description                                                        | Done? | Verilog? |
|-----------------------------------|-----------|--------|--------------------------------------------------------------------|-------|----------|
| Core ALU Operations               | ADD       | 000    | A ← A + r                                                          | ✅     | ✅        |
|                                   | ADC       |        | A ← A + r + C                                                      | ✅     |          |
|                                   | SUB       | 010    | A ← A − r                                                          | ✅     ||
|                                   | SBC       |        | A ← A − r − C                                                      | ✅     ||
|                                   | AND       | 100    | A ← A & r                                                          | ✅     ||
|                                   | OR        | 110    | A ← A &#124; r                                                     | ✅     ||
|                                   | XOR       | 101    | A ← A ⊕ r                                                          | ✅     ||
|                                   | CP        | 111    | Compare A − r (affects flags, result discarded)                    | ✅     ||

Z80-purrrrfectly ready