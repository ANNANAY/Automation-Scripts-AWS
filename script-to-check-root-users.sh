#!/bin/bash
echo "Instance-IP,first,last" > opt-grp.csv
echo "Instance-IP,first,second,third,forth,fifth,sixth">output-1.csv
echo "Instance-IP,first,second,third,forth,fifth,sixth">output-2.csv
for i in `cat list`
do
    echo "$i" >>opt-grp.csv
    echo "$i" >> output-1.csv
    echo "$i" >> output-2.csv
    GROUP=`cat wheel-check | ssh "$i" 'bash -'`
    while IFS=':' read first second third last
    do
        echo "'$first','$last'">opt-grp.csv
    done <<< '$GROUP'
    SUDOERS=`cat sudoers-file | ssh "$i" 'bash -'`
    while IFS=' ' read first second third forth fifth sixth
    do
        if [ "$first" != "vulscan" ] && [ "$first" != "+unix-admins" ] && [ "$first" != "+ins-admins" ]; then
                echo "'$first','$second','$third','$forth','$fifth','$sixth'">>output-1.csv
        fi
    done <<< '$SUDOERS'
    SUDOERS1=`cat sudoers-file-1 | ssh "$i" 'bash -'`
    while IFS=' ' read first second third forth fifth sixth
    do
        if [ "$first" != "vulscan" ] && [ "$first" != "+unix-admins" ] && [ "$first" != "+ins-admins" ]; then
                echo "'$first','$second','$third','$forth','$fifth','$sixth'">>output-2.csv
        fi
    done <<< '$SUDOERS1'
done

#!/bin/bash
echo "Instance-IP,first,last" > opt-grp.csv
echo "Instance-IP,first,second,third,forth,fifth,sixth">output-1.csv
echo "Instance-IP,first,second,third,forth,fifth,sixth">output-2.csv
for i in `cat list`
do
    echo "$i"
    echo "$i" >>opt-grp.csv
    echo "$i" >> output-1.csv
    echo "$i" >> output-2.csv
    GROUP=`cat wheel-check | ssh "$i" 'bash -'`
    while IFS=':' read first second third last
    do
        echo "'$first','$last'">opt-grp.csv
    done <<< $GROUP
    echo "GROUP DONE FOR '$i'"
    SUDOERS=`cat sudoers-file | ssh -tt "$i" 'bash -'`
    while IFS=' ' read first second third forth fifth sixth
    do
        if [ "$first" != "vulscan" ] && [ "$first" != "+unix-admins" ] && [ "$first" != "+ins-admins" ]; then
            echo "'$first','$second','$third','$forth','$fifth','$sixth'">>output-1.csv
        fi
    done <<< $SUDOERS
    echo "SUDOERS DONE FOR '$i'"
    SUDOERS1=`cat sudoers-file-1 | ssh -tt "$i" 'bash -'`
    while IFS=' ' read first second third forth fifth sixth
    do
        if [ "$first" != "vulscan" ] && [ "$first" != "+unix-admins" ] && [ "$first" != "+ins-admins" ]; then
            echo "'$first','$second','$third','$forth','$fifth','$sixth'">>output-2.csv
        fi
    done <<< '$SUDOERS1'
    echo "SUDOERS2 DONE FOR '$i'"
done


wheel-check
#!/bin/bash
cat /etc/group | egrep "root|wheel" 


sudoers file
#!/bin/bash
 |



usr-su
#!/bin/bash
echo "first,second,third,forth,fifth,sixth" > output-2.csv
cat /etc/sudoers | grep “/usr/bin/su“ 
