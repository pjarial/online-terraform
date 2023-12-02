Terraform module for web Application

This configuration consists of separate modules which are later on called in main configuration file. 
The standalone modules are:
1. vpc
2. subnets
3. igw
4. natgw
5. sg
6. webserver
7. alb
8. asg

Each of the modules have their own configuration files:

vpc
- main.tf : Contains resource block for vpc
- variables.tf : Contains the variables declared in main.tf
- output.tf: Contains the output to output the vpc id.

subnets
- main.tf: Contains resource blocks for public and private subnets.
- variables.tf: Contains the variables declared in main.tf
- output.tf: Contains the output blocks to output the public and private subnet ids.

igw
- main.tf: Contains resource block for internet gateway.
- variables.tf: Contains the variables declared in main.tf
- output.tf: Contains the output block to output internet gateway id.

natgw
- main.tf: Contains the resource blocks for eip and natgw.
- variables.tf: Contains the variables declared in main.tf
- output.tf: Contains the output block to output the natgw id.

sg
- main.tf: Contains resource block for security group with ingress and egress rules.
- variables.tf: Contains the variables declared in main.tf
- output.tf: Contains the output block to output the security group id.

webserver
- data.tf: Contains data block to fetch the latest ubuntu ami.
- main.tf: Contains the resource block for ec2 instance using the ami in data.tf
- variables.tf: Contains the variables declared in main.tf
- output.tf: Contains the output block to output the instance ids.

alb
- main.tf: Contains the resource blocks for alb, sg for alb, alb listener, alb target group, alb target group attachment. 
- variables.tf: Contains the variables declared in main.tf
- output.tf: Contains the output block to output the alb id.

asg
- data.tf: Contains data block to fetch the latest ubuntu ami for launch configuration.
- main.tf: Contains resource block for launch configuration and autoscaling group.
- variables.tf: Contains data block to fetch the latest ubuntu ami.
- output.tf: Contains the output block to output the autoscaling group.

Apart from these modules, we have below configuration files which are used to create the above resources or can say to call the resources.

1. main.tf
The above modules are called in the below order to create of the resources mentioned in them. Variables are also passed wherever required. Some of the values have been fetched from the modules.
module vpc
module subnets
module igw
module natgw
module sg
module webserver
module alb
module asg

2. variables.tf
This configuration file has all the variables declared in the main configuration file whose default values need to be passed based on the variable type mentioned.

3. terraform.tfvars
This configuration has the actual default values for the variables which are declared in variables.tf file. based on the variable type, these values can be added and changed as per the configuration requirement.

4. provider.tf
This configuration has the terraform provider block with the version mentioned in it along with the provider configuration in a particular region which is declared as variable.

Remote State file location
The configuration is set to save the state file locally, However whatever the aws account used to deploy this configuration, the state file can be stored in its s3 bucket. Here is a block need to be added in that case to backend.tf file.

terraform {
    backend "s3" {
        bucket = "<bucket_name>"
        key = "<key_name>"
        region = "<aws_region>"
        profile = "default"
    }
}

Pre-Requisites:
1. AWS account
2. AWS access key
3. AWS secret access key

System setup for Terraform
1. Download the latest version of terraform for windows from https://developer.hashicorp.com/terraform/downloads 
2. Install terraform on windows
3. Place the executable folder in C:\windows\System32
4. Update the environment variables with above terraform path (C:\windows\System32)
5. Install aws cli 
6. Configure it with aws access keys and secret access keys:

aws configure
access key: xxxxxxxx
secret access key: xxxxxxxxx

Now the sustem is ready to deploy the configuration on your aws account.

Steps to deploy:
1. Go to "Terraform" folder location and run the below commands one by one:

terraform init    -- (to download the plugin/provider)
terraform validate ----- (to validate the terraform syntax)
terraform plan  --(to preview the resources to be created)
terraform plan -out=tfplan >tfplan.txt  --- (optional- to save the plan in text file)
terraform apply  --(to apply the configuration)
terraform destroy  --(to destroy the configuration)


