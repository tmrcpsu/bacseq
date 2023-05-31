#!/bin/bash -l
echo "Do you want to install EggNOG-mapper?"
echo "EggNOG-mapper databases contains 60GB"
read -p "Install EggNOG-mapper (y/n)?" choice
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
sudo apt-get install -y pandoc

#Install with conda packages
conda install -y -c conda-forge openjdk=11
conda install -y -c bioconda -c conda-forge multiqc
conda install -y -c bioconda fastp
conda install -y -c bioconda quast
conda install -y -c conda-forge -c bioconda busco=5.3.0
conda install -y -c bioconda -c conda-forge prokka
prokka --setupdb
conda install -y -c conda-forge -c bioconda -c defaults abricate
abricate --setupdb
conda install -y -c bioconda -c conda-forge -c defaults staramr==0.7.2 pandas==1.1.5 mlst==2.19.0
conda install -y -c conda-forge r-curl
conda install -y -c bioconda/label/cf201901 unicycler


#Install with pip packages
pip install dbcan==3.0.2
pip install --upgrade ete3
pip install pyqt5==5.14.0
pip install seaborn

#Install with R packages

R --slave -e "install.packages('heatmaply', repos='https://cran.r-project.org')"

#Another installation
# cpanm -f Bio::Roary
#Create dir and download files
bacseq_dir=$(pwd)
mkdir ${bacseq_dir}/Software
mkdir ${bacseq_dir}/Software/biotools
mkdir ${bacseq_dir}/Software/biotools/dbcan_db
mkdir ${bacseq_dir}/Software/output
mkdir ${bacseq_dir}/Software/output/abricate
mkdir ${bacseq_dir}/Software/output/abricate/scaffolds
mkdir ${bacseq_dir}/Software/output/abricate/heatmap
mkdir ${bacseq_dir}/Software/output/Fasta
mkdir ${bacseq_dir}/Software/output/Fasta/contigs
mkdir ${bacseq_dir}/Software/output/Fasta/scaffolds
mkdir ${bacseq_dir}/Software/output/abricate/html_scaffolds
mkdir ${bacseq_dir}/Software/output/busco
mkdir ${bacseq_dir}/Software/output/CRISPRCasFinder
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
cd ${bacseq_dir}
unzip scripts.zip
mv scripts/ ${bacseq_dir}/Software/biotools/
rm -rf scripts.zip
cd ${bacseq_dir}/Software/biotools/scripts/
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

cd ${bacseq_dir}
unzip CRISPRCasFinder.zip
mv CRISPRCasFinder/ ${bacseq_dir}/Software/biotools/
rm -rf CRISPRCasFinder.zip
cd ${bacseq_dir}/Software/biotools/CRISPRCasFinder/
source installer_UBUNTU.sh
cd ${bacseq_dir}/Software/biotools/dbcan_db \
    && wget http://bcb.unl.edu/dbCAN2/download/CAZyDB.09242021.fa && diamond makedb --in CAZyDB.09242021.fa -d CAZy \
    && wget https://bcb.unl.edu/dbCAN2/download/Databases/V10/dbCAN-HMMdb-V10.txt && mv dbCAN-HMMdb-V10.txt dbCAN.txt && hmmpress dbCAN.txt \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/tcdb.fa && diamond makedb --in tcdb.fa -d tcdb \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/tf-1.hmm && hmmpress tf-1.hmm \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/tf-2.hmm && hmmpress tf-2.hmm \
    && wget http://bcb.unl.edu/dbCAN2/download/Databases/stp.hmm && hmmpress stp.hmm 


cd ${bacseq_dir}
unzip roary_plots.zip
mv roary_plots/ ${bacseq_dir}/Software/biotools/
rm -rf roary_plots.zip
cd ${bacseq_dir}/Software/biotools/
chmod +x roary_plots/*
cd ${bacseq_dir}/Software/biotools/
wget 'http://www.microbesonline.org/fasttree/FastTree'
chmod 777 FastTree
case "$choice" in 
  y|Y ) 
    conda install -y -c bioconda eggnog-mapper
    mkdir ${bacseq_dir}/Software/biotools/eggnog-mapper/
    mkdir ${bacseq_dir}/Software/biotools/eggnog-mapper/data
    mkdir ${bacseq_dir}/Software/output/eggnog-mapper
    download_eggnog_data.py -y --data_dir ${bacseq_dir}/Software/biotools/eggnog-mapper/data
  ;;
  n|N ) 
  echo "You didn't install EggNOG-mapper this part will be skip..."
  ;;
  * ) echo "invalid";;
esac
chmod 777 ${bacseq_dir}/Software
cd ${bacseq_dir}
chmod 777 ${bacseq_dir}/Software/biotools/scripts/R_script/heatmap.R
chmod +x ${bacseq_dir}/Software/biotools/scripts/*
chmod +x run_BacSeq.sh
echo "Please use \"source run_BacSeq.sh\" to run program"
