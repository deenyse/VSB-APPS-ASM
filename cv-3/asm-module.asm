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

    ; Приведение символа к нижнему регистру
    cmp dl, 'A'
    jl .notUpperCase
    cmp dl, 'Z'
    jg .notUpperCase
    add dl, 32           ; преобразуем символ к строчной букве
.notUpperCase:
    cmp dl, sil ; Сравниваем символ со значением в rsi (искомый символ)
    je .match ; символы полностью совпадают
    jne .next ; jsou not equal -> next
.match:
    inc r8 ; i++
    cmp rax, -1 ; Проверяем, было ли уже найдено первое вхождение
    jg .next ; Если уже было найдено, переходим к следующему символу
    mov rax, rcx ; Запоминаем индекс первого вхождения
.next:
    inc rcx ; Переходим к следующему символу в строке
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

    ; Move to the next character
    inc rcx
    jmp .loop
.done:
    mov [rsi], rax  ; put result into output
    ret

;делаю хор по маске(сдвиг на н битов) и в конце считаю количество еденичек на выходе


global not_bits
not_bits:
    mov rdi, rdi ; first param (input)
    mov rsi, rsi ; second param (array)
    mov rdx, rdx ; (length)
    dec rdx ; dec to ajust indexes
    xor rax, rax ;  output
    jmp .processed
.loop:
    cmp rdx, 0
    jl .processed

    mov cl, [rsi + rdx] ; load bit n

    ; xor mask with input
    mov rbx, 1
    shl rbx, cl
    xor rdi, rbx      ; xor with rbx

    dec rdx
    jmp .loop
.processed:
    test rdi, 1 ; put ZF
    jz .next_bit
    
    inc rax
.next_bit:
    shr rdi, 1

    test rdi, rdi
    jnz .processed ; if number != 0

.done:
    ret

