#!/bin/bash -l
#Install Defaults packages
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y pkg-config
sudo apt install -y default-jre
sudo apt install -y default-jdk
sudo apt-get install -y build-essential
#Conda environment
conda create -y --name bacseq python=3.7 pip
conda init bash
conda activate bacseq
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --add channels r
#Install with ubuntu packages
sudo apt-get install -y libfreetype6-dev libpng-dev python3-matplotlib
sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module
sudo apt-get install -y roary
sudo apt-get install -y snp-sites
sudo apt-get install -y python-numpy python-qt4 python-lxml python-six
sudo apt-get install -y python3-pyqt5
#Install with conda packages
conda install -y -c conda-forge openjdk=11
conda install -y -c bioconda -c conda-forge multiqc
conda install -y -c bioconda fastp
conda install -y -c bioconda quast
conda install -y -c conda-forge -c bioconda busco=5.3.0
conda install -y -c bioconda -c conda-forge prokka
prokka --setupdb
conda install -y -c bioconda eggnog-mapper
conda install -y -c conda-forge -c bioconda -c defaults abricate
abricate --setupdb
conda install -y -c bioconda -c conda-forge -c defaults staramr==0.7.2 pandas==1.1.5 mlst==2.19.0
#Install with pip packages
pip install dbcan==3.0.2
pip install --upgrade ete3
pip install pyqt5==5.14.0
#Create dir and download files
bacseq_dir=$(pwd)
mkdir ${bacseq_dir}/Software
mkdir ${bacseq_dir}/Software/biotools
mkdir ${bacseq_dir}/Software/biotools/eggnog-mapper/
mkdir ${bacseq_dir}/Software/biotools/eggnog-mapper/data
mkdir ${bacseq_dir}/Software/biotools/dbcan_db
mkdir ${bacseq_dir}/Software/output
mkdir ${bacseq_dir}/Software/output/abricate
mkdir ${bacseq_dir}/Software/output/abricate/scaffolds
mkdir ${bacseq_dir}/Software/output/abricate/contigs
mkdir ${bacseq_dir}/Software/output/abricate/html_contigs
mkdir ${bacseq_dir}/Software/output/abricate/html_scaffolds
mkdir ${bacseq_dir}/Software/output/busco
mkdir ${bacseq_dir}/Software/output/CRISPRCasFinder
mkdir ${bacseq_dir}/Software/output/eggnog-mapper
mkdir ${bacseq_dir}/Software/output/fastp
mkdir ${bacseq_dir}/Software/output/FastQC
mkdir ${bacseq_dir}/Software/output/FastTree
mkdir ${bacseq_dir}/Software/output/gff
mkdir ${bacseq_dir}/Software/output/MultiQC
mkdir ${bacseq_dir}/Software/output/prokka
mkdir ${bacseq_dir}/Software/output/quast
mkdir ${bacseq_dir}/Software/output/roary
mkdir ${bacseq_dir}/Software/output/run_dbcan
mkdir ${bacseq_dir}/Software/output/snp_sites
mkdir ${bacseq_dir}/Software/output/SPAdes
mkdir ${bacseq_dir}/Software/output/staramr
mkdir ${bacseq_dir}/Software/output/staramr/scaffolds
mkdir ${bacseq_dir}/Software/output/staramr/contigs
mkdir ${bacseq_dir}/Software/output/busco/scaffolds
mkdir ${bacseq_dir}/Software/output/busco/graph_plot
mkdir ${bacseq_dir}/Software/output/busco/visualization/
cd ${bacseq_dir}/Software/biotools
#FastQC
wget 'https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip'
unzip fastqc_v0.11.9.zip
rm -rf fastqc_v0.11.9.zip
cd FastQC
chmod 777 *
#Download scripts from mecob
cd ${bacseq_dir}/Software/biotools
wget 'https://mecob.psu.ac.th/BacSeq_Software/scripts.zip'
unzip scripts.zip
rm -rf scripts.zip
cd scripts
chmod 777 * 

#SPAdes
cd ${bacseq_dir}/Software/biotools
wget 'http://cab.spbu.ru/files/release3.15.4/SPAdes-3.15.4-Linux.tar.gz'
tar -xzf SPAdes-3.15.4-Linux.tar.gz
rm -rf SPAdes-3.15.4-Linux.tar.gz
cp -r SPAdes-3.15.4-Linux SPAdes
rm -rf SPAdes-3.15.4-Linux
cd SPAdes
chmod 777 *

cd ${bacseq_dir}/Software/biotools
wget 'https://mecob.psu.ac.th/BacSeq_Software/CRISPRCasFinder.zip'
unzip CRISPRCasFinder.zip
rm -rf CRISPRCasFinder.zip
cd CRISPRCasFinder
source installer_UBUNTU.sh
cd ${bacseq_dir}/Software/biotools/dbcan_db \
    && wget http://bcb.unl.edu/dbCAN2/download/CAZyDB.09242021.fa && diamond makedb --in CAZyDB.09242021.fa -d CAZy \
    && wget https://bcb.unl.edu/dbCAN2/download/Databases/V10/dbCAN-HMMdb-V10.txt && mv dbCAN-HMMdb-V10.txt dbCAN.txt && hmmpress dbCAN.txt \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/tcdb.fa && diamond makedb --in tcdb.fa -d tcdb \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/tf-1.hmm && hmmpress tf-1.hmm \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/tf-2.hmm && hmmpress tf-2.hmm \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/stp.hmm && hmmpress stp.hmm 


cd ${bacseq_dir}/Software/biotools/
wget 'http://www.microbesonline.org/fasttree/FastTree'
chmod 777 FastTree
download_eggnog_data.py -y --data_dir ${bacseq_dir}/Software/biotools/eggnog-mapper/data

chmod 777 ${bacseq_dir}/Software
cd ${bacseq_dir}

chmod +x run_BacSeq.sh
echo "Please use \"source run_BacSeq.sh\" to run program"
