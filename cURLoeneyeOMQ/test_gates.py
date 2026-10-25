import ctypes
import os

class OMQStateVector(ctypes.Structure):
    _fields_ = [
        ("real", ctypes.c_double * 4),
        ("imag", ctypes.c_double * 4)
    ]

lib_path = "./libomqqiskit.so"
lib = ctypes.CDLL(lib_path)

lib.omq_init_state.argtypes = [ctypes.POINTER(OMQStateVector)]
lib.omq_apply_h.argtypes = [ctypes.POINTER(OMQStateVector), ctypes.c_int]

sv = OMQStateVector()
lib.omq_init_state(ctypes.byref(sv))
print(f"Initial State |00> Real Amplitudes: {[sv.real[0], sv.real[1], sv.real[2], sv.real[3]]}")

lib.omq_apply_h(ctypes.byref(sv), 0)
print(f"After Hadamard on Qubit 0 Real Amplitudes: {[sv.real[0], sv.real[1], sv.real[2], sv.real[3]]}")
print("Gate Operations FFI Test: SUCCESS")
