; test the fusion of complex addressing modes
; written by Peter Cordes at http://stackoverflow.com/a/31027695/149138


GLOBAL _start
_start:
    xor eax, eax
    xor ebx, ebx
    xor edx, edx
    xor edi, edi
    lea rsi, [rel mydata]   ; load pointer
    mov ecx, 10000000
    cmp dword [rsp], 2      ; argc >= 2
    je .loop_2reg
    cmp dword [rsp], 3
    je .loop_riprel
    jg .out

ALIGN 32
.loop_1reg:
    or eax, [rsi + 0]
    or ebx, [rsi + 4]
    dec ecx
    nop
    nop
    nop
    nop
    jg .loop_1reg
;   xchg r8, r9     ; no effect on flags; decided to use NOPs instead

    jmp .out

ALIGN 32
.loop_2reg:
    or eax, [rsi + 0 + rdi]
    or ebx, [rsi + 4 + rdi]
    dec ecx
    nop
    nop
    nop
    nop
    jg .loop_2reg

    jmp .out

ALIGN 32
.loop_riprel
    cmp dword [rel mydata], 1
    cmp dword [rel mydata], 2
    dec ecx
    nop
    nop
    nop
    nop
    jg .loop_riprel

.out:
    xor edi, edi
    mov eax, 231    ;  exit(0)
    syscall

SECTION .rodata
mydata:
db 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
