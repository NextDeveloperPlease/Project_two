@echo off
:: Create the conda environment
conda create --name bert python=3.11

:: Activate the environment
conda activate bert

:: Install required packages
conda install pandas
conda install torch
conda install transformers
conda install numpy
