resource "aws_iam_role" "cloudwatch_role" {
  name = "${var.iam_role_name}"               # iam role name from var.tf "CloudWatchRole"

  assume_role_policy = file("EC2Module/iam-assumerole-policy.json")     ## Calling iam_assumerole_policy.json
}   
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Action = "sts:AssumeRole",
#       Effect = "Allow",
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       }
#     }]
#   })
# }

resource "aws_iam_policy" "cloudwatch_policy" {
  name        = "${var.iam_policy_name}"              #iam policy name from var.tf "CloudWatchPolicy"
  description = "Policy to allow CloudWatch, S3 & SSM access"
  policy      = file("EC2Module/cloudwatch-s3-ssm-policy.json")
}

resource "aws_iam_role_policy_attachment" "cloudwatch_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_policy.arn
  role       = aws_iam_role.cloudwatch_role.name
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name  = "${var.iam_instance_profile_name}"          # instance profile attach on ec2 "cwagent_ec2_instance_profile"
  role = aws_iam_role.cloudwatch_role.name
}