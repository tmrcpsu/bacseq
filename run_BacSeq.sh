#!/bin/bash -l
conda init bash
conda activate bacseq
if type -p java; then
    echo Found java executable in PATH
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo Found java executable in JAVA_HOME     
    _java="$JAVA_HOME/bin/java"
else
    echo "no java"
fi


DIR="$( dirname -- "${BASH_SOURCE[0]}"; )";   # Get the directory name
DIR="$( realpath -e -- "$DIR"; )"; 
fastqc_path="$DIR/Software/biotools/FastQC/fastqc"
multiqc_path=$(which multiqc)
fastp_path=$(which fastp)
unicycler_path=$(which unicycler)
spades_path="$DIR/Software/biotools/SPAdes/bin/spades.py"
quast_path=$(which quast)
busco_path=$(which busco)
prokka_path=$(which prokka)
abricate_path=$(which abricate)
staramr_path=$(which staramr)
run_dbcan_path=$(which run_dbcan)
crispr_path="$DIR/Software/biotools/CRISPRCasFinder/CRISPRCasFinder.pl"
roary_path=$(which roary)
snp_sites_path=$(which snp-sites)
fasttree_path="$DIR/Software/biotools/FastTree"

# echo $DIR
if [[ "$_java" ]]; then
    JAVA_VERSION=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
	
    version=$("$_java" -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*".*/\1\2/p;')
    echo Java version "$JAVA_VERSION"
    if [[ "$_java" ]]; then
        
        if [[ -f $fastqc_path ]];
    then
    echo "Found FastQC in [$fastqc_path]"
    else
    echo "FastQC not found.***********************************************"
    fi
    if [[ $multiqc_path ]];
    then
    echo "Found MultiQC in [$multiqc_path]"
    else
    echo "MultiQC not found.***********************************************"
    fi
    if [[ $fastp_path ]];
    then
    echo "Found Fastp in [$fastp_path]"
    else
    echo "Fastp not found.***********************************************"
    fi
    if [[ $unicycler_path ]];
    then
    echo "Found Unicycler in [$unicycler_path]"
    else
    echo "Unicycler not found.***********************************************"
    fi
    if [[ -f $spades_path ]];
    then
    echo "Found SPAdes in [$spades_path]"
    else
    echo "SPAdes not found.***********************************************"
    fi
    if [[ $quast_path ]];
    then
    echo "Found Quast in [$quast_path]"
    else
    echo "Quast not found.***********************************************"
    fi
    if [[ $busco_path ]];
    then
    echo "Found Busco in [$busco_path]"
    else
    echo "Busco not found.***********************************************"
    fi
    if [[ $prokka_path ]];
    then
    echo "Found Prokka in [$prokka_path]"
    else
    echo "Prokka not found.***********************************************"
    fi  
    if [[ $abricate_path ]];
    then
    echo "Found ABRicate in [$abricate_path]"
    else
    echo "ABRicate not found.***********************************************"
    fi  
    if [[ $staramr_path ]];
    then
    echo "Found StarAMR in [$staramr_path]"
    else
    echo "StarAMR not found.***********************************************"
    fi  
    if [[ $run_dbcan_path ]];
    then
    echo "Found Run_dbcan in [$run_dbcan_path]"
    else
    echo "Run_dbcan not found.***********************************************"
    fi  
    if [[ $crispr_path ]];
    then
    echo "Found CRISPRCasFinder in [$crispr_path]"
    else
    echo "CRISPRCasFinder not found.***********************************************"
    fi  
    if [[ $roary_path ]];
    then
    echo "Found Roary in [$roary_path]"
    else
    echo "Roary not found.***********************************************"
    fi  
    if [[ $snp_sites_path ]];
    then
    echo "Found SNP-sites in [$snp_sites_path]"
    else
    echo "SNP-sites not found.***********************************************"
    fi  
    if [[ -f $fasttree_path ]];
    then
    echo "Found FastTree in [$fasttree_path]"
    else
    echo "FastTree not found.***********************************************"
    fi  

    fi
    
java -jar BacSeq-1.0.jar
fi
