match-script
#!/bin/bash
echo "Host-name,Same-or-Different">>opt-m.csv
for i in `cat list`
do
        echo $i >>opt-m.csv
        file1="./amazon-cloudwatch-agent.json"
        cat ssh-find | ssh $i 'bash -' | diff -wbBq "$file1" -
        exit_code=$?
        if [ $exit_code -eq 0 ];then
                echo -n " Same" >>opt-m.csv
        elif [ $exit_code -eq 1 ];then
                echo -n " Different">>opt-m.csv
        else
                echo "Error in finding file" $i
        fi
done


ssh-find
#!/bin/bash
findfile=`ls /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/`
cat "$findfile"


rename-file
#!/bin/bash
for i in `cat t-list`
do
findfile=`ls /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/`
newname=`awk`

done

