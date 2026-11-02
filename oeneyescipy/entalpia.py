import numpy as np
import scipy.integrate as integrate

class EnthalpyCalculator:
    def __init__(self, cp_coefficients):
        """
        cp_coefficients: list or array of Shomate/NASA equation coefficients 
        e.g., Cp = A + B*t + C*t^2 + D*t^3 + E/t^2
        """
        self.coeffs = cp_coefficients

    def heat_capacity(self, T):
        """Calculate Cp at temperature T (Kelvin)"""
        t = T / 1000.0
        A, B, C, D, E = self.coeffs
        return A + B*t + C*t**2 + D*t**3 + E/(t**2)

    def calculate_enthalpy(self, T1, T2):
        """Integrate Heat Capacity from T1 to T2 to find Delta H"""
        delta_H, error = integrate.quad(self.heat_capacity, T1, T2)
        return delta_H

