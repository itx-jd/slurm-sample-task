#!/bin/bash
#SBATCH --job-name=python_computation    # Job name
#SBATCH --output=python_computation.out  # Output file
#SBATCH --error=python_computation.err   # Error file
#SBATCH --nodes=1                        # Number of nodes
#SBATCH --ntasks=1                       # Number of tasks
#SBATCH --time=00:10:00                  # Time limit (10 minutes)
#SBATCH --partition=debug                # Partition name

# Step 4: Run the Python computation script and redirect errors
python3 compute.py 2>> python_computation.err

# Step 5: Zip the output directory after the computation is finished, if files exist
if [ -d "out" ] && [ "$(ls -A out)" ]; then
    zip -r out.zip out/
else
    echo "No files to zip in the 'out' directory." >&2
fi

# Step 6: Deactivate virtual environment
deactivate

echo "Job completed and output zipped into out.zip"