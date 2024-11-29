import numpy as np
import os

# Create the output directory if it doesn't exist
output_dir = 'out'
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Perform some computation (e.g., matrix multiplication)
matrix_a = np.random.rand(100, 100)
matrix_b = np.random.rand(100, 100)
result = np.dot(matrix_a, matrix_b)

# Save the result to a .npy file (binary format)
output_file_npy = os.path.join(output_dir, 'result.npy')
np.save(output_file_npy, result)

print(f"Computation complete. Result saved to {output_file_npy}")
