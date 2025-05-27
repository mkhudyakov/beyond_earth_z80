## OpCode

```
ALU - 10
AND - 100
```

## Flags

| Flag | Meaning         | Set By         |
|------|-----------------|----------------|
| S    | Sign            | result[7]      |
| Z    | Zero            | result == 0    |
| H    | Half-carry      | 1              |
| P/V  | Parity/Overflow | parity(result) |
| N    | Subtract        | 0              |
| C    | Carry           | 0              |