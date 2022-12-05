# GCP-terraform
Terraform script for the GCP to create vpc with all configuration, instance and Storage bucket. 

Basics you need to know for terraform...

1. Once terraform in setup then create one folder and go inside them to wirte terraform script.

2. You can provide the name of terraform script file as per your choice but always end with .tf

3. Some imp commands used in terraform //
        "If you are not a root user use sudo befor every command..."

a. terraform init : Once you write script for resources then run this command in same directory where you write the script, This initialise terraform with sript and download requirement mention in code. Whithout ‘terraform init’ your working directory not initialize for terraform.

b. terraform fmt: Make proper formate of script which we write.

c. terraform validate: validate our script for any type of error or missing element.

d. terraform plan: This command shows the output of script without applying any changes, we get just overview of resources created after “terraform apply”.

e. terraform apply: This command apply the all changes in infra that we mentioned in script.

f. terraform destroy: This command destroy the all created resources from terraform apply.
