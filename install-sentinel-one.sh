#!/bin/bash
for i in `cat list`
do
    aws ssm send-command --document-name "arn:aws:ssm:us-east-2:257676781382:document/SentinelOne_Agent_Install_Linux" --targets '[{"Key":"InstanceIds","Values":["'$i'"]}]' --parameters '{}' --timeout-seconds 600 --max-concurrency "50" --max-errors "0" --region us-east-2
    echo "installed in $i "
done

sftp.stage.nextgen.shs.com

#!/bin/bash
for i in `cat list`
do
    SA="/opt/sentinelone"
    if [[ -d $SA ]] ; then
        echo "SentinelOne is installed properly and running in $i"
    else
        echo "SentinelOne is not properly installed or not running in $i"
    fi
done

        CPU=`grep -c ^processor /proc/cpuinfo`
        MEM=`free -m | awk '/^Mem:/{print $2}'`
        SPACE=`df "/opt" | awk 'END{print $4}'`
        if [[ $CPU -lt 2 ]]
        then
            echo "not enough CPU"
            exit 1
        else
            if [[ $MEM -lt 3880 ]]
            then
                echo "not enough Memory"
                exit 1
            else
                if [[ $SPACE -le 10000000 ]]
                then
                    echo "not enough Space"
                    exit 1
                else
                    EC2REGION=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/[a-z]$//'`
                    S1TOKEN=`aws secretsmanager get-secret-value --secret-id arn:aws:secretsmanager:us-east-2:257676781382:secret:hsarch/sentinelone/token-peQzlc`
                    aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/SentinelOne/SentinelAgent_linux_x86_64_v23_2_2_4.rpm . --region $EC2REGION
                    rpm -i --nodigest SentinelAgent_linux_x86_64_v23_2_2_4.rpm
                    /opt/sentinelone/bin/sentinelctl management token set $S1TOKEN
                    echo "SentinelOne Installed"
                    sentinelctl control start
                    echo "SentonelOne Service strated"
                    if sentinelctl control status |grep Enabled > /dev/null 2>&1 ; then
                       echo "SentinelOne is installed properly and running"
                        exit 0
                    else
                        echo "SentinelOne is not properly installed or not running"
                        exit 1
                    fi
                fi
            fi
        fi

#!/bin/bash
for i in `cat list`
do
    cat sa-install | ssh $i 'bash -'
done