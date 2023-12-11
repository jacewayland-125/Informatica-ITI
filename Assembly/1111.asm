; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:       

    mov ax, data
    mov ds, ax
    mov es, ax  
                
  ; add your code here
                
    mov ax, 0000h
    mov bx, 0000h
    mov dx, 0000h
    mov ax, num1
    mov bx, num2
    
    
 inizio ciclo:
   cmp bx, 0
   je fine-ciclo
   add dx, ax
   dec bx
   jmp inizio-ciclo
 fine-ciclo 
 mov ris, dx
 
 lea dx, pkey
 mov ah, 9
 int 21h     
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
