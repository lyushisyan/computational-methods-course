#!/bin/bash
#SBATCH --job-name=nepkappa
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=02:00:00
#SBATCH --output=nepkappa-%j.out

set -e
cd "$SLURM_SUBMIT_DIR"
# Adjust this path for your installation of Conda.
source ~/miniconda3/etc/profile.d/conda.sh
conda activate nepkappa

export OMP_NUM_THREADS="$SLURM_CPUS_PER_TASK"
export RAYON_NUM_THREADS="$SLURM_CPUS_PER_TASK"
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1

srun --cpus-per-task="$SLURM_CPUS_PER_TASK" nepkappa run input.yaml
