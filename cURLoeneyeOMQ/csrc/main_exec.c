#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <string.h>

typedef struct {
    double real[4];
    double imag[4];
} OMQStateVector;

int main(void) {
    printf("=== OMQ Quantum Simulation Kernel (C Standalone) ===\n");
    
    OMQStateVector sv;
    memset(&sv, 0, sizeof(OMQStateVector));
    sv.real[0] = 1.0; // |00>

    // Hadamard on qubit 0
    double inv_sqrt2 = 1.0 / sqrt(2.0);
    double r0 = sv.real[0], r1 = sv.real[1];
    sv.real[0] = (r0 + r1) * inv_sqrt2;
    sv.real[1] = (r0 - r1) * inv_sqrt2;

    // CNOT (control=0, target=1) swapping |01> and |11>
    double temp_r = sv.real[1];
    double temp_i = sv.imag[1];
    sv.real[1] = sv.real[3];
    sv.imag[1] = sv.imag[3];
    sv.real[3] = temp_r;
    sv.imag[3] = temp_i;

    printf("Bell State Amplitudes:\n");
    printf("  |00>: %.4f\n", sv.real[0]);
    printf("  |01>: %.4f\n", sv.real[1]);
    printf("  |10>: %.4f\n", sv.real[2]);
    printf("  |11>: %.4f\n", sv.real[3]);
    printf("CkernelOMQ Execution: SUCCESS\n");
    
    return 0;
}
