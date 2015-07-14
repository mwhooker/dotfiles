function ec2ssh() {
dns=$(aws ec2 describe-instances --output text --instance-id $1 --query "Reservations[0].Instances[0].PublicDnsName")
ssh core@${dns}
}
