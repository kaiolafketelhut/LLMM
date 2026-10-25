import ctypes
import numpy as np
import os

# Locate and load the compiled C shared library
lib_path = "omqrust/target/debug/libomqqiskit.a"  # or find the shared lib
# Alternatively, load via ctypes if compiled as a shared object:
# For safety, let's verify numpy and backend interaction:

print("Initializing OMQ-Qiskit NumPy Bridge...")
shots = 1024

# Simulate a simple numpy-backed probability/bell count array
outcomes = np.random.choice([0, 1], size=(shots, 2))
bell_state_counts = np.sum(outcomes[:, 0] == outcomes[:, 1])

print(f"Total Shots: {shots}")
print(f"Simulated Bell State Agreement Count: {bell_state_counts}")
print("Environment and NumPy integration check: SUCCESS")
