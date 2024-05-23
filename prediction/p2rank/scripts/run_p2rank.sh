#!/bin/bash
#SBATCH --job-name p2rank

set -e

input_dir=$HOME/RFdiffusion_pipeline/inputs/
output_dir=$HOME/RFdiffusion_pipeline/prediction/p2rank/outputs

echo Loading module...

module load p2rank/2.4.1

echo
echo Running script...
prank predict -f $input_dir/6w63_clean.pdb -o $output_dir/6w63_clean

echo
echo Done.
