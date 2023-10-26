// Module for Provisioning EC2 Instances

module "EC2_Instance" {
    source = "./EC2Module"
    key_pair_name              =  var.key_pair_name
    iam_role_name              =  var.iam_role_name
    iam_policy_name            =  var.iam_policy_name 
    iam_instance_profile_name  =  var.iam_instance_profile_name
    vpc_id                     =  var.vpc_id
    disable_api_termination    =  var.disable_api_termination
    index                      =  var.index
    instance_configurations    =  var.instance_configurations
}