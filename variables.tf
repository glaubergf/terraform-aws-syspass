# VARIABLES main.tf ----------

variable "project" {
  description = "Define the name of project what will be deployed."
  default     = "SysPass Server"
}

variable "region" {
  description = "Define what region the instance will be deployed."
  default     = "us-east-1"
}

variable "access_key" {
  description = "Access key user 'bondedaaws'"
  default     = "XXXXXXXXXXXXXXXXXXXX"
}

variable "secret_key" {
  description = "Secret key user 'bondedaaws'"
  default     = "xxXXxXxXXxXxxXxXXxXxxXxXxxxxxxxXxxxXXXxxx"
}

/*
variable "shared_config_files" {
  description = "Define what path configuration will be deployed"
  default     = "/home/mcnd2/.aws/config"
}

variable "shared_credentials_files" {
  description = "Define what path credentials will be deployed"
  default     = "/home/mcnd2/.aws/credentials"
}
*/

variable "profile" {
  description = "Define the profile name as set in the shared credentials file will be deployed."
  default     = "default"
}

# VARIABLES ec2.tf ----------

variable "owners" {
  description = "AWS owners account number."
  default     = ["136693071363"] #Ownwer amazon/debian-11-amd64-20220503-998
}

variable "ami" {
  description = "AWS AMI to be used"
  #default     = ["ami-0c56357cb414f9599"]
  default = ["debian-11-amd64-*"]
}

variable "instance_type" {
  description = "AWS Instance type defines the hardware configurtaion of the machine."
  default     = "t2.micro"
}

variable "key_name" {
  description = "key '.pem' access remote"
  default     = "bondedaaws"
}

variable "name" {
  description = "Name of the application"
  default     = "tf-syspass-server"
}

variable "env" {
  description = "Environment of the application"
  default     = "prod"
}

#variable "repo" {
#  description = "Repository of the application"
#  default     = "https://github.com/glauber_gf"
#}

# VARIABLES vpc.tf ----------

variable "vpcCIDRblock" {
  default = "10.0.0.0/16"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = true
}

variable "dnsHostNames" {
  default = true
}

variable "publicsCIDRblock" {
  default = "10.0.1.0/24"
}

variable "mapPublicIP" {
  default = true
}

variable "availabilityZone" {
  default = "us-east-1a"
}

/*
variable "privatesCIDRblock" {
  default = "10.0.2.0/24"
}
*/

variable "publicdestCIDRblock" {
  default = "0.0.0.0/0"
}

/*
variable "localdestCIDRblock" {
  default = "10.0.0.0/16"
}

variable "ingressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "egressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
*/

# VARIABLES sg.tf ----------

variable "desc_https" {
  type    = string
  default = "HTTPs security group"
}

variable "desc_http" {
  type    = string
  default = "HTTP security group"
}

variable "desc_ssh" {
  type    = string
  default = "SSH security group"
}