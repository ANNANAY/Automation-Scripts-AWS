#!/bin/bash
set -x
NSSWITCH="/etc/nsswitch.conf"
SSSD="/etc/sssd/sssd.conf"
PAMD="/etc/pam.d/system-auth-shc"
AUTOHOME="/etc/auto.home"
AUTOMASTER="/etc/auto.master"
if [ -f $NSSWITCH ];
then
    sudo cp $NSSWITCH "$NSSWITCH.$(date +"%Y%m%d_%H:%M:%S")"
    if [[ $? -eq 0 ]]
    then
            echo "File renamed"
    else
        echo "Error in File renaming for NSSWITCH. Code terminated "
        exit 1
    fi
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/nsswitch.conf /etc/nsswitch.conf
    if [[ $? -eq 0 ]]
    then
                echo "File copied from S3"
    else
        echo "Error in File coping from S3 for NSSWITCH. Code terminated"
        exit 1
    fi
    echo "Done with NSSWITCH" 
else
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/nsswitch.conf /etc/nsswitch.conf
    if [[ $? -eq 0 ]]
    then
                echo "File copied from S3"
    else
        echo "Error in File coping from S3 for NSSWITCH. Code terminated"
        exit 1
    fi
    echo "Done with NSSWITCH"
fi

if [ -f $SSSD ];
then
    sudo cp $SSSD "$SSSD.$(date +"%Y%m%d_%H:%M:%S")"
    if [[ $? -eq 0 ]]
    then
                echo "File renamed"
    else
        echo "Error in File renaming for SSSD. Code terminated "
        exit 1
    fi
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/sssd.conf /etc/sssd/sssd.conf
    if [[ $? -eq 0 ]]
    then
                echo "File copied from S3"
    else
        echo "Error in File coping from S3 for SSSD. Code terminated"
        exit 1
    fi
    echo "Done with SSSD"
else
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/sssd.conf /etc/sssd/sssd.conf
    if [[ $? -eq 0 ]]
    then
                echo "File copied from S3"
    else
        echo "Error in File coping from S3 for SSSD. Code terminated"
        exit 1
    fi
    echo "Done with SSSD"
fi

if [ -f $PAMD ];
then
    sudo cp $PAMD "$PAMD.$(date +"%Y%m%d_%H:%M:%S")"
    if [[ $? -eq 0 ]]
    then
                echo "File renamed"
    else
        echo "Error in File renaming for PAM.D. Code terminated "
        exit 1
    fi
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/system-auth-shc /etc/pam.d/system-auth-shc
    if [[ $? -eq 0 ]]
    then
                echo "File copied from S3"
    else
        echo "Error in File coping from S3 for PAM.D. Code terminated"
        exit 1
    fi
    echo "Done with PAMD"
else
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/system-auth-shc /etc/pam.d/system-auth-shc
    if [[ $? -eq 0 ]]
    then
        echo "File copied from S3"
    else
        echo "Error in File coping from S3 for PAM.D. Code terminated"
        exit 1
    fi
    echo "File copied from S3"
    echo "Done with PAMD"
fi

if [ -f $AUTOHOME ];
then
    sudo cp $AUTOHOME "$AUTOHOME.$(date +"%Y%m%d_%H:%M:%S")"
    if [[ $? -eq 0 ]]
    then
                echo "File renamed"
    else
        echo "Error in File renaming for auto.HOME. Code terminated "
        exit 1
    fi
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/auto.home /etc/auto.home
    if [[ $? -eq 0 ]]
    then
                echo "File copied from S3"
    else
        echo "Error in File coping from S3 for Auto.home . Code terminated"
        exit 1
    fi
    echo "File copied from S3"
    echo "Done with AUTOHOME"
else
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/auto.home /etc/auto.home
    echo "File copied from S3"
    if [[ $? -eq 0 ]]
    then
        echo "File copied from S3"
    else
        echo "Error in File coping from S3 for auto.home. Code terminated"
        exit 1
    fi
    echo "Done with AUTOHOME"
fi
if [ -f $AUTOMASTER ];
then
    sudo cp $AUTOMASTER "$AUTOMASTER.$(date +"%Y%m%d_%H:%M:%S")"
    if [[ $? -eq 0 ]]
    then
                echo "File renamed"
    else
        echo "Error in File renaming for auto.master. Code terminated "
        exit 1
    fi
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/auto.master /etc/auto.master
    if [[ $? -eq 0 ]]
    then
             echo "File copied from S3"
    else
        echo "Error in File coping from S3 for Auto.master . Code terminated"
        exit 1
    fi
    echo "File copied from S3"
    echo "Done with AUTOMASTER"
else
    sudo /usr/local/bin/aws s3 cp s3://hsarch-artifactory-257676781382-us-east-2/Build_Files/auto.master /etc/auto.master
    echo "File copied from S3"
    if [[ $? -eq 0 ]]
    then
                echo "File copied from S3"
    else
        echo "Error in File coping from S3 for auto.master. Code terminated"
        exit 1
    fi
    echo "Done with AUTOMASTER"
fi
echo "All files updated"
sudo chmod 600 /etc/sssd/sssd.conf
OS=$(cat /etc/system-release)
if [ "$OS" == "CentOS release 6.10 (Final)" ];
then
    AUTOFS=$( rpm -qa | grep autofs | wc -l )
    if [[ $AUTOFS -eq 1 ]];
    then
        sudo yum install -y autofs
        sudo service autofs start
        sudo chkconfig autofs on
        echo "Autofs installed successfully"
    elif [[ $AUTOFS -gt 1 ]];
    then
        STATUSAFS=$(systemctl status autofs | grep Active | awk '{print $2}')
        if [ "STATUSAFS" != "Active" ];
        then
            sudo service autofs enable
            sudo service autofs start 
        fi
    fi
elif [ "$OS" == "Amazon Linux release 2 (Karoo)" ];
then
    AUTOFS=$( rpm -qa | grep autofs | wc -l )
    if [[ $AUTOFS -eq 1 ]];
    then       
        sudo yum install -y autofs
        sudo systemctl start autofs
        sudo systemctl enable autofs
        echo "Autofs installed successfully"
    elif [[ $AUTOFS -gt 1 ]];
    then
        STATUSAFS=$(systemctl status autofs | grep Active | awk '{print $2}')
        if [ "STATUSAFS" != "Active" ];
        then
            sudo systemctl enable autofs
            sudo systemctl start autofs
        fi
    fi
elif [ "$OS" == "CentOS Linux release 7.8.2003 (Core)" ];
then
    AUTOFS=$( rpm -qa | grep autofs | wc -l )
    if [[ $AUTOFS -eq 1 ]];
    then       
        sudo yum install -y autofs
        sudo systemctl start autofs
        sudo systemctl enable autofs
        echo "Autofs installed successfully"
    elif [[ $AUTOFS -gt 1 ]];
    then
        STATUSAFS=$(systemctl status autofs | grep Active | awk '{print $2}')
        if [ "STATUSAFS" != "Active" ];
        then
            sudo systemctl enable autofs
            sudo systemctl start autofs            
        fi
    fi
fi
sudo service sssd restart
echo "Code finished"