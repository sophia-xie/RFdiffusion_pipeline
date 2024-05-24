#!/bin/bash

repo_dir=/hpf/tools/alma8/scannet/v1.0
cd $repo_dir

echo loading module

module load scannet/v1.0
eval "$(conda shell.bash hook)"
conda activate ${repo_dir}/py_scannet

echo Running script...

python ${repo_dir}/predict_bindingsites.py $HOME/pdbs/6w63.pdb --noMSA --predictions_folder /home/csicheri/scannet_predictions

echo Done.