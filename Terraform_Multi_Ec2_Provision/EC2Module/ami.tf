## Dynamic/Auto-Assign ami using here, instead off hardcoding ami id
## Using Amazon Linux AMI below

data "aws_ami" "latest_amazon_linux" {
#  for_each = { for inst_type in var.instance_type : inst_type => inst_type }
  for_each = var.instance_configurations
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = [each.value.architecture]
   }

   filter {
     name   = "root-device-type"
     values = ["ebs"]
   }

   owners = ["amazon"]
}

####################################################################################

### This is testing but below is worked each.value

# data "aws_ami" "latest_amazon_linux" {
#   most_recent = true

#   filter {
# #    name   = "name"                           ## for one ec2 instance WORKED
#     name   = "architecture"
# #    values = ["amzn2-ami-hvm-*-x86_64-gp2"]     ## for one ec2 instance  WORKED
#     values = ["x86_64", "arm64"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   owners = ["amazon"]
# }
##############################################################################

