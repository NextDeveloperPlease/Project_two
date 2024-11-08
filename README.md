#### Description
This repository contains three files. 
bert_install.bat: Creates a conda environment with all the prerequisite packages. It also activates the environment.
Analysis_v2.ipynb: Notebook containing the code to train a bert model and classifier.
llm-finetune-new.ipynb: Notebook to finetune the bert model (doesn't work yet)
#### Execution
Verify the integrity of the bert_install.bat file (open using notepad - don't double click). It should create a conda environment. Open a command prompt, cd into the project directory, then execute (There is an enter line after. Remember to copy it):

bert_install

conda install pandas numpy jupyter -y

conda install -c pytorch cudatoolkit=11.3 -y

conda install -c conda-forge transformers -y


 Afterwards, open the notebook using:
> jupyter notebook

and click run.
