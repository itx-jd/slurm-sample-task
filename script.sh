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

echo "Setting up virtual environment"
python3 -m venv venv

echo "Activating virtual environment"
source venv/bin/activate

# Step 2: Install requirements on the master node
echo "Installing requirements on master node..."
pip install -r requirements.txt

# Step 3: Copy the repository to worker node
echo "Copying repository to worker node..."
scp -r $WORKING_DIR $USER@$WORKER_NODE:/home/$USER/

# Step 4: Install requirements on the worker node
echo "Installing requirements on worker node..."
sshpass -p "vagrant" ssh $USER@$WORKER_NODE "cd /home/$USER/$WORKING_DIR && python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt"

# Step 5: Submit Slurm job on the master node
echo "Submitting Slurm job..."
sbatch run.sh
