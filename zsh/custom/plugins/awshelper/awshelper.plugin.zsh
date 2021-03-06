## TODO: add scp support


function ec2conn() {
    AWS=/usr/local/bin/aws
    instanceID=$1
    dns=$($AWS ec2 describe-instances --output text --instance-id $instanceID --query "Reservations[0].Instances[0].PublicDnsName")
    if [ $? -ne 0 ]; then
        dns=$($AWS ec2 describe-instances --output text --instance-id $instanceID --query "Reservations[0].Instances[0].PublicDnsName")
    fi

    imageName=$(aws ec2 describe-images --output text --image-id $(aws ec2 describe-instances --instance-id ${instanceID} --output text --query "Reservations[0].Instances[0].ImageId") --query "Images[0].Name")


    # ami-b15905a7 - CoreOS-alpha-1437.0.0-hvm
    # ami-20631a36 - ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20170516
    # ami-c58c1dd3 - amzn-ami-hvm-2017.03.0.20170417-x86_64-gp2
    typeset -A imageToUser
    imageToUser=( "amzn" "ec2-user" "ubuntu" "ubuntu" "CoreOS" "core")

    for k in "${(@k)imageToUser}"; do
        if [[ $imageName == (#i)${k}(*) ]]; then
            user=$imageToUser[$k]
        fi
    done

    if [ -z "$user" ]; then
        echo "unable to detect username."
        return 1
    fi

    echo "${user}@${dns}"
    return 0
}


function ec2ssh() {
    host=$(ec2conn $1)
    if [ $? -ne 0 ]; then
        echo $host
        return $?
    fi
    shift
    if [[ $# > 0 ]]; then
        ssh -A -n ${host} $@
    else
        ssh -A ${host} $@
    fi
}
