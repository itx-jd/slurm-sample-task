#!/bin/bash

# Variables
REPO_URL="https://github.com/itx-jd/slurm-sample-task.git"
WORKING_DIR="slurm-sample-task"
WORKER_NODE="slurm-worker"
USER="vagrant"

# Step 1: Clone the repository on the master node
echo "Cloning repository on master node..."
git clone $REPO_URL $WORKING_DIR
cd $WORKING_DIR

# Step 2: Install requirements on the master node
echo "Installing requirements on master node..."
pip install -r requirements.txt

cd ..

# Step 3: Copy the repository to worker node
echo "Cloning repository on worker node..."
sshpass -p "vagrant" ssh $USER@$WORKER_NODE

echo "Cloning repository on worker node..."
git clone $REPO_URL $WORKING_DIR
cd $WORKING_DIR

# Step 4: Install requirements on the worker node
echo "Installing requirements on worker node..."

# Step 2: Install requirements on the master node
echo "Installing requirements on master node..."
pip install -r requirements.txt

# Step 5: Submit Slurm job on the master node
echo "Submitting Slurm job..."
sbatch run.sh
