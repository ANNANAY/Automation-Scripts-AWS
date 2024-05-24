
ssh-copy
#!/bin/bash
for i in `cat list`
do
        echo "Working on $i"
        cat ssh-m-r | ssh $i 'bash -'
        echo "File moved and replaced"
        scp amazon-cloudwatch-agent.json $i:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/
        echo "Correct File copied"
done



ssh-m-r
#!/bin/bash
cd /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d
file1=$(find . -type f -name "default" -o -name "file_amazon-cloudwatch-agent.json" | sed 's/^..//')
echo "Found File ${file1}"
mv "$file1" /opt/aws/amazon-cloudwatch-agent/etc/"${file1}-old"
echo "Renamed file to ${file1}-old"



file1=$(find . -type f -name "*.txt" | sed 's/^..//')

mv "$file1" "$file1"_old
mv "${file1}-old" /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d
