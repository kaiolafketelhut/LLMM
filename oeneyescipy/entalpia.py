import numpy as np

def fahrenheit_to_kelvin(f):
    """Converts Fahrenheit temperature to Kelvin"""
    return (f - 32) * 5/9 + 273.15

def calculate_enthalpy_wavelength(temp_f, wavelength_nm, auhx_factor=1.0):
    """
    Calculates a custom simulated enthalpy delta dependent on:
    - temp_f: Temperature in Fahrenheit
    - wavelength_nm: Wavelength in nanometers (absorption scale)
    - auhx_factor: A scaling genetics coefficient (AuHx)
    """
    T = fahrenheit_to_kelvin(temp_f)
    
    # Energy calculation: E = h * c / lambda
    hc = 1.986445e-16  # J * nm
    energy_wavelength = hc / wavelength_nm
    
    # Mathematical integration baseline approximation
    cp_base = 29.1  # J/(mol*K) base capacity reference
    enthalpy = (cp_base * T) + (auhx_factor * energy_wavelength * 1e23)
    
    return float(enthalpy)

def calculate_oximeter_auhx(absorbance_660, absorbance_940, temp_f, baseline_factor=1.0):
    """
    Calculates AuHx state parameters using pulse oximeter wavelength metrics.
    
    Parameters:
    - absorbance_660: Optical density/absorption at Red light (660 nm)
    - absorbance_940: Optical density/absorption at Near-Infrared light (940 nm)
    - temp_f: Environment temperature in Fahrenheit
    - baseline_factor: Base scaling constant for the AuHx configuration
    """
    # 1. Standardize temperatures
    T = (temp_f - 32) * 5/9 + 273.15
    
    # 2. Compute the oximetry ratio R (Ratio of Ratios)
    # R = (A660) / (A940)
    if absorbance_940 == 0:
        return 0.0
    R = absorbance_660 / absorbance_940
    
    # 3. Translate R into a dynamic shift proxy for AuHx LSPR
    # Higher hydriding changes optical transmission across red/IR bands
    auhx_effective_wavelength = 660.0 + (R * 280.0) 
    
    # 4. Integrate into your working enthalpy energy formula: E = hc / lambda
    hc = 1.986445e-16  # J * nm
    energy_delta = hc / auhx_effective_wavelength
    
    cp_base = 29.1  # J/(mol*K)
    total_enthalpy = (cp_base * T) + (baseline_factor * energy_delta * 1e23)
    
    return {
        "oximeter_ratio_R": float(R),
        "derived_wavelength_nm": float(auhx_effective_wavelength),
        "calculated_enthalpy": float(total_enthalpy)
    }

