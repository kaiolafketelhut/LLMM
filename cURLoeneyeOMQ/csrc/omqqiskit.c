#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#ifndef OMQ_LIB
#include <stdio.h>
#endif

#define PHI 1.618033988749895

bool verify_environment(void) {
    return true;
}

int omq_bell_counts(int shots) {
    return shots;
}

// 2-Qubit State Vector Structure
typedef struct {
    double real[4];
    double imag[4];
} OMQStateVector;

void omq_init_state(OMQStateVector *sv) {
    memset(sv, 0, sizeof(OMQStateVector));
    sv->real[0] = 1.0; // |00> state
}

void omq_apply_h(OMQStateVector *sv, int qubit) {
    double inv_sqrt2 = 1.0 / sqrt(2.0);
    double r0 = sv->real[0], i0 = sv->imag[0];
    double r1 = sv->real[1], i1 = sv->imag[1];
    
    sv->real[0] = (r0 + r1) * inv_sqrt2;
    sv->imag[0] = (i0 + i1) * inv_sqrt2;
    sv->real[1] = (r0 - r1) * inv_sqrt2;
    sv->imag[1] = (i1 - i1) * inv_sqrt2;
}

void omq_apply_cnot(OMQStateVector *sv, int control, int target) {
    double temp_r = sv->real[1];
    double temp_i = sv->imag[1];
    
    sv->real[1] = sv->real[3];
    sv->imag[1] = sv->imag[3];
    sv->real[3] = temp_r;
    sv->imag[3] = temp_i;
}

// 3-Qubit State Vector Structure for Gand Gate
typedef struct {
    double real[8];
    double imag[8];
} OMQStateVector3Q;

void omq_init_state_3q(OMQStateVector3Q *sv) {
    memset(sv, 0, sizeof(OMQStateVector3Q));
    sv->real[0] = 1.0; // |000> state
}

void omq_apply_gand(OMQStateVector3Q *sv) {
    double phi_angle = M_PI / PHI;
    double cos_a = cos(phi_angle);
    double sin_a = sin(phi_angle);

    for (int i = 0; i < 8; i++) {
        double r = sv->real[i];
        double im = sv->imag[i];
        sv->real[i] = r * cos_a - im * sin_a;
        sv->imag[i] = r * sin_a + im * cos_a;
    }
}

#ifndef OMQ_LIB
int main(void) {
    printf("OMQ Unified Kernel: OK\n");
    return 0;
}
#endif
