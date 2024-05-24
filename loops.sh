#!/bin/bash
myarray=(HS SYW SEGNO PRISM ADMIN)

for((i=0;i<${#myarray[@]};i++)){
        echo -n ${myarray[$i]}
        if [ ${myarray[$i]} == "HS" ]
        then
            echo " Parent"
        else
            echo " Child"
        fi
 }


a=0
while [ $a -lt ${#myarray[@]} ]
do
    echo ${myarray[$a]}
    ((++a))
done


myarray=(HS SYW SEGNO PRISM ADMIN)
for((i=0;i<${#myarray[@]};i++)){
                echo -n ${myarray[$i]}
                if [ ${myarray[$i]} == "HS" | ${myarray[$i]} == "ADMIN"]
                then
                    echo " Parent"
                elif [ ${myarray[$i]}=="SEGNO"]
                then
                    echo " FINANCE"
                else
                    echo " Child"
                fi
}
