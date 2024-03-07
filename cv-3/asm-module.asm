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