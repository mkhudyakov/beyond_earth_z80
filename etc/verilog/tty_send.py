import serial

# Open UART at 9600 baud, 8N1
ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)

# Byte to send
tx_byte = 0xFF

# Send one byte
ser.write(bytes([tx_byte]))

# Read one byte in response
rx_byte = ser.read(1)

# Close UART
ser.close()

# Display result
if rx_byte:
    print(f"Sent     : 0x{tx_byte:02X}")
    print(f"Received : 0x{rx_byte[0]:02X}")
else:
    print("No response received")