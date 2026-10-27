default rel
;Grace
section .data
    msg db "default rel%c;Grace%csection .data%c    msg db %c%s%c, 0%c    fname db %cGrace_kid.s%c, 0%c%c%%macro OPEN 0%c    mov eax, 2%c    lea rdi, [fname]%c    mov esi, 577%c    mov edx, 0644o%c    syscall%c%%endmacro%c%c%%macro WRITEFILE 0%c    mov edi, r12d%c    lea rsi, [msg]%c    mov edx, 10%c    mov ecx, 10%c    mov r8d, 10%c    mov r9d, 34%c    sub rsp, 8%c    times 68 push 10%c    push 34%c    push 34%c    push 10%c    push 34%c    lea rax, [msg]%c    push rax%c    xor eax, eax%c    call dprintf%c%c    add rsp, 592%c%%endmacro%c%c%%macro CLOSE 0%c    mov eax, 3%c    mov edi, r12d%c    syscall%c%%endmacro%c%csection .text%c    global main%c    extern dprintf%c%cmain:%c    push r12%c%c    OPEN%c    test rax, rax%c    js .error%c%c    mov r12, rax%c    WRITEFILE%c    test eax, eax%c    js .write_error%c%c    CLOSE%c    test eax, eax%c    js .error%c%c    xor eax, eax%c    pop r12%c    ret%c%c.write_error:%c    CLOSE%c%c.error:%c    mov eax, 1%c    pop r12%c    ret%c", 0
    fname db "Grace_kid.s", 0

%macro OPEN 0
    mov eax, 2
    lea rdi, [fname]
    mov esi, 577
    mov edx, 0644o
    syscall
%endmacro

%macro WRITEFILE 0
    mov edi, r12d
    lea rsi, [msg]
    mov edx, 10
    mov ecx, 10
    mov r8d, 10
    mov r9d, 34
    sub rsp, 8
    times 68 push 10
    push 34
    push 34
    push 10
    push 34
    lea rax, [msg]
    push rax
    xor eax, eax
    call dprintf

    add rsp, 592
%endmacro

%macro CLOSE 0
    mov eax, 3
    mov edi, r12d
    syscall
%endmacro

section .text
    global main
    extern dprintf

main:
    push r12

    OPEN
    test rax, rax
    js .error

    mov r12, rax
    WRITEFILE
    test eax, eax
    js .write_error

    CLOSE
    test eax, eax
    js .error

    xor eax, eax
    pop r12
    ret

.write_error:
    CLOSE

.error:
    mov eax, 1
    pop r12
    ret
