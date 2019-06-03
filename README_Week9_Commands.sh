#!/bin/bash/sh

echo '###########'
echo "loading....."

#Removes lines with ';;', ';', 'NA', and lines with no taxonomy provided, denoted by a blank line. Each command will print output into a new text file.

grep -v ";;" OriginalData.txt > NewData.txt 
grep -v ";$" NewData.txt  > NewData2.txt
grep -v "NA" NewData2.txt > NewData3.txt
grep -v "sp." NewData3.txt > NewData4.txt

#Creates tabs in between the taxonomy categories of the remaining data. Prints to new text file.

sed 's/;/\t/g' NewData4.txt | sed 's/\.\./\t/g' > NewData5.txt

#Gives Plant Species name. Prints to new text file.

awk '{ print $NF }' NewData5.txt  > NewData6.txt

#Gives the unique Species names. Prints to new text file.

sort -uk 1,1 NewData6.txt > NewData7.txt

#Gives only the species name.. Deletes any numerical values. Prints to new text file.

grep -v "[0-9]" NewData7.txt > NewData8.txt

#Indicates all commands have been completed.

echo "done"

