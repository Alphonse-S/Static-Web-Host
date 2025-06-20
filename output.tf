# S3 Website URL
output "s3_website_url" {
  value       = aws_s3_bucket_website_configuration.static_site.website_endpoint
  description = "The website endpoint for the S3 bucket"
}


# EC2 Public IP
output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

# CloudFront Distribution Domain Name
output "cloudfront_url" {
  value       = aws_cloudfront_distribution.static_site.domain_name
  description = "The URL of the CloudFront distribution"
}
