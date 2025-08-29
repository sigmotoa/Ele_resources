; =====================================================================
; tn45def.inc – Definiciones básicas para ATtiny45 by sigmotoa
; Simplificado para ensamblador AVR en SimulIDE / avr-gcc
; Basado en el datasheet del ATtiny45
; =====================================================================
; -------------------------------
; PUERTOS
; -------------------------------
DDRB   = 0x17
PORTB  = 0x18
PINB   = 0x16

; Bits del Puerto B
PB0    = 0
PB1    = 1
PB2    = 2
PB3    = 3
PB4    = 4
PB5    = 5

; -------------------------------
; SREG
; -------------------------------
SREG   = 0x3F
C      = 0; Carry
Z      = 1; Zero
N      = 2; Negative
V      = 3; Overflow
S      = 4; Sign
H      = 5; Half Carry
T      = 6; Transfer bit
I      = 7; Interrupt enable
 