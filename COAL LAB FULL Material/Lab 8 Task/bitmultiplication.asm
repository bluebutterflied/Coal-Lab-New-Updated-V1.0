[org 0x0100]

jmp start

multiplicand:   dd 0x30F73   
multiplier:     db 0xc4    
result:         dw 0       

start:

mov  cl, 8
mov  dl, [multiplier]


checkbit: 
    shr  dl, 1
    jnc  skip

        mov  al, [multiplicand]      ; extended addition 
        add  byte [result], al
        mov  al, [multiplicand + 1]
        adc  byte [result + 1], al
 	mov  al, [multiplicand + 2]
        adc  byte [result + 2], al
 	mov  al, [multiplicand + 3]
        adc  byte [result + 3], al 

    skip:
    shl  byte[multiplicand], 1      ; extended shift
    rcl  byte[multiplicand + 1], 1
    rcl byte[multiplicand +2] ,1
    rcl byte[multiplicand +3] ,1
   

    
    
    dec  cl
    jnz  checkbit




; exit syscall 
mov  ax, 0x4c00
int  0x21

