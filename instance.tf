resource "aws_instance" "terraformec2" {

    ami = "ami-0fb653ca2d3203ac1"
    instance_type = "t2.micro"
    key_name = "aws_key"
    security_groups = ["terraformSGNTS"]
        tags = {
      Name = "terraform"
    }

// S3 integration
//
//variable "s3_bucket_names" {
//  type = list
//  default = ["dev-bucket.app", "uat-bucket.app", "prod-bucket.app"]
//}
//
//
//resource "aws_s3_bucket" "rugged_buckets" {
//  count         = length(var.s3_bucket_names) //count will be 3
//  bucket        = var.s3_bucket_names[count.index]
//  acl           = "private"
//  region        = "us-east-2"
//  force_destroy = true
//}

  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/ubuntu/keys/aws/aws_key")
      timeout     = "4m"
   }
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDwcxjQ2eXO5zmKrVowWFwmmFPPkcpw6qIRbMFh3tylt0XbulsLCSzPP4pfXo/cbcbsC9P03GNwaIHDKEyMgNEuxdoYJ43dXINURzidzBWJq6tvvqlBndCPrlJlyN6pJtQVvhIfqq6s+HS3a+YRu4kg00tBSqVCL6kq2N6IUnLlFx1YEe9NrFxEgqhspVKxWmXZtJ3ftIfLy0QI3lfSigdJQ5FU9XwMOGRyH9l9fELeMkzwjDGFFDkwovFjeCMvsyX+2KD7CiUTicGhZmqtQ5U/hVFMUBfMrNHvRZ0HumzWxF7knsrIBjMbitzsmTeXBcGcj4S3v1kjoaTVOTCu0KU1 root@ip-172-31-12-40"
}
//==============================================================================================================================================
