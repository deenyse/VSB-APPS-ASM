bits 64
section .data

section .text
global Factorial

Factorial:
    ;rdi; array "poiter"
    ; esi number of elements
    xor eax, eax; owerflow amount
    xor ecx, ecx; array i
.loop_start:
    cmp ecx, esi
    jge .loop_end

    mov edx, dword [rdi + rsi * 4]; current arr elem
    xor edi, edi; current factorial j == 0 to begin with 0;
    mov esp, 1; sotore for result of factorial

.factorial_loop:
    inc edi; increment factorial counter
    cmp edi, edx; end of factorial inner loop?
    jg .store_result 
    
    imul dword esp, edi;result * counter
    ;error place
    jo .overflow_occurred ; check overflow 
    jmp .factorial_loop
.store_result:
    mov [rdi + rsi * 4], esp; save noowerflow result
    jmp .loop_increment;go to begining of the loop

.overflow_occurred:
    and dword [rdi + rsi * 4], 0; owerflow elem to zero
    inc eax; owerfloe elems ++
    jmp .loop_increment

.loop_increment:
    inc ecx
    jmp .loop_start

.loop_end:
    ret


global fill_pyramid_numbers

fill_pyramid_numbers:
    ; rdi - array 
    ; rsi - length

    xor rbx, rbx; loop counter i
.loop:
    cmp rbx, rsi
    jge .leave

    ; Calculate n(n+1)(2n+1)
    mov rcx, rbx; n
    inc rcx; n + 1
    mov rdx, rcx; n + 1
    inc rdx; n + 2

    mov r8, rcx; r8 = n + 1
    imul r8, 2; r8 = 2n + 2
    inc r8; r8 = 2n + 3

    imul rcx, rdx; n(n + 1)
    imul rcx, r8; n(n + 1)(2n + 3)

    ; Perform division
    mov rax, rcx; Move value to rax for division
    mov rdx, 0; Clear rdx
    mov r8, 6; Set divisor to 6
    div r8; Divide rax (n(n+1)(2n+1)) by 6, quotient in rax

    ; Store result in array
    mov [rdi + rbx * 8], rax

    inc rbx
    jmp .loop
.leave:
    ret


global multiples
multiples:
    ;rdi - array
    ;rsi - length
    ;rdx - factor
    mov rbx, rdx; factor to rbx
    xor r8, r8; issue nums count
    xor rcx, rcx; counter i
.loop:
    cmp rcx, rsi
    jge .leave
    mov rax, [rdi + rcx * 8]
    xor rdx, rdx; clear rdx for division
    div rbx; rax = rax / rbx, rdx = rax % rbx
    test rdx, rdx; 
    jnz .issue
    jmp .next
.issue:
    sub [rdi + rcx * 8], rdx
    inc r8 
.next:
    inc rcx
    jmp .loop
.leave:
    mov rax, r8; Move issue numbers count to rax
    ret





global change_array_by_avg

change_array_by_avg:
    ;rdi - array
    ;rsi - length

    xor rcx, rcx   ; array counter
    xor rax, rax   ; average sum

enter_average:
    cmp rcx, rsi
    jge leave_average
    add rax, [rdi + rcx * 8]
    inc rcx
    jmp enter_average

leave_average:
    
    xor rdx,rdx
    div rcx        ; rax = rax / rcx, rdx = rax % rcx 
    xor rcx, rcx
enter_arraychanger:
cmp rcx, rsi
jge exit

mov r9, 1
mov r10, -1

mov r11, qword [rdi + rcx * 8]

cmp r11, rax
cmovl r11, r10                    
cmovg r11, r9                     

test r11, qword [rdi + rcx * 8]
jne next

cmp rdx , 0
cmovg r11, r10

next:
mov qword [rdi + rcx * 8], r11    

inc rcx
jmp enter_arraychanger

exit:
    ret

