#include <iostream>
#include <vector>
#include <cuda_runtime.h>
#include <unistd.h>

int main(int argc, char* argv[]) {
    // 1. Initialize and verify CUDA environment
    int deviceCount = 0;
    cudaError_t error = cudaGetDeviceCount(&deviceCount);
    
    if (error != cudaSuccess || deviceCount == 0) {
        std::cout << "[CUDA Wrapper] No CUDA-capable devices detected or driver initialization failed. Continuing...\n";
    } else {
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, 0);
        std::cout << "[CUDA Wrapper] Active Device: " << prop.name 
                  << " (Compute Capability " << prop.major << "." << prop.minor << ")\n";
    }

    // 2. Prepare argument vector for the binary
    std::vector<char*> exec_args;
    exec_args.push_back(const_cast<char*>("./dist/D16S"));
    for (int i = 1; i < argc; ++i) {
        exec_args.push_back(argv[i]);
    }
    exec_args.push_back(nullptr);

    // 3. Hand off execution via execvp
    std::cout << "[CUDA Wrapper] Executing ./dist/D16S...\n";
    execvp(exec_args[0], exec_args.data());

    std::perror("Failed to execute target binary");
    return 1;
}
