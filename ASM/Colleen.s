default rel
;hello
section .data
    fmt db "default rel%c;hello%csection .data%c    fmt db %c%s%c, 0%c%csection .text%c    global main%c    extern printf%cfunc:%c    ret%cmain:%c    push rbp%c    call func%c    ;world%c    lea rdi, [fmt]%c    mov rsi, 10%c    mov rdx, 10%c    mov rcx, 10%c    mov r8, 34%c    lea r9, [fmt]%c    times 25 push 10%c    push 34%c    xor rax, rax%c    call printf%c    add rsp, 208%c    xor rax, rax%c    pop rbp%c    ret%c", 0

section .text
    global main
    extern printf
func:
    ret
main:
    push rbp
    call func
    ;world
    lea rdi, [fmt]
    mov rsi, 10
    mov rdx, 10
    mov rcx, 10
    mov r8, 34
    lea r9, [fmt]
    times 25 push 10
    push 34
    xor rax, rax
    call printf
    add rsp, 208
    xor rax, rax
    pop rbp
    ret
