import serial

# Open UART at 9600 baud, 8N1
ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)

# Byte to send
tx_byte = 0xFF

# Send one byte
ser.write(bytes([tx_byte]))

# Read two bytes in response: [sum, flags]
rx_bytes = ser.read(2)

# Close UART
ser.close()

# Display result
if len(rx_bytes) == 2:
    sum_byte = rx_bytes[0]
    flags = rx_bytes[1]

    print(f"Sent     : 0x{tx_byte:02X}")
    print(f"Sum      : 0x{sum_byte:02X}")
    print(f"Flags    : 0x{flags:02X}")

    # Decode individual flags
    print("Flag breakdown:")
    print(f"  Sign     (S): {(flags >> 7) & 1}")
    print(f"  Zero     (Z): {(flags >> 6) & 1}")
    print(f"  Half-Carry(H): {(flags >> 4) & 1}")
    print(f"  Parity/OV(PV): {(flags >> 2) & 1}")
    print(f"  Subtract (N): {(flags >> 1) & 1}")
    print(f"  Carry    (C): {(flags >> 0) & 1}")
else:
    print("Incomplete response received")
