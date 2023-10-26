# # output "vpc_id" {
# #   value = aws_vpc.custom_vpc.id
# # }

# # output "subnet_id" {
# #   value = aws_subnet.custom_subnet.id
# # }

# # output "security_group_id" {
# #   value = aws_security_group.instance_sg.id
# # }

# # output "instance_id" {                       ##for single ec2; worked
# #   value = aws_instance.linux_instance.id
# # }

# # output "ami_id" {                                 ## for single ec2; worked
# #     value = data.aws_ami.latest_amazon_linux.id
# # }

# # output "ami_ids" {
# #   description = "AMI IDs for each instance type"
# #   value = {
# #     for instance_type in var.instance_types :
# #     instance_type => data.aws_ami.selected_ami[lookup(var.instance_architecture, instance_type)].id
# #   }
# # }

# output "iam_role_arn" {
#   value = aws_iam_role.cloudwatch_role.arn
# }

# output "iam_policy_arn" {
#   value = aws_iam_policy.cloudwatch_policy.arn
# }

# output "iam_instance_profile_arn" {
#   value = aws_iam_instance_profile.ec2_profile.arn
# }

# output "key_name" {
# value = aws_key_pair.key_pair.key_name
# }

# output "ssh_keypair" {
# value = tls_private_key.key.private_key_pem
# sensitive = true
# }
# # output "private_key" {
# #   value       = data.tls_private_key.example_key.private_key_pem
# #   description = "Generated SSH private key"
# # }

# # output "public_key" {
# #   value       = data.tls_private_key.example_key.public_key_openssh
# #   description = "Generated SSH public key"
# # }


# # output "ssh_keypair" {
# # value = tls_private_key.key.private_key_pem
# # sensitive = true
# # }
# # output "key_name" {
# # value = aws_key_pair.key_pair.key_name
# # }
# # output "public_ip" {
# # value = aws_instance.ec2_public.public_ip
# # }
# # output "private_ip" {
# # value = aws_instance.ec2_private.private_ip
# # }