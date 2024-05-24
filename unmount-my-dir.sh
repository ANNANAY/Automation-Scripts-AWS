#!/bin/bash
for i in `cat list`
do
    cat unmount-steps | ssh $i 'bash -'    
    echo "Unmounting done on $i"
done