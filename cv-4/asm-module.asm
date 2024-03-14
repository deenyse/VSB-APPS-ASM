bits 64
section .data

section .text
global Factorial

Factorial:
    ; Set up stack frame
    push rbp
    mov rbp, rsp
    push rbx
    push rcx
    push rdx

    mov rbx, rdi; array "poiter"
    mov ecx, esi; number of elements

    xor eax, eax; owerflow amount
    xor esi, esi; array i
loop_start:
    cmp esi, ecx
    jge loop_end

    mov edx, dword [rbx + rsi * 4]; current arr elem
    mov edi, 1; current factorial j
    mov ecx, 1; sotore for result of factorial

factorial_loop:
    imul ecx, edi;result * counter
    jo overflow_occurred ; check overflow 
    inc edi; increment factorial counter
    cmp edi, edx; end of factorial inner loop?
    jle factorial_loop 
    jmp store_result
store_result:
    mov [rbx + rsi * 4], ecx; save noowerflow result
    jmp loop_increment;go to begining of the loop

overflow_occurred:
    mov dword [rbx + rsi * 4], 0; owerflow elem to zero
    inc eax; owerfloe elems ++
    jmp loop_increment

loop_increment:
    inc esi
    jmp loop_start

loop_end:
    pop rdx
    pop rcx
    pop rbx
    pop rbp
    ret
