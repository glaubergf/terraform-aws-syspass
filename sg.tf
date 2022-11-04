# Security group without dynamic block ----------

resource "aws_security_group" "sg_syspass" {
  name        = "sg_syspass"
  description = "Security group without dynamic block"

  ingress {
    description = "Ping rule"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = ["170.xxx.113.xxx/32"]
  }

  ingress {
    description = "HTTP rule"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = ["170.xxx.113.xxx/32"]
  }

  ingress {
    description = "HTTPs rule"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = ["170.xxx.113.xxx/32"]
  }

  ingress {
    description = "SSH rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #cidr_blocks = ["170.xxx.113.xxx/32"]
  }

  egress {
    description = "Exit rule all out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sg-syspass"
    description = "Security group without dynamic block."
  }
}

# Security group with dynamic block ----------

/*locals {
  ingress_rules = [
    {
      port        = 443
      description = "Ingress rule for HTTPs port"
    },
    {
      port        = 80
      description = "Ingress rule for HTTP port"
    },
    {
      port        = 22
      description = "Ingress rule for SSH port"
    },
    {
      port        = -1
      description = "Input rule for PING"
    }
  ]

#  egress_rules = [
#    {
#    port        = 0
#    description = "Egress rule for all ports"
#    }
#  ]

  ports_out = [
    0
  ]
}

resource "aws_security_group" "sg_syspass" {
  name = "sg_syspass"

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

#  dynamic "egress" {
#    for_each = local.egress_rules
#
#    content {
#      description = egress.value.description
#      from_port   = egress.value.port
#      to_port     = egress.value.port
#      protocol    = "-1"
#      cidr_blocks = ["0.0.0.0/0"]
#    }
#  }

  dynamic "egress" {
    for_each = toset(local.ports_out)

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name        = "sg-syspass"
    description = "Security group with dynamic block."
  }
}*/