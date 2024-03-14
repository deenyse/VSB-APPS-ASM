    bits 64

section .data
    extern count
section .text

global strCat
strCat:
    mov rax, -1 ; indext of first occurance
    xor rcx, rcx ; current index
    mov rdi, rdi ; first param (string)
    mov rsi, rsi ; second param (target symbol)
    xor r8, r8   ; symbol counter = 0

    ;make lower case looking symb
    cmp sil, 'A'
    jl .loop
    cmp sil, 'Z'
    jg .loop
    add sil, 32  
.loop:
    mov dl, [rdi + rcx] ; load symbol 
    test dl, dl ; test for '\0' ; --cmp dl , 0???
    je .done ; if true - finish

    ; lower case
    cmp dl, 'A'
    jl .notUpperCase
    cmp dl, 'Z'
    jg .notUpperCase
    add dl, 32        
.notUpperCase:
    cmp dl, sil 
    je .match 
    jne .next ; jsou not equal -> next
.match:
    inc r8 ; i++
    cmp rax, -1 
    jg .next
    mov rax, rcx 
.next:
    inc rcx 
    jmp .loop
.done:
    mov [count], r8 ; count = r8
    ret ; return default value (rax)



global str2int

str2int:
    xor rcx, rcx    ; current index
    xor rax, rax    ; clear rax to accumulate integer value
.loop:
    mov dl, [rdi + rcx] ; load symbol
    cmp dl, 0   ; test for '\0'
    je .done   ; if true - finish

    ; Multiply the current result by 10
    mov rbx, 10
    imul rax, rbx

    ; Convert character to integer
    sub dl, '0'
    ; Add the converted digit
    add rax, rdx

    inc rcx
    jmp .loop
.done:
    mov [rsi], rax  ; put result into output
    ret


global not_bits
not_bits:
enter 0,0
    mov rdi, rdi ; first param (input)
    mov rsi, rsi ; second param (array)
    mov rdx, rdx ; (length)
    dec rdx ; decrement to ajust indexes
    xor rax, rax 
.loop:
    cmp rdx, 0
    jl .preprocesor

    mov cl, [rsi + rdx] ; load bit n

    ; xor mask with input
    mov rbx, 1
    shl rbx, cl
    xor [rdi], rbx     

    dec rdx
    jmp .loop
.preprocesor:
    mov r8, [rsi]
    
.processed:
    test r8, 1
    jz .next_bit 

    inc rax 
.next_bit:
    shr r8, 1

    test r8, r8 
    jnz .processed

.done:
    
    leave 
    ret
