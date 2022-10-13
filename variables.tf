#Variable.tf = will store variable which you can call from main.tf. It provides you flexibility to define the value & modify it base on requirement.

#vi variablle.tf         

variable "region" {
  default = "us-east-1"
}
#variable is for instance type
variable "instance_type" {
   description = "Instance type t2.micro"    ## description
   type        = string                      ## number, string, boolean, float, list, map
   default     = "t2.micro"                  ##variable default value which you can modify
}

variable "ami_id" {
  default = "ami-035b3c7efe6d061d5"
}

variable "tag" {
  default = "t2.micro"
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
   region     = "${var.region}"
   access_key = "AKIA3KP2SFFPOZHK5TFEABHAI"     
   secret_key = "H/oQe2a5CpFt6vGokkAyz5HP3BqYDEdsVfRCaSSk130A2"
   
}

resource "aws_instance" "terraformec2" {

    ami_id                     = "${var.ami_id}"
    instance_type              = "${var.instance_type}"
    tag                        = "${var.tag}"
    key_name= "aws_key"
    }
}
