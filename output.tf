output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.web.public_dns
}

output "bucket1_name" {
  value = aws_s3_bucket.bucket1.bucket
}

output "bucket2_name" {
  value = aws_s3_bucket.bucket2.bucket
}
