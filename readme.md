# BacSeq : An automated pipeline for whole genome sequence
# Introduction
### An automated pipeline for whole genome sequence
# Program that included in this project
* Quality Control
    * FastQC
    * MultiQC
* Trimming
    * Fastp
* Assembly
    * SPAdes
* Quality assessment
    * Quast
* Completeness assessment
    * Busco
* Annotation
    * Prokka
* Functional annotation
    * eggNOG-mapper
* Downstream analysis
    * Abricate
    * StarAMR
    * Run-dbcan
    * CRISPRCasFinder
* Comparative analysis
    * Roary
    * SNPsite
    * FastTree
* Visualization and report
    * ete3
# Installation
## Supported OS
### BacSeq is being developed and tested on UBUNTU 18.04
## Third-party components
### A full installation of BacSeq requires Conda. If Conda are installed you can skip this part.
* Conda
  * [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
```bash
bash Miniconda3-latest-Linux-x86_64.sh 
```
## Manual installation (without source code)
```bash
wget 'https://mecob.psu.ac.th/BacSeq_Software/BacSeq.zip'
unzip BacSeq.zip -d BacSeq
cd BacSeq
source install.sh
# Run program with below code
source run_BacSeq.sh
```

## Ubuntu (with JAVA source code)
### Run this code in your terminal.
```bash
git clone https://github.com/mecobpsu/bacseq.git
cd BacSeq
source install.sh
# Run program with below code
source run_BacSeq.sh
```

# Input
### Files that contains filename_1.fastq.gz and filename_2.fastq.gz 
### Do not use files contains filename_R1.fastq.gz or filename_001.fastq.gz

# Output
### Output are stored in Software/output directory

# Author
* Komwit Surachat
    * Email : komwit.s@psu.ac.th
* Kongpop Jeenkeawpiam
    * Email : kongpop.je@gmail.com
### Developed by Molecular Evolution and Computational Biology Research Unit.
### Prince of Songkla University, Thailand