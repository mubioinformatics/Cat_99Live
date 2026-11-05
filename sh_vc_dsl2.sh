#!/bin/bash
#-------------------------------------------------------------------------------
#  SBATCH CONFIG
#-------------------------------------------------------------------------------
## resources
#SBATCH -p bac
#SBATCH -N 1
#SBATCH --cpus-per-task 4
#SBATCH --mem=5G
#SBATCH -t 4-00:00
#SBATCH --account=bac
#
## labels and outputs
#SBATCH -J cpu_gatk
#SBATCH -o cpu_gatk.out
#
## notifications
##SBATCH --mail-user=
##SBATCH --mail-type=END,FAIL
#
#-------------------------------------------------------------------------------
module load miniconda3
module load samtools
module load minimap2
##module load gatk
module load r

nextflow run nf_vc_dsl2.nf \
	--genome GCF_018350175.1_F.catus_Fca126_mat1.0_genomic_renamed_grange.fa \
	--sample_sheet vc_samplesheet.csv \
	--bqsr false \
	--cohort my_test \
	--cpus_mapping 22 \
	--cpus 6 \
	--col_metrics false \
	--gpu false \
	--run_all false \
	-with-trace logs/trace_cat_cpu.txt \
        -with-report logs/report_cat_cpu.html \
        -with-timeline logs/timeline_cat_cpu.html \
	-resume

