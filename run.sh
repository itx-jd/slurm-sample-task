#!/bin/bash
#SBATCH --job-name=python_computation    # Job name
#SBATCH --output=python_computation.out  # Output file
#SBATCH --error=python_computation.err   # Error file
#SBATCH --nodes=1                        # Number of nodes
#SBATCH --ntasks=1                       # Number of tasks
#SBATCH --time=00:10:00                  # Time limit (10 minutes)
#SBATCH --partition=debug                # Partition name

# Load any necessary modules, if required (e.g., for virtualenv or Python)
# module load python/3.8

mkdir out

# Activate the virtual environment
source venv/bin/activate

# Run the Python computation script
python compute.py

# Zip the output directory after the computation is finished
zip -r out.zip out/

# Deactivate the virtual environment
deactivate

echo "Job completed and output zipped into out.zip"
