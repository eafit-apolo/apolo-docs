#!/bin/bash
# Put your SLURM options here
#SBATCH --time=00:02:00           # put proper time of reservation here
#SBATCH --nodes=1                 # number of nodes
#SBATCH --ntasks-per-node=8       # processes per node
#SBATCH --job-name=parallel_example     # change to your job name
#SBATCH --output=parallel_example.%j.out # Stdout (%j expands to jobId)
#SBATCH --error=parallel_example.%j.err # Stderr (%j expands to jobId)

module load dmtcp

source coordinator.sh

################################################################################
# 1. Start DMTCP coordinator
################################################################################

start_coordinator

################################################################################
# 2. Restart application
################################################################################

/bin/bash ./dmtcp_restart_script.sh -h $DMTCP_COORD_HOST -p $DMTCP_COORD_PORT