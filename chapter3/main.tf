# provider "aws" {
#   region = "ap-northeast-1"
# }

module "web_server" {
  source        = "./http_server"
  instance_type = "t3.micro"
}

# data "aws_ami" "recent_amazon_linux_2" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
#   }

#   filter {
#     name   = "state"
#     values = ["available"]
#   }
# }

# locals {
#   example_instance_type = "t3.micro"
# }

# resource "aws_instance" "example" {
#   ami                    = data.aws_ami.recent_amazon_linux_2.image_id
#   instance_type          = local.example_instance_type
#   vpc_security_group_ids = [aws_security_group.example_ec2.id]
#   user_data              = file("./chapter3/user_data.sh")
# }

output "public_dns" {
  value = module.web_server.public_dns
}
