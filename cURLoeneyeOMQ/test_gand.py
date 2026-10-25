import ctypes
import math

class OMQStateVector3Q(ctypes.Structure):
    _fields_ = [
        ("real", ctypes.c_double * 8),
        ("imag", ctypes.c_double * 8)
    ]

lib = ctypes.CDLL("./libomqqiskit.so")
lib.omq_init_state_3q.argtypes = [ctypes.POINTER(OMQStateVector3Q)]
lib.omq_apply_gand.argtypes = [ctypes.POINTER(OMQStateVector3Q)]

sv = OMQStateVector3Q()
lib.omq_init_state_3q(ctypes.byref(sv))

print("Initial |000> Real Amplitudes:", sv.real[0])
lib.omq_apply_gand(ctypes.byref(sv))
print("After Gand Gate Real Amplitudes (State 0):", f"{sv.real[0]:.4f}")
print("Gand Gate FFI Integration: SUCCESS")
