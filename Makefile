MCU = attiny45
PROGRAMMER = arduino
PORT = /dev/tty.usbmodem21301
BAUD = 19200

main.elf: main.S
	avr-gcc -mmcu=$(MCU) -o main.elf main.S

main.hex: main.elf
	avr-objcopy -O ihex main.elf main.hex

upload: main.hex
	avrdude -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:main.hex

fuses:
	avrdude -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U lfuse:w:0x62:m -U hfuse:w:0xdf:m

clean:
	rm -f *.hex *.elf *.o

size: main.elf
	avr-size --mcu=$(MCU) --format=avr main.elf

test:
	avrdude -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -v