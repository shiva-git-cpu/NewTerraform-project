variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  # Amazon Linux 2 AMI for ap-south-1 (Mumbai)
  default = "ami-0cca134ec43cf708f"
}

variable "key_name" {
  description = "Enter your AWS key pair name (not .pem file)"
  default     = "shiva"   # change this to your key pair name
}

variable "bucket1_name" {
  default = "shiva-storage-bucket-12345"
}

variable "bucket2_name" {
  default = "shiva-logs-bucket-12345"
}
