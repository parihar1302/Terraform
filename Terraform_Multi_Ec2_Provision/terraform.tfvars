// Assigning values to variables declared in variable.tf

 key_pair_name              =  "cwagent-ec2-keypair-autogenerated"
 iam_role_name              =  "cwagent-iam-role"
 iam_policy_name            =  "cwagent-iam-policy"
 iam_instance_profile_name  =  "cwagent-ec2-instance-profile"
 vpc_id                     =  "vpc-08fe51c30800caa79"
 disable_api_termination    =  true
 index                      =  1

 instance_configurations    = {
    instance1                 = {
      name                    = "Web-Server"
      instance_type           = "c6g.large"
      ebs_volume_size         = 15
      architecture            = "arm64"
      subnet_id               = "subnet-011e5fc6cf48d0b75"
    },
    instance2                 = {
      name                    = "App-Server-a"
      instance_type           = "a1.medium"
      ebs_volume_size         = 20
      architecture            = "arm64"
      subnet_id               = "subnet-011e5fc6cf48d0b75"     ## Availability Zone-> us-east-1a
    },
    instance3                 = {
      name                    = "App-Server-b"
      instance_type           = "a1.medium"
      ebs_volume_size         = 20
      architecture            = "arm64"
      subnet_id               = "subnet-037fc1f189ec2bee3"     ## Availability Zone-> us-east-1b {For Disastor Recovery, keeping both application instance in different regions}
    },
    instance4                 = {
      name                    = "DB-Server"
      instance_type           = "t2.micro"
      ebs_volume_size         = 25
      architecture            = "x86_64"                       ## Architecture x86_64 using
      subnet_id               = "subnet-011e5fc6cf48d0b75"
      
    }
 }