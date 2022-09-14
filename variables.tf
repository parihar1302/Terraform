#Variable.tf = will store variable which you can call from main.tf.

#vi variablle.tf         
#variable is for instance type
variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = "t2.micro"
}

# now variable is for s3
variable "s3_bucket_names" {
  type = list
  default = ["bucket1.app", 
             "bucket2.app", 
             "bucket3.app" 
            ]
}


### Below example shows variable instance type:-
---------------------------------------------------

#vi main.tf
provider "aws" {                                            
   region     = "us-east-2"
   access_key = "AKIA3KP2SFFPOZHK5TFEABHAI"     
   secret_key = "H/oQe2a5CpFt6vGokkAyz5HP3BqYDEdsVfRCaSSk130A2"
   
}

resource "aws_instance" "terraformec2" {

    ami = "ami-0fb653ca2d3203ac1"  
    instance_type = var.instance_type 
    key_name= "aws_key"
  	tags = {
       Name = "terraformNTS"
    }
}
