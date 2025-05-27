## OpCode

```
ALU - 10
XOR - 101
```

## Flags

| Flag | Meaning         | Set By                           |
|------|-----------------|----------------------------------|
| S    | Sign            | result[7]                        |
| Z    | Zero            | result == 0                      |
| H    | Half-carry      | 0 (always cleared)               |
| P/V  | Parity/Overflow | 1 if even number of 1s in result |
| N    | Subtract        | 0 (cleared)                      |
| C    | Carry           | 0 (cleared)                      |