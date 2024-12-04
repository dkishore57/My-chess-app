provider "aws" {
  region = "us-east-1" # Change this to your preferred region
}

# Create IAM User
resource "aws_iam_user" "sns_rds_user" {
  name           = "sns-rds-user"
  force_destroy  = true # Allows automatic cleanup of access keys when deleting the user
}



# Attach Full Access Policies for SNS and RDS
resource "aws_iam_user_policy_attachment" "sns_full_access" {
  user       = aws_iam_user.sns_rds_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}

resource "aws_iam_user_policy_attachment" "rds_full_access" {
  user       = aws_iam_user.sns_rds_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

# Optional: Create Access Key for Programmatic Access
resource "aws_iam_access_key" "sns_rds_user_access_key" {
  user = aws_iam_user.sns_rds_user.name
}

# Outputs
output "access_key_id" {
  value       = aws_iam_access_key.sns_rds_user_access_key.id
  description = "Access Key ID for the SNS/RDS user"
  sensitive   = true
}

output "secret_access_key" {
  value       = aws_iam_access_key.sns_rds_user_access_key.secret
  description = "Secret Access Key for the SNS/RDS user"
  sensitive   = true
}


