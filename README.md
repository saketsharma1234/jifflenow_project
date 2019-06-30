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

# Bootstrapping
user-data.sh file can be used for bootstrapping which will bootstrap the instance during orchestration and install docker on the provisioned host or if you want, you can add it in your build pipeline along with your Dockerfile which will create container and execute it.

Once the process get completed you can access the helloworld Application using ELB URL.

Have not broken the terraform script in module because it was just one action and there is no point of deviing it futher, if you want it to be modified and broken in modules of VPC, ELB, EC2 that can also be performed.
