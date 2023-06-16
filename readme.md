# BacSeq: A user-friendly automated pipeline for whole-genome sequence analysis of bacterial genomes
# Introduction
### BacSeq is an all-in-one pipeline for bacterial genome analysis. The software contained several Bioinformatics tools for quality control of raw reads, genome assembly and quality assessments, genome annotation, downstream analysis, and comparative genomic analysis. BacSeq is available for both short-read and long-read sequencing data and the visualization and reports will be exhibited on the HTML page.
# Workflows
![image](https://i.imgur.com/i1BZsgh.png)
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
### A full installation of BacSeq requires conda. If conda has been installed, you can skip this part.
* Conda
  * [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
```bash
bash Miniconda3-latest-Linux-x86_64.sh
```
## Linux (Tested on Ubuntu 18.04)
### Run this code in your terminal.
```bash
git clone https://github.com/mecobpsu/bacseq.git
cd BacSeq
source install.sh
# Run the program with a code below
source run_BacSeq.sh
```
# Tutorial
<div style="text-align: center;font-size:24px">1.Home Page then select Browse... and select Basic mode or Advanced mode</div>

* Quick mode will be running all steps in the pipeline.
* Advanced mode will be running the programs according to your selection.
 
![image](https://i.imgur.com/zM3C4xN.png)

 <div style="text-align: center;font-size:24px">2.Select directory that include with this files pattern </div>

![image](https://i.imgur.com/Vn5y0A8.png)

<div style="text-align: center;font-size:24px">3.De novo assembly page </div>

![image](https://i.imgur.com/1t0KTuY.png)

<div style="text-align: center;font-size:24px">4.Downstream analysis page </div>

![image](https://i.imgur.com/fIufJvV.png)

<div style="text-align: center;font-size:24px">5.Comparative analysis page </div>

![image](https://i.imgur.com/53cnksR.png)

<div style="text-align: center;font-size:24px">6.Visualization and report page </div>

* Button will be enabled to click when each program runs successfully.
* When the user clicks the button on this page, the program will open an output directory.

![image](https://i.imgur.com/V3OHX7O.png)

# Input
### Files that contains filename_1.fastq.gz and filename_2.fastq.gz 
### Do not use files containing filename_R1.fastq.gz or filename_001.fastq.gz

# Output
### Outputs are stored in the software/output directory

# Authors
* Komwit Surachat
    * E-mail: komwit.s@psu.ac.th
* Arnon Chukamnerd
    * E-mail: arnonchukamnerd@hotmail.com
* Kongpop Jeenkeawpiam
    * E-mail: kongpop.je@gmail.com
### Developed by Genome InFormaTics (GIFT)
### Prince of Songkla University, Thailand
