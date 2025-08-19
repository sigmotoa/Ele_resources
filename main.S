.global main 

main:
    .org 0x00

    ldi r20, 0xFF
    out 0x17, r20

    ldi r16, 0b01010100
    ldi r17, 0b01010101

    and r16, r17
    
    in r21, 0x3F
    out 0x18, r21
    nop