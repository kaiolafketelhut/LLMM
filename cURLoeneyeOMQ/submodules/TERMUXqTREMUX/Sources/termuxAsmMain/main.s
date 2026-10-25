.global main
.text

main:
    # Print audit banner
    mov $1, %rax              # syscall: write
    mov $1, %rdi              # file descriptor: stdout
    leaq banner(%rip), %rsi   # pointer to message
    mov $len, %rdx            # message length
    syscall

    # Exit program
    mov $60, %rax             # syscall: exit
    xor %rdi, %rdi            # exit code 0
    syscall

.section .data
banner:
    .ascii "=== TERMUXqTREMUX Assembly Main Audit Entry (Phi: 1.618034) ===\n"
    .equ len, . - banner
