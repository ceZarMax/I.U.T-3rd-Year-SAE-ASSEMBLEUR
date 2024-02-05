.section .rodata
newline:
    .byte 0xA

.section .text
.global s_puts

s_puts:
    movl 4(%esp), %ecx

next_char:
    movb (%ecx), %al
    or %al, %al
    jz print_newline
    movl $4, %eax
    movl $1, %ebx
    movl %ecx, %edx
    movl $1, %edx
    int $0x80
    incl %ecx
    jmp next_char

print_newline:
    movl $4, %eax
    movl $1, %ebx
    movl $newline, %ecx
    movl $1, %edx
    int $0x80
    ret
