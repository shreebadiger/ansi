#ENV = $1

#APP_VERSION = $2

#COMPONENT = $3
env
 aws ec2 describe-instances --filters "Name=tag:Name,Values=${ENV}-${COMPONENT}" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text >inv

 aws ssm put-parameter  --name "${ENV}.${COMPONENT}.app_version"  --type "String"  --value "${APP_VERSION}"  --overwrite

ansible-playbook -i inv expense.yml -e role_name = ${COMPONENT}  -e env = ${ENV} -e ansible_user = centos -e ansible_password = DevOps321 -e version = ${APP_VERSION}