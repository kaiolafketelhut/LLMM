#include <stdio.h>

void __attribute__((constructor)) init_main_dll(void) {
    printf("(=^ω^=) main.DLL (shared library) loaded successfully.\n");
}

int d16s_runtime_hook(void) {
    printf("(=^ ◡ ^=) Executing D16S routine from shared object.\n");
    return 0;
}
