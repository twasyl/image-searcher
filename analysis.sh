#!/bin/bash

ocr_result_file_basename="/tmp/output"
ocr_result_file="$ocr_result_file_basename.txt"

for file in $(find "$DATA_DIR" -type f -name "*.png"); do
	echo "[INFO] Processing $file"
	tesseract -c debug_file=/dev/null -l $LANGUAGE "$file" $ocr_result_file_basename

	for word in $SEARCHED_WORDS; do
		count=`grep -io -w "$word" $ocr_result_file | wc -w`
		
		if [ $count -gt 0 ]; then
			echo "[WARNING] Image '$file' contains the word '$word'"
		fi
	done

	echo ""
	rm -f $ocr_result_file
done