## OpCode

```
ALU - 10
ADD - 010
```

## Flags

| Flag | Meaning         | Set By                        |
|------|-----------------|-------------------------------|
| S    | Sign            | result[7]                     |
| Z    | Zero            | result == 0                   |
| H    | Half-carry      | 1 if borrow from bit 4        |
| P/V  | Parity/Overflow | 1 if signed overflow occurred |
| N    | Subtract        | 1                             |
| C    | Carry           | 1 if borrow occurred          |