function ec2ssh() {
set +x
    dns=$(aws ec2 describe-instances --output text --instance-id $1 --query "Reservations[0].Instances[0].PublicDnsName")
    if [ $? -ne 0 ]; then
        dns=$(aws ec2 describe-instances --region us-west-1 --output text --instance-id $1 --query "Reservations[0].Instances[0].PublicDnsName")
    fi
    shift
    if [[ $# > 0 ]]; then
        ssh -n core@${dns} $@
    else
        ssh core@${dns} $@
    fi
}
