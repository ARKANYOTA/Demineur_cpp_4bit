
; mov eax, 4
; mov ebx, 1
; mov ecx, loseMsg
; mov edx, lenloseMsg
; int 80h

; ;Read and store the user input
; mov eax, 3
; mov ebx, 2
; mov ecx, num
; mov edx, 5          ;5 bytes (numeric, 1 for sign) of that information
; int 80h

; ;Output the message 'The entered number is: '
; mov eax, 4
; mov ebx, 1
; mov ecx, dispMsg
; mov edx, lenDispMsg
; int 80h

; ;Output the number entered
; mov eax, 4
; mov ebx, 1
; mov ecx, num
; mov edx, 5
; int 80h


section .data                           ;Data segment
    LookUpDig db "0123456789"             ; Translation Table

   loseMsg db 'Perdu Dommage'
   lenloseMsg equ $-loseMsg             ;The length of the message
   posxMsg db 'Position x: '
   lenposxMsg equ $-posxMsg             ;The length of the message
   posyMsg db 'Position y: '
   lenposyMsg equ $-posyMsg             ;The length of the message
   bombs DQ 100
   Flags DQ 0
   disco DQ 0
   vars  DQ 0
   nb_bombs DD 16

section .bss           ;Uninitialized data
    PID:  resb 8
    var1: resb 4

section .text          ;Code Segment
   global _start


_start:                ;User prompt
    ; Generate n random bombs in the map;
    ; n is the number of bombs
    ;    mov rcx, 10
    ; start_generate_bombs:
    ;    mov rax, bombs
    ;    dec rcx
    ;    cmp rcx, 0
    ;    jg start_generate_bombs
    ; mov rax, bombs

    ; startloop:
    ; 
    ; eax ebx ecx edx
    ; cmp rcx, 0
    ; jne startloop
    ; 
    ; mov esi, 52; esi = 52 
    ; mov [var1], esi

    ; call printNumber


    mov     eax, 0x1              ; Set system_call
    xor     ebx, 10               ; Exit_code 0
    int     0x80                  ; Call kernel




printNumber:
    mov esi, [var1]
    add esi, 48
    mov [var1], esi

    mov eax, 4
    mov ebx, 1
    mov ecx, var1
    mov edx, 10

    int 0x80
    ret



; GET CURRENT PID AND PRINT IT
;             mov     rax, 0x14             ; GET_PID call
;             int     0x80                  ; Call
;             mov     rbx, 0xA              ; Set divider to 10
;             mov     ebp, PID+6   ;  PID+6            ; Save the address of PID+6 to EBP
;             jnz     LoopMe                ; Run the loop to convert int to string
; 
;     LoopMe:
;             div     rbx                   ; Divide the PID by 10
;             mov     cl, [LookUpDig+edx]   ; Copy ASCII value to CL
;             mov     [ebp], cl             ; Copy CL to PID buffer
;             dec     ebp                   ; Move to next byte in the buffer
;             xor     edx, edx              ; Clear the remainder, else weird results :)
;             inc     rax                   ; Increase EAX tricking JNZ
;             dec     rax                   ; Decrease to get back to original value
;             jnz     LoopMe                ; Loop until EAX is zero (all integers converted)
;             jz      PrintOut              ; When done call the print out function
; 
;     PrintOut:
;             mov     rbx, 0x1              ; FD stdout
;             mov     rax, 0x4              ; sys_write call
;             int     0x80                  ; Call kernel
; 
;             mov     [PID+7], byte 0xA     ; Push a newline to PID string
; 
;             mov     edx, 0x8              ; Max length of 8 bytes
;             mov     rcx, PID              ; Push PID value
;             mov     rbx, 0x1              ; FD stdout
;             mov     rax, 0x4              ; sys_write call
;             int     0x80                  ; Call kernel
