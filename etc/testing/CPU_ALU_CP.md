## OpCode

```
ALU - 10
CP - 111
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

## Scenarios

| #   | A         | X         | Result    | Flags Set            | Notes                        |
|-----|-----------|-----------|-----------|----------------------|------------------------------|
| 1   | 01000010  | 01000010  | 01000010  | Z=1, N=1             | A == X                       |
| 2   | 00010000  | 00100000  | 00010000  | S=1, N=1, C=1        | A < X                        |
| 3   | 01111111  | 11111111  | 01111111  | S=1, P/V=1, N=1, C=1 | Overflow (127 − −1)          |
| 4   | 11111111  | 00000001  | 11111111  | S=1, N=1             | A > X                        |
| 5   | 00000000  | 00000001  | 00000000  | S=1, H=1, N=1, C=1   | Underflow                    |
| 6   | 10000000  | 01111111  | 10000000  | H=1, P/V=1, N=1      | Signed overflow (−128 − 127) |
