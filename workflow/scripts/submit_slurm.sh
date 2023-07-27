#!/bin/bash
#SBATCH --job-name=mikropml_0727
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=500MB
#SBATCH --time=2:00:00
#SBATCH --output=log/hpc/slurm-%j_%x.out 
#SBATCH --account=pschloss0
#SBATCH --partition=standard             
#SBATCH --mail-user=acollens@umich.edu      
#SBATCH --mail-type=BEGIN,END,FAIL

# Load any required modules for your HPC.
# At UMich, the GreatLakes HPC provides a singularity module which is required 
#    if you wish to run snakemake with --use-singularity.
# It is recommended to use your own local conda/mamba installation rather than 
#    the conda module provided by GreatLakes.
module load singularity 

# Run snakemake
snakemake --profile config/slurm --latency-wait 90 --use-singularity --use-conda --conda-frontend mamba --configfile config/glmnet.yaml 
