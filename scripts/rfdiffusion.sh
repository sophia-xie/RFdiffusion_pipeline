#!/bin/bash

set -e

repo_dir=/hpf/tools/alma8/RFDiffusion/1.1.0/

echo Loading module...

module load RFDiffusion/1.1.0

echo Activating conda...

eval "$(conda shell.bash hook)"
conda activate /hpf/tools/centos7/miniforge/3/envs/SE3nv

echo Running script...

run_name=$1
output_dir=$2
pdb_path=$3
contig=$4
hotspots=$5
min_length=$6
max_length=$7
num_structs=$8
rfdiffusion_model=$9

echo RUN_NAME $run_name
echo OUTPUT_DIR $output_dir
echo PDB_PATH $pdb_path
echo CONTIG $contig
echo HOTSPOTS $hotspots
echo MIN_LENGTH $min_length
echo MAX_LENGTH $max_length
echo NUM_STRUCTS $num_structs
echo RFDIFFUSION_MODEL $rfdiffusion_model

$repo_dir/scripts/run_inference.py \
inference.input_pdb=$pdb_path \
"contigmap.contigs=[$contig $min_length-$max_length]" \
"ppi.hotspot_res=[$hotspots]" \
inference.num_designs=$num_structs \
inference.ckpt_override_path=$repo_dir/models/$rfdiffusion_model \
inference.output_prefix=$output_dir/rfdiffusion/$run_name \
denoiser.noise_scale_ca=0 \
denoiser.noise_scale_frame=0

echo
echo Done.
