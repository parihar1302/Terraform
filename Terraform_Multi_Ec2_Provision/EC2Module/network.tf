# Use an existing VPC by specifying its ID from variables

data "aws_vpc" "vpc" {
  id = var.vpc_id
}


## Creating Security Group under existing VPC

resource "aws_security_group" "instance_sg" {
  name = "SG-CWAgent-0${var.index}"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   ## SSH Port Open to ALL {Incoming traffic}
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   ## HTTPS Port Open to ALL {Incoming traffic}
  }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   ## MYSQL Port Open to ALL {Incoming traffic}
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]   ## SSH Port Open to ALL {Outgoing traffic}
  }

  tags = {
    Owner = "Terraform.Abhishek"
  }
}
