# S3 Website URL
output "website_url" {
  description = "URL of the S3 static website"
  value       = aws_s3_bucket.static_site.website_endpoint
}

# EC2 Public IP
output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

# Route 53 Domain Name
output "website_domain_name" {
  description = "The domain name from Route53"
  value       = aws_route53_record.www.fqdn
}