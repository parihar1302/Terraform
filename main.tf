provider "aws" {
   region     = "us-east-2"
   access_key = "AKIA3KP2SFFPOZHK5TFEABHAI"
   secret_key = "H/oQe2a5CpFt6vGokkAyz5HP3BqYDEdsVfRCaSSk130A2"
   
}

resource "aws_instance" "terraformec2" {

    ami = "ami-0fb653ca2d3203ac1"  
    instance_type = "t2.micro" 
    key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]
	tags = {
      Name = "terraformNTS"
    }

  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/ubuntu/keys/aws/aws_key")
      timeout     = "4m"
   }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}


resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHaQLX43QPmo8Zil415aIgpbmGDj84cghccdA7TRBQstndv+x2qkTPCBz5sKGmgv49dHibywctkC+sfQ4MuBY1Kk79ydg8c8eWEqw1q4s4QQl6+YkK9h4UniTqTasCQJcoPonFrUHQ1VHfyb8MCsttRysL4w9i3YvwUgQpM1Z+31IWFxpHTyj4+dDx6zzlURkG1xZkibg3kYXu/r9uwH/hhHdT3VD7rM2lkKJf93RQqKKx4K/s7ocLVLrhyyS85wH6mZn4jk8HctoGtObD9w0W0U96/Vzm4uKwf2PyaYZ28ipJOb9cj2ITZ+BELoYjdvXJ16RYm+8lW1JBmbJyFU8/ root@ip-172-31-39-201"
}
