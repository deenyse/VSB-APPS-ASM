    bits 64

    section .data
    extern pole
    extern arrayPoleLength

    extern zapPole
    extern arrayZapLength
    section .text

global xorArray
xorArray:   
    mov esi, 0
    mov edi, [ arrayPoleLength ]
    mov eax, [ pole ]
.back:
    inc esi
    cmp esi, edi
    jge .done
    mov ecx, [ pole + esi*4 ]
    xor eax, ecx
    jmp .back
.done:
    ret


global absArr
absArr:
    mov esi, zapPole
    mov edi, [arrayZapLength] 
    mov ecx, 0

.back2:  
    cmp ecx, edi  
    jge .fin  

    mov eax, [esi + ecx*4]  
    cmp eax, 0
    jge .positive
   

    neg eax
    mov [esi + ecx*4], eax

.positive:
    inc ecx
    jmp .back2

.fin:
    ret
