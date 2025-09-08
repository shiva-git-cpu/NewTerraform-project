# Security group for EC2
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Hello from Terraform EC2 🚀</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "Terraform-EC2"
  }
}

# First S3 bucket
resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket1_name
  acl    = "private"

  tags = {
    Name = "Terraform-S3-Bucket1"
  }
}

# Second S3 bucket
resource "aws_s3_bucket" "bucket2" {
  bucket = var.bucket2_name
  acl    = "private"

  tags = {
    Name = "Terraform-S3-Bucket2"
  }
}
