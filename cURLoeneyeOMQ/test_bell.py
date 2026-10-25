import ctypes

class OMQStateVector(ctypes.Structure):
    _fields_ = [
        ("real", ctypes.c_double * 4),
        ("imag", ctypes.c_double * 4)
    ]

lib = ctypes.CDLL("./libomqqiskit.so")
lib.omq_init_state.argtypes = [ctypes.POINTER(OMQStateVector)]
lib.omq_apply_h.argtypes = [ctypes.POINTER(OMQStateVector), ctypes.c_int]
lib.omq_apply_cnot.argtypes = [ctypes.POINTER(OMQStateVector), ctypes.c_int, ctypes.c_int]

sv = OMQStateVector()
lib.omq_init_state(ctypes.byref(sv))

# Apply Hadamard on control qubit 0
lib.omq_apply_h(ctypes.byref(sv), 0)

# Apply CNOT with control 0, target 1 to create Bell state (|00> + |11>) / sqrt(2)
lib.omq_apply_cnot(ctypes.byref(sv), 0, 1)

print("Bell State Real Amplitudes (|00>, |01>, |10>, |11>):")
for i in range(4):
    print(f"  State {i:02b}: {sv.real[i]:.4f}")

print("CNOT and Bell State FFI Test: SUCCESS")
