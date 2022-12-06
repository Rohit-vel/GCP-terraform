# Basics you need to know for terraform...

1. Once terraform is in setup then create one folder and go inside them to write a terraform script.

2. You can provide the name of terraform script file as per your choice but always end with .tf

3. Some imp commands used in terraform

"If you are not a root user use sudo before every command"

**a. terraform init:** Once you write script for resources then run this command in the same directory where you write the script, This initialises terraform with script and download requirement mentioned in code. Without ‘terraform init’ your working directory does not initialise for terraform.

**b. terraform fmt:** Make proper format of script which we write.

**c. terraform validate:** validate our script for any type of error or missing element.

**d. terraform plan:** This command shows the output of the script without applying any changes, we get just an overview of resources created after “terraform apply”.

**e. terraform apply:** This command applies all changes in infra that we mentioned in script.
 
 "We can also use '--auto-approve' flag after terraform apply and destroy command to direct action without asking to confirmation" 
 
**f. terraform destroy:** This command destroys all created resources from terraform apply.

**g. terraform workspace list:** To list all workspaces

**h. terraform workspace new any_name:** Create a new workspace and switches to them

**i. terraform workspace show:** Show current workspace

**j. terraform workspace select dev:**  Selet the workspace of name dev

**k. terraform workspace delete dev:** delete workspace of name name dev

### Before creating resources create one service account and download the key for provide credential of your account.

_Go to IAM console with navigation pan and click on service account._

![Screenshot from 2022-12-06 17-44-45](https://user-images.githubusercontent.com/104149165/205910996-4bc0275a-aa09-4693-b21c-efcf376ccb78.png)

_Now click on upper side for create new service account._

_once the account is created then on right side of service account name click on three dot's for manage key_

![Screenshot from 2022-12-06 17-44-55](https://user-images.githubusercontent.com/104149165/205911714-c4eb3aea-84c3-4e0a-8409-121b05a09b76.png)

_And inside the manage key create a new key and download the same for provide in main.tf for your account access by terraform._

![Screenshot from 2022-12-06 17-45-09](https://user-images.githubusercontent.com/104149165/205912438-364e24df-bc9c-4bec-ae51-e8eb90b4aac0.png)

### Now we can ready to create terraform script for GCP resources.

Once our script is done then run first command

terraform init _#Initiate present working dir with terraform_

see below is the output of the command

![Screenshot from 2022-12-06 18-18-16](https://user-images.githubusercontent.com/104149165/205917002-4c2e2eda-dd09-433e-ba4d-d68af1564804.png)

After terraform initialize run 

terraform fmt    _#This command make proper formate_

After that run 

terraform validate   _#This is validate the the script for any type of error and missing element._

![terraform_validate](https://user-images.githubusercontent.com/104149165/205918709-baaf6192-d68f-46bd-abfe-02bc14d0b311.png)

Now run the the command

terraform plan   _#This command shows the plan of action after terraform apply_

![Screenshot from 2022-12-06 18-29-26](https://user-images.githubusercontent.com/104149165/205919312-56303ea1-a121-4365-ba04-8cab10b597a5.png)

Now finaly we can apply the script with command 

terraform apply    _#Now we get the all mentioned resources in script to GCP_

Network VPC is created with subnet

![Screenshot from 2022-12-05 17-16-50](https://user-images.githubusercontent.com/104149165/205920438-cbf02fd9-e789-437e-a591-6f096a6708a2.png)

Firewall for port 80 and 22 is created with script

![Screenshot from 2022-12-05 17-17-05](https://user-images.githubusercontent.com/104149165/205920722-8df37e75-b0aa-4f90-ba2b-b0a9b946fbbd.png)

Compute engine is created and access successfully.

![Screenshot from 2022-12-05 17-21-11](https://user-images.githubusercontent.com/104149165/205921056-becfe609-b269-4e45-8233-df445570237f.png)


