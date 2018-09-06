# Readme
## Create Wordpress by Terraform and docker
This Terraform scripts are for creating a wordpress environment on AWS EC2. It will accomplished by the 3 docker images as below.
- Nginx
- Wordpress official php-fpm
- mariadb

It will build:
- 1 VPC with 2 public subnets and 2 private subnets.
- 2 security groups for admin and internet connection.
- 1 instance with docker to run the wordpress service.
- import the public key for instance to ssh.

## Usage
1. change the var.tf make sure your ip and ssh key are right.
2. make sure the providers.tf setting is corrected.
3. execute `terraform init` then `terraform apply`

## TO-DO
- [ ] add rds for option DB.
- [ ] automate the Wordpress installation without web gui.
- [ ] add variable for the Wordpress docker image version.
