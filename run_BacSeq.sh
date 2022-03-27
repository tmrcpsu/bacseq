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

if [[ "$_java" ]]; then
    JAVA_VERSION=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
	
    version=$("$_java" -version 2>&1 | sed -n ';s/.* version "\(.*\)\.\(.*\)\..*".*/\1\2/p;')
    echo Java version "$JAVA_VERSION"
    if [[ "$_java" ]]; then
        java -jar BacSeq-1.0.jar
    
    fi
fi
