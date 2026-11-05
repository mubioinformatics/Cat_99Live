# Cat 99 Live variant calling pipeline

## Download the reference genome
Download the reference genome, and provide the absolute path in the bash file

## Prepare the samplesheet
We provide an example samplesheet [here](https://github.com/mubioinformatics/Cat_99Live/blob/main/vc_samplesheet.csv).

## Config the Nextflow pipeline
Edit the *nextflow.config* file to make sure the setup is compatible with the Slurm system 

## Submit the Nextflow pipeline
```
sbatch 

