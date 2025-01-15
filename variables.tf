variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.5.0.0/16"
}

variable "vpc_id" {
  description = "vpc-pr-prod"
  type        = string
  default     = ""
}


variable "vpc_name" {
   description = "vpc-pr-prod"
   type        = string
  default     = "vpc-pr-prod"
}

variable "aws_region" {
  description = "AWS region for the VPC"
  type        = string
  default     = "il-central-1"
}

variable "tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {
  Environment = "Prod"
  }
}

#variable "igw_name" {
#  description = "The name for the Internet Gateway"
#  type        = string
#}


variable "subnet_private_cidrs" {
        type = list(string)
        description = "private subnets"
        default = ["10.5.1.0/24", "10.5.2.0/24"]
}

variable "subnet_private_names" {
  type    = list(string)
  default = ["subnet-pr-prod-private-az1", "subnet-pr-prod-private-az2"]  # Define custom names
}

variable "private_availability_zones" {
        type = list(string)
        description = "AZS"
        default = ["il-central-1a", "il-central-1b"]
}


variable "subnet_private_tags" {
  description = "Tags for the subnets"
  type        = map(string)
  default     = {
    Environment = "Prod"
  }
}

variable "subnet_public_cidrs" {
        type = list(string)
        description = "public subnets"
        default = ["10.5.3.0/24", "10.5.4.0/24"]
}

variable "subnet_public_names" {
  type    = list(string)
  default = ["subnet-pr-prod-public-az1", "subnet-pr-prod-public-az2"]  # Define custom names
}

variable "public_availability_zones" {
        type = list(string)
        description = "AZS"
        default = ["il-central-1a", "il-central-1b"]
}


variable "subnet_public_tags" {
  description = "Tags for the subnets"
  type        = map(string)
  default     = {
    Environment = "Prod"
 }
}


variable "tgw_id" {
	description = "TGW ID"
	type        = string
	default = "tgw-0430826c231550bf5"
}

#variable "transit_gateway_vpc_attachment" {
#  description = "Details for the Transit Gateway VPC attachment"
#  type        = map(any) # Adjust type based on your requirements
#}


variable "subnet_tgwa_cidrs" {
        type = list(string)
        description = "tgwa subnets"
        default = ["10.5.5.0/24", "10.5.6.0/24"]
}

variable "subnet_tgwa_names" {
  type    = list(string)
  default = ["subnet-pr-prod-tgwa-az1", "subnet-pr-prod-tgwa-az2"]  # Define custom names
}

variable "tgwa_availability_zones" {
        type = list(string)
        description = "AZS"
        default = ["il-central-1a", "il-central-1b"]
}


variable "subnet_tgwa_tags" {
  description = "Tags for the subnets"
  type        = map(string)
  default     = {
    Environment = "Prod"
 }
}



#variable "route_table_id" {
#  description = "Tags to apply to the new route table"
#  type        = map(string)
#}


#variable "route_table_names" {
# description = "List of route table names"
#  type        = list(string)
#}

#variable "route_table_subnet_map" {
#  description = "A map of route table names to their associated subnet IDs"
#  type        = map(list(string))
#}



variable "role_name" {
   description = "The name of the SSM IAM role"
   type        = string
   default     = "ssm-ec2-role"
}




variable "assume_role_principal" {
   description = "The AWS service that will assume this role"
   type        = string
   default     = "ec2.amazonaws.com"  # Typically, this is EC2 for SSM roles.
 }

variable "instance_profile_name" {
   description = "The name of the instance profile to attach to EC2 instances"
   type        = string
   default     = "ec2-instance-profile"
 }

variable "max_session_duration" {
  description = "The maximum session duration for the IAM role in seconds"
  type        = number
  default     = 14400  # Default to 4 hour
}

variable "security_group_ids" {
  type      =  string
  default   = "sg-01e9d9731e2e016d5"
}

variable "security_group_name" {
  description = "ssm-to-ec2"
  type        = string
  default     = "ssm-to-ec2"
}

variable "ingress_rules_ssm_to_ec2" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
 }))
default = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["10.5.0.0/16"]
    }
  ]

}

variable "egress_rules_ssm_to_ec2" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
     to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = ["10.5.0.0/16"]
    }
  ]
}


variable "security_group_to_tgw" {
  description = "ec2-to-tgw"
  type        = string
  default     = "ec2-to-tgw"
}

variable "ingress_rules-to-tgw" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
 }))
default = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

}


variable "security_group_to_alb" {
  description = "ec2-to-alb"
  type        = string
  default     = "ec2-to-alb"
}

variable "ingress_rules-to-alb" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
 }))
default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
    }
  ]

}


variable "egress_rules-to-tgw" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
     to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}


variable "security-group-prtg-access" {
  description = "prtg-access"
  type        = string
  default     = "prtg-access"
}

variable "ingress-rules-to-prtg-access" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
 }))
default = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["10.10.20.20/32"]
    },

    {
      from_port   = 161
      to_port     = 162
      protocol    = "udp"
      cidr_blocks = ["10.10.20.20/32"]
    },


    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = ["10.10.20.20/32"]
    },


    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["10.10.20.20/32"]
    },


    {
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = ["10.10.20.20/32"]
    },


    {
      from_port   = 49152
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = ["10.10.20.20/32"]
    },


    {
      from_port   = 1024
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = ["10.10.20.20/32"]
    },

  ]

}


variable "subnet_ids" {
   description = "The IDs of the subnets where endpoints should be deployed"
   type        = list(string)
   default     = ["subnet-0508343e46877c829", "subnet-09a3826d07c91ca6e"]
}


variable "region" {
  description = "AWS region for the deployment"
  type        = string
  default     = "il-central-1"
}

variable "ssm_endpoint_types" {
  description = "List of SSM endpoint services to create"
  type        = list(string)
  default     = ["ssm", "ssmmessages", "ec2messages"]
}





