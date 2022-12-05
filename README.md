Basics you need to know for terraform...

1. Once terraform is in setup then create one folder and go inside them to write a terraform script.

2. You can provide the name of terraform script file as per your choice but always end with .tf

3. Some imp commands used in terraform

"If you are not a root user use sudo before every command"

a. terraform init : Once you write script for resources then run this command in the same directory where you write the script, This initialises terraform with script and download requirement mentioned in code. Without ‘terraform init’ your working directory does not initialise for terraform.

b. terraform fmt: Make proper format of script which we write.

c. terraform validate: validate our script for any type of error or missing element.

d. terraform plan: This command shows the output of the script without applying any changes, we get just an overview of resources created after “terraform apply”.

e. terraform apply: This command applies all changes in infra that we mentioned in script.

f. terraform destroy: This command destroys all created resources from terraform apply.

