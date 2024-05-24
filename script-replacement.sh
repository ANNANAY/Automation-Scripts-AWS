file-replace
#!/bin/bash
for i in `cat list`
do
        cat move-replace-file | ssh $i 'bash -'
        scp amazon-cloudwatch-agent.json $i:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/
done


move-replace-file
#!/bin/bash
file1=`ls /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/`
sudo mv "$file1" /opt/aws/amazon-cloudwatch-agent/etc/"${file1}-old"





