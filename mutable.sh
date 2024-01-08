#ENV = $1

#APP_VERSION = $2

#COMPONENT = $3
env
 aws ec2 describe-instances --filters "Name=tag:Name,Values=${ENV}-${COMPONENT}" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text >inv

SSH_PASSWORD=$(aws ssm get-parameter --name ${ssh.password} --with-decryption --query 'Parameter.Value' --output text)

 aws ssm put-parameter  --name "${ENV}.${COMPONENT}.app_version" --value "${APP_VERSION}" --type "String" --overwrite

ansible-playbook -i inv expense.yml -e role_name=${COMPONENT}  -e env=${ENV} -e ansible_user=centos -e ansible_password=${SSH_PASSWORD} -e version = ${APP_VERSION}