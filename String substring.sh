STATUSCHECK=$(aws iam list-access-keys --user-name shs-ns-notification-app --query AccessKeyMetadata[*].Status --output text)
    if [ "$STATUSCHECK" == "Active"];then; echo "Key Active";else; echo "Key inactive" 
    if [[ "$STATUSCHECK" == *"Active"* ]]
    then
        echo "Key Active"
    else 
        echo "Key inactive"
    fi 
 SC="Active Inactive"