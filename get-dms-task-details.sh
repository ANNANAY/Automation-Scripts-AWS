#!/bin/bash
echo "DMS-Task-Identifier,Account" > dms-task-op.csv
ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
TASK=$(aws dms describe-replication-tasks --query ReplicationTasks[*].ReplicationTaskIdentifier | tr -d '[]",')
for i in $TASK
do
    echo $i,$ACCOUNT >> dms-task-op.csv
done