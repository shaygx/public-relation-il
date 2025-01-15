# Set Ec2 Instances


resource "aws_instance" "wp-pr-prod" {
  subnet_id = "subnet-0508343e46877c829"
  iam_instance_profile = "ec2-instance-profile"
  vpc_security_group_ids = [aws_security_group.ssm-to-ec2.id, aws_security_group.ec2-to-tgw.id, aws_security_group.prtg-access.id, aws_security_group.alb-to-ec2.id]
  disable_api_termination = true
  count = 1
  ami           = "ami-095f8a7228d03f421"
  instance_type = "t3.large"
  #root_block_device {
  # volume_type = "gp3"
  #volume_size = 150
  #}
  #ebs_block_device {
  #  volume_type = "gp3"
  #  device_name = "/dev/sdb"
  #  volume_size = 500
#}

tags = {
  Name = "wp-pr-prod"
   }
  

metadata_options {
    http_tokens               = "required"   # Enforces IMDSv2
    http_put_response_hop_limit = 1          # Limit the number of network hops
    http_endpoint             = "enabled"    # Enable or disable the metadata service
  }
 }

