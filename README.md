# https://github.com/saketsharma1234/jifflenow_project

## Maintained by: [Saket Sharma](https://github.com/saketbsharma1234/jifflenow_project)

This is the Git repo of the [Docker "Jifflenow_project"](https://github.com/saketbsharma1234/jifflenow_project) for [`AWS_Provisioing`]

# Populate input.tfvars
Please update Access_key, Secret_key, AWS_Region, CIDR_BLCOK etc inside input.tfvars so, these variables can be used for provisioing

# Command needs to be executed

teraform init

terraform plan --var-file=input.tfvars

terraform apply --var-file=input.tfvars

# Output
Once executed it will provisioing VPC, with required subnets, gateway, route_table etc and provision one instance with ELB attached with created instance, the out put will provide your ELB hostname which can be used for accessing the helloword services.

#Bootstrapping
user-data.sh file needs to be used for bootstrapping which will bootstrap the instance during orchestration and install docker on the provisioned host
