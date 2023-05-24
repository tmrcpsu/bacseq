# BacSeq: A user-friendly automated pipeline for whole-genome sequence analysis of bacterial genomes
# Introduction
### BacSeq is all-in-one pipeline for bacterial genome analysis. The software contained several Bioinformatics tools for quality control of raw reads, genome assembly and quality assesments, genome annotation, downstream analysis, and comparative genomic analysis. BacSeq is available for both short-read and long-read sequencing data and the visualization and reports will be exhibited on the html page.
# Workflows
![image](https://mecob.psu.ac.th/BacSeq_Software/img/workflow.png)
* Quality Control
    * FastQC
    * MultiQC
* Trimming
    * fastp
* Assembly
    * SPAdes
    * Unicycler
* Quality assessment
    * QUAST
* Completeness assessment
    * BUSCO
* Annotation
    * Prokka
* Functional annotation
    * eggNOG-mapper
* Downstream analysis
    * ABRicate
    * StarAMR
    * Run-dbcan
    * CRISPRCasFinder
* Comparative analysis
    * Roary
    * SNP-site
    * FastTree
* Visualization and report
    * ete3
# Installation
## Supported OS
### BacSeq is being developed and tested on UBUNTU 18.04
## Third-party components
### A full installation of BacSeq requires conda. If conda has been installed you can skip this part.
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
# Run program with a code below
source run_BacSeq.sh
```
# Tutorial
<div style="text-align: center;font-size:24px">1.Home Page then select Browse... and select Basic mode or Advanced mode</div>

* Quick mode will be running all steps in the pipeline.
* Advanced mode will be running the programs according to your selection.
 
![image](https://mecob.psu.ac.th/BacSeq_Software/img/1.png)

 <div style="text-align: center;font-size:24px">2.Select directory that include with this files pattern </div>

![image](https://mecob.psu.ac.th/BacSeq_Software/img/file_example.png)

<div style="text-align: center;font-size:24px">3.De novo assembly page </div>

![image](https://mecob.psu.ac.th/BacSeq_Software/img/2.png)

<div style="text-align: center;font-size:24px">4.Downstream analysis page </div>

![image](https://mecob.psu.ac.th/BacSeq_Software/img/3.png)

<div style="text-align: center;font-size:24px">5.Comparative analysis page </div>

![image](https://mecob.psu.ac.th/BacSeq_Software/img/4.png)

<div style="text-align: center;font-size:24px">6.Visualization and report page </div>

* Buttown will be enable to click when each program run successfully.
* When user click the button in this page, the program will open an output directory.

![image](https://mecob.psu.ac.th/BacSeq_Software/img/5.png)

# Input
### Files that contains filename_1.fastq.gz and filename_2.fastq.gz 
### Do not use files contains filename_R1.fastq.gz or filename_001.fastq.gz

# Output
### Outputs are stored in Software/output directory

# Authors
* Asst. Prof. Dr. Komwit Surachat
    * E-mail: komwit.s@psu.ac.th
* Dr. Arnon Chukamnerd
    * E-mail: arnonchukamnerd@hotmail.com
* Kongpop Jeenkeawpiam
    * E-mail: kongpop.je@gmail.com
### Developed by Molecular Evolution and Computational Biology Research Unit. [MECoB](https://mecob.psu.ac.th)
### Prince of Songkla University, Thailand
