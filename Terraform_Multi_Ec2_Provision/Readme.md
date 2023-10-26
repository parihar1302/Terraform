## Terraform Provisioning Multiple EC2 Instances & Associating Elastic IPs to each instance.

## Userdata CloudWatch-Agent is Installating & Configuring into x86_64 & arm64 Architecture AMIs.

* Provising multiple EC2 instance with different configuration via Terraform
* Creating IAM Role & Policy attaching SSM, CloudWatch,S3 & etc.
* Attaching EC2 Instance Profile for each instance.
* Using Auto_generated/Dynamic assign AMI for each instance.
* Auto-generated/Dynamic .Pem keypair for accessing each instance.
* Public key will store inside Ec2 Instance & Private key on local system.
* Different EBS Storage size for each instance.
* Different Instance Type for 
* All Instance will have Uniqe name.
* Instance4 with different 'architecture'.
* Instance3 will be in different 'subnet(az)'.
* Creating Security Group under already existing VPC & associating with each instance.
* Userdata script will Install, Configure & Start CloudWatch-Agent at Boot level.

