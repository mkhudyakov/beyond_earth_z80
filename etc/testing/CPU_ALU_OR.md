## OpCode

```
ALU - 10
OR - 110
```

## Flags

| Flag | Meaning         | Set By         |
|------|-----------------|----------------|
| S    | Sign            | result[7]      |
| Z    | Zero            | result == 0    |
| H    | Half-carry      | 0              |
| P/V  | Parity/Overflow | parity(result) |
| N    | Subtract        | 0              |
| C    | Carry           | 0              |