#!/bin/bash
for i in `cat temp-list`
do
    echo "Copying in server $i"

done





Creating test file - ssh-test
cat ssh-cmd | ssh $i 'bash -'






for i in `cat t-list`
do
echo "Deleting from $i"
cat ssh-remove | ssh $i 'bash-'
done


ssh-remove
cd test
cd test2.a
rm correct-text.txt



1. Create a new file at main location
2. mv older file to parent
3. Rename the older file

File copy

ssh-copy
#!/bin/bash
for i in `cat t-list`
do
        echo "Working on $i"
        cat ssh-m-r | ssh $i 'bash -'
        echo "File moved and replaced"
        scp correct-test $i:/home/shs-admin/test/test2.a/
        echo "Correct File copied"
done



ssh-m-r
#!/bin/bash
cd test
cd test2.a
file1=$(find . -type f -name "*.txt" | sed 's/^..//')
echo "Found File ${file1}"
mv "$file1" ../"${file1}-old"
echo "Renamed file to ${file1}-old"
echo "File moved to parent directory"


