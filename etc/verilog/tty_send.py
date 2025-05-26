import serial

ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)

# Send ADD opcode (0x80) and operand (e.g. 0xFF)
ser.write(bytes([0x80, 0xFF]))

# Read 2-byte response: [sum, flags]
response = ser.read(2)
ser.close()

if len(response) == 2:
    sum_byte, flags = response
    print(f"Opcode   : 0x80")
    print(f"Operand  : 0xFF")
    print(f"Sum      : 0x{sum_byte:02X}")
    print(f"Flags    : 0x{flags:02X}")
    print("Flag breakdown:")
    print(f"  Sign     (S): {(flags >> 7) & 1}")
    print(f"  Zero     (Z): {(flags >> 6) & 1}")
    print(f"  Half-Carry(H): {(flags >> 4) & 1}")
    print(f"  Parity/OV(PV): {(flags >> 2) & 1}")
    print(f"  Subtract (N): {(flags >> 1) & 1}")
    print(f"  Carry    (C): {(flags >> 0) & 1}")
else:
    print("Invalid or no response")
