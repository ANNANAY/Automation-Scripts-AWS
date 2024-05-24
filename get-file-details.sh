#!/bin/bash
cat file-command | ssh 172.30.33.232 'bash -' > al2-FSx.txt
cat file-command | ssh 172.30.34.184 'bash -' > al2-C06.txt
echo "Done for both"

sudo su -
cat /etc/nsswitch.conf
cat /etc/sssd/sssd.conf
cat /etc/pam.d/system-auth-shc
cat /etc/auto.home
diff -wBby al2-FSx al2-on-root > diff-al2-C06-FSx-Root
