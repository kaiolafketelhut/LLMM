import ctypes
import os

lib_path = "./libomqqiskit.so"
if os.path.exists(lib_path):
    lib = ctypes.CDLL(lib_path)
    
    # Set argument and return types
    lib.verify_environment.restype = ctypes.c_bool
    lib.omq_bell_counts.argtypes = [ctypes.c_int]
    lib.omq_bell_counts.restype = ctypes.c_int
    
    # Invoke native functions
    env_ok = lib.verify_environment()
    shots_result = lib.omq_bell_counts(1024)
    
    print(f"C Kernel verify_environment(): {env_ok}")
    print(f"C Kernel omq_bell_counts(1024): {shots_result}")
    print("Direct Ctypes FFI Integration: SUCCESS")
else:
    print(f"Error: {lib_path} not found.")
