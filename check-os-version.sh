OS = $(cat /etc/system-release)
if [ "$OS" == "CentOS release 6.10 (Final)" ];
then
    return "C06"
elif [ "$OS" == "Amazon Linux release 2 (Karoo)" ];
then
    return "AL2"
elif [ "$OS" == "CentOS Linux release 7.8.2003 (Core)" ];
then
    return "C07"
else
    echo "Else"
fi