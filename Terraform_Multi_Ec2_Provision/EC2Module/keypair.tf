// After that, write the private key to a local file and upload the public key to AWS
resource "tls_private_key" "key" {
algorithm = "RSA"
}

resource "local_file" "private_key" {
filename          =  "${var.key_pair_name}.pem"       #"TEST.pem"
sensitive_content = tls_private_key.key.private_key_pem
file_permission   = "0400"
}

resource "aws_key_pair" "key_pair" {
key_name   =  "${var.key_pair_name}"      #"TEST"
public_key = tls_private_key.key.public_key_openssh
}

# # Generate an SSH key pair
# resource "tls_private_key" "ec2_keypair" {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# # Generate an SSH key pair
# resource "aws_key_pair" "example_keypair" {
#   key_name_prefix = "${var.ami_key_pair_name}"         #"example-keypair"  # Prefix for the key pair name

#   # Generate a new SSH key pair
#   public_key = tls_private_key.example_keypair.public_key_openssh
# }

