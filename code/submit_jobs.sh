#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=05:00:00
#SBATCH --mem=84GB
#SBATCH --job-name=Knit_rmd
#SBATCH --mail-type=END
#SBATCH --mail-user=sz4633@nyu.edu

module purge
module load r/gcc/4.3.1
Rscript jobs_to_submit.R


