#!/bin/bash
for i in `cat policy-list`
do
    aws iam delete-policy --policy-arn $i
done