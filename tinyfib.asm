section data:
        BUFFER_SIZE equ 10
        newline db 10

section .bss
        numbuf resb BUFFER_SIZE		; A buffer to store our string of numbers in

output: resb 4

section .text
        global _start
_start:
        mov r8,0               ; counter
        mov r9,0               ; first value
        mov r10,1               ; last value
        mov r11,0               ; temporary
        mov r12,90    ; number of iterations

loop:
        cmp r8,r12
        je exit
        inc r8
        mov r11,r9
        mov r9,r10
        add r11,r10
        mov r10,r11

        mov rdi, r10
        call itoa

        mov rsi,rax
        mov rax,1
        mov rdi,1
        mov rdx,32
        syscall

        mov rsi,newline              ; newline
        mov rax,1
        mov rdi,1
        mov rdx,32
        syscall

        jmp loop

exit:
        mov    rax, 60
        mov    rdi, 0
        syscall

;; The following is lifted from https://github.com/simon-whitehead/assembly-fun/blob/master/linux-x64/5.itoa/5.iota.s
itoa:

    push rbp
    mov rbp,rsp
    sub rsp,4		; allocate 4 bytes for our local string length counter

    mov rax,rdi		; Move the passed in argument to rax
    lea rdi,[numbuf+10]	; load the end address of the buffer (past the very end)
    mov rcx,10		; divisor
    mov [rbp-4],dword 0	; rbp-4 will contain 4 bytes representing the length of the string - start at zero

.divloop:
    xor rdx,rdx		; Zero out rdx (where our remainder goes after idiv)
    idiv rcx		; divide rax (the number) by 10 (the remainder is placed in rdx)
    add rdx,0x30	; add 0x30 to the remainder so we get the correct ASCII value
    dec rdi		; move the pointer backwards in the buffer
    mov byte [rdi],dl	; move the character into the buffer
    inc dword [rbp-4]	; increase the length

    cmp rax,0		; was the result zero?
    jnz .divloop	; no it wasn't, keep looping

    mov rax,rdi		; rdi now points to the beginning of the string - move it into rax
    mov rcx,[rbp-4]	; rbp-4 contains the length - move it into rcx

    leave		; clean up our stack
    ret
