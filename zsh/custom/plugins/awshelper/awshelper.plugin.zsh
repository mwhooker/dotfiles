function ec2ssh() {
    dns=$(aws ec2 describe-instances --output text --instance-id $1 --query "Reservations[0].Instances[0].PublicDnsName")
    shift
    if [[ $# > 0 ]]; then
        ssh -n core@${dns} $@
    else
        ssh core@${dns} $@
    fi
}
