# AWS EKS Assessment

Remediation Use case problem Statement:
* Remediation Resource: AWS EKS
* Resource metadata / parameter / factor: 
  1) Logging Enabled,
  2) added security group,
  3) Envelope encryption using KMS, 
  4) Installed latest version of Kubernetes and 
  5) Amazon EKS configuration changes are monitored. 
    
* Roles and Permissions required for the IAM user to execute the remediation.
    *   Developer permission Read/Write to EKS/KMS
    
How to setup the infrastructure for testing
* Provide AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY in eksctl.sh

How to run the script? or How to execute the command?
* In Mac/Linux terminals type ./eksctl.sh and it will execute the commands

Note: It will execute all the commands declared in eksctl.sh file to ignore some commands you can remove/comment out 
some code.
You can run the commands individually also based on the requirement

Details about the variables/parameters used
* In varibles.tf passing the vpc_id and security_group_id

Add file/folder details - names and purpose.
* eksctl.sh -> shell file used to execute commands
* cluster-1.17.yaml -> Yaml file used to declare the infrastructure of eks 
* variables.tf -> Terraform file used to declare the variables

<h3> Any relevant reference can be added to the readme.md</h3>
* For more details about eksctl visit: https://eksctl.io/
  