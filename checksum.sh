
function processJobs {
    
    echo "checking for jobs in $1 ..."

    for path in $(find "$1" -maxdepth 2 -mindepth 2 -type f -name "RTAComplete.txt" -exec dirname '{}' \;); do

        #extract run info from path
        instrumentType=$(basename $(dirname "$path"))
        run=$(basename "$path")

        #log
	    echo "path: $path"
        echo "run: $run"
        echo "instrumentType: $instrumentType"
    

        find $path -type f -exec md5 '{}' + | sort -k 2 | sed 's/ .*\// /'  > $run'_rawMD5.txt' 

        #move run to archive
        mv "$path" /Users/seemuali/NGSQC-/archive/"$instrumentType"  
       	find /Users/seemuali/NGSQC-/archive/"$instrumentType" -type f -exec md5 '{}' + | sort -k 2 | sed 's/ .*\// /'  > $run'_archiveMD5.txt' 

        check_date=$(date +"%d_%m_%y")
        diff $run'_rawMD5.txt' $run'_archiveMD5.txt' > /Users/seemuali/NGSQC-/archive/checksum/"$instrumentType"/$check_date'_'$run'.txt'  

        #find /Users/seemuali/NGSQC-/archive/"$instrumentType" -type f -exec md5 '{}' + | grep -vf raw_checksum.txt

        #change access permissions
        #chown -R transfer /Users/seemuali/NGSQC-/archive/"$instrumentType"/"$run"
        #chgrp -R transfer /Users/seemuali/NGSQC-/archive/"$instrumentType"/"$run"
        #chmod -R 755 /Users/seemuali/NGSQC-/archive/"$instrumentType"/"$run"

        #launch IlluminaQC for demultiplexing and QC
        #ssh transfer@10.59.210.245 "mkdir /data/archive/fastq/$run && cd /data/archive/fastq/$run && qsub -v sourceDir=/data/archive/$instrumentType/$run /data/diagnostics/pipelines/IlluminaQC/IlluminaQC-$version/1_IlluminaQC.sh"

    done

}

processJobs "/Users/seemuali/NGSQC-/raw/miseq"






#find /Users/seemuali/NGSQC-/archive/miseq -type f -exec md5 '{}' + | grep -vf raw_checksum.txt

#find /Users/seemuali/NGSQC-/raw/miseq -type f -exec md5 '{}' + >raw_checksum.txt
#https://unix.stackexchange.com/questions/392990/how-to-check-md5sum-between-two-directories 

#find "/Users/seemuali/NGSQC-/raw/miseq" -maxdepth 2 -mindepth 2 -type f -name "RTAComplete.txt" -exec dirname '{}' \;
#https://unix.stackexchange.com/questions/35832/how-do-i-get-the-md5-sum-of-a-directorys-contents-as-one-sum 
#https://unix.stackexchange.com/questions/228741/get-checksum-of-directory-on-bash

#find /Users/seemuali/NGSQC-/archive/miseq -type f -exec md5 '{}' + | grep -vf raw_checksum.txt

#$ find -s /Users/seemuali/NGSQC-/raw/miseq -type f -exec md5 {} \; | md5

#find /Users/seemuali/NGSQC-/raw/miseq -type f -exec md5 '{}' + | sort -k 2 | sed 's/ .*\// /' > test.txt

6d46a52f83962ee1a44d0d1c1986e7c9

6d46a52f83962ee1a44d0d1c1986e7c9


6d46a52f83962ee1a44d0d1c1986e7c9



