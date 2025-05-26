## Build & Flash

```
make clean
make
make flush
```

## Test

```
python3 tty_send.py
 
Opcode   : 0x80
Operand  : 0xFF
Sum      : 0xAA
Flags    : 0x84

Flag breakdown:
  Sign     (S): 1
  Zero     (Z): 0
  Half-Carry(H): 0
  Parity/OV(PV): 1
  Subtract (N): 0
  Carry    (C): 0
```
