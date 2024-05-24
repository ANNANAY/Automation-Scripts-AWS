#!/bin/bash
for i in `cat list`
do
    cat file_finder | ssh $i 'bash -'
done


File-Finder
FILE_PATH="/var/lib/cloudendure"
# -e will check the file regardless of the file-type | can also use -f but it will check only if it is a file.
if [ -e $FILE_PATH ];then
    # /dev/null will supress the output without supressing the error as it will direct the standard output to this location.
    sudo ps -ef |grep -i cloudendure |grep -v grep >/dev/null 
    exit_code=$?  
    if [ $exit_code -eq 0];then
        sudo /var/lib/cloudendure/stopAgent.sh
        sudo /var/lib/cloudendure/install_agent --remove
    elif [ $exit_code -eq 1];then
        sudo rm -rf /var/lib/cloudendure
    else
        echo "There is error in Process Check in $i"
    fi
else
    echo "CloudEndure does not exist"
fi



sudo ls /var/lib |grep cloudendure |grep -v grep

Process check
ps -ef |grep -i cloudendure |grep -v grep


/var/lib/cloudendure/stopAgent.sh
/var/lib/cloudendure/install_agent --remove

agr directory mili but process running nhi hai, tto rm directory
(rm -rf /var/lib/cloudendure)

else upr waali commands