default rel
;Sully
section .data
    fmt db "default rel%2$c;Sully%2$csection .data%2$c    fmt db %3$c%4$s%3$c, 0%2$c    filename_fmt db %3$cSully_%%d.s%3$c, 0%2$c    command_fmt db %3$cnasm -f elf64 %%1$s -o Sully_%%2$d.o && gcc Sully_%%3$d.o -o Sully_%%4$d && rm -f Sully_%%4$d.o && ./Sully_%%5$d%3$c, 0%2$c    source_name db __FILE__, 0%2$c    prefix db %3$cSully_%3$c, 0%2$c    index dd %1$d%2$c%2$csection .bss%2$c    filename resb 64%2$c    command resb 256%2$c%2$csection .text%2$c    global main%2$c    extern strrchr%2$c    extern strncmp%2$c    extern snprintf%2$c    extern dprintf%2$c    extern system%2$c%2$cmain:%2$c    push r12%2$c    push r13%2$c    sub rsp, 8%2$c%2$c    mov r13d, [index]%2$c    lea rdi, [source_name]%2$c    mov esi, 47%2$c    call strrchr wrt ..plt%2$c    test rax, rax%2$c    jz .basename%2$c    lea rdi, [rax + 1]%2$c    jmp .check%2$c.basename:%2$c    lea rdi, [source_name]%2$c.check:%2$c    lea rsi, [prefix]%2$c    mov edx, 6%2$c    call strncmp wrt ..plt%2$c    test eax, eax%2$c    jnz .generate%2$c    dec r13d%2$c.generate:%2$c    test r13d, r13d%2$c    js .success%2$c%2$c    lea rdi, [filename]%2$c    mov esi, 64%2$c    lea rdx, [filename_fmt]%2$c    mov ecx, r13d%2$c    xor eax, eax%2$c    call snprintf wrt ..plt%2$c    test eax, eax%2$c    js .failure%2$c    cmp eax, 64%2$c    jae .failure%2$c%2$c    mov eax, 2%2$c    lea rdi, [filename]%2$c    mov esi, 577%2$c    mov edx, 0644o%2$c    syscall%2$c    test rax, rax%2$c    js .failure%2$c    mov r12d, eax%2$c%2$c    mov edi, r12d%2$c    lea rsi, [fmt]%2$c    mov edx, r13d%2$c    mov ecx, 10%2$c    mov r8d, 34%2$c    lea r9, [fmt]%2$c    xor eax, eax%2$c    call dprintf wrt ..plt%2$c    test eax, eax%2$c    js .write_error%2$c%2$c    mov eax, 3%2$c    mov edi, r12d%2$c    syscall%2$c    test rax, rax%2$c    js .failure%2$c%2$c    lea rdi, [command]%2$c    mov esi, 256%2$c    lea rdx, [command_fmt]%2$c    lea rcx, [filename]%2$c    mov r8d, r13d%2$c    mov r9d, r13d%2$c    push r13%2$c    push r13%2$c    xor eax, eax%2$c    call snprintf wrt ..plt%2$c    add rsp, 16%2$c    test eax, eax%2$c    js .failure%2$c    cmp eax, 256%2$c    jae .failure%2$c%2$c    lea rdi, [command]%2$c    call system wrt ..plt%2$c    test eax, eax%2$c    jnz .failure%2$c%2$c.success:%2$c    xor eax, eax%2$c    jmp .done%2$c.write_error:%2$c    mov eax, 3%2$c    mov edi, r12d%2$c    syscall%2$c.failure:%2$c    mov eax, 1%2$c.done:%2$c    add rsp, 8%2$c    pop r13%2$c    pop r12%2$c    ret%2$c", 0
    filename_fmt db "Sully_%d.s", 0
    command_fmt db "nasm -f elf64 %1$s -o Sully_%2$d.o && gcc Sully_%3$d.o -o Sully_%4$d && rm -f Sully_%4$d.o && ./Sully_%5$d", 0
    source_name db __FILE__, 0
    prefix db "Sully_", 0
    index dd 5

section .bss
    filename resb 64
    command resb 256

section .text
    global main
    extern strrchr
    extern strncmp
    extern snprintf
    extern dprintf
    extern system

main:
    push r12
    push r13
    sub rsp, 8

    mov r13d, [index]
    lea rdi, [source_name]
    mov esi, 47
    call strrchr wrt ..plt
    test rax, rax
    jz .basename
    lea rdi, [rax + 1]
    jmp .check
.basename:
    lea rdi, [source_name]
.check:
    lea rsi, [prefix]
    mov edx, 6
    call strncmp wrt ..plt
    test eax, eax
    jnz .generate
    dec r13d
.generate:
    test r13d, r13d
    js .success

    lea rdi, [filename]
    mov esi, 64
    lea rdx, [filename_fmt]
    mov ecx, r13d
    xor eax, eax
    call snprintf wrt ..plt
    test eax, eax
    js .failure
    cmp eax, 64
    jae .failure

    mov eax, 2
    lea rdi, [filename]
    mov esi, 577
    mov edx, 0644o
    syscall
    test rax, rax
    js .failure
    mov r12d, eax

    mov edi, r12d
    lea rsi, [fmt]
    mov edx, r13d
    mov ecx, 10
    mov r8d, 34
    lea r9, [fmt]
    xor eax, eax
    call dprintf wrt ..plt
    test eax, eax
    js .write_error

    mov eax, 3
    mov edi, r12d
    syscall
    test rax, rax
    js .failure

    lea rdi, [command]
    mov esi, 256
    lea rdx, [command_fmt]
    lea rcx, [filename]
    mov r8d, r13d
    mov r9d, r13d
    push r13
    push r13
    xor eax, eax
    call snprintf wrt ..plt
    add rsp, 16
    test eax, eax
    js .failure
    cmp eax, 256
    jae .failure

    lea rdi, [command]
    call system wrt ..plt
    test eax, eax
    jnz .failure

.success:
    xor eax, eax
    jmp .done
.write_error:
    mov eax, 3
    mov edi, r12d
    syscall
.failure:
    mov eax, 1
.done:
    add rsp, 8
    pop r13
    pop r12
    ret
