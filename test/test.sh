for path in $(find "/Users/seemuali/NGSQC-/raw/miseq" -maxdepth 2 -mindepth 2 -type f -name "RTAComplete.txt" -exec dirname '{}' \;); do
	echo $path
done 
