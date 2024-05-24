read -sp "Enter The VPC : " VPC_ID
 
read -sp "Enter The Region : " REGION
 
if [ "$REGION" = "us-east-1" ]; then
    PL_ID="pl-080379572bd90fb70"
elif [ "$REGION" = "us-east-2" ]; then
    PL_ID="pl-058f1e9648b959306"
else
    echo "Invalid region provided"
    exit 1
fi
 
NEW_SG_ID=`aws ec2 create-security-group --group-name shs-dba-jump-servers-sg --description "Allows traffic from RDS Jump Server" --vpc-id $VPC_ID --output text`
 
# aws ec2 authorize-security-group-egress --group-id $NEW_SG_ID --ip-permissions IpProtocol=all,IpRanges='[{CidrIp=0.0.0.0/0}]'
aws ec2 authorize-security-group-ingress --group-id $NEW_SG_ID --ip-permissions IpProtocol=all,PrefixListIds='[{PrefixListId= "'"$PL_ID"'" }]'

## pl-080379572bd90fb70	-- shs-dba-jump-servers-pl -- NV
## pl-058f1e9648b959306	-- shs-dba-jump-servers-pl -- OH


