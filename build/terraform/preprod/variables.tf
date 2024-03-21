# Declaration of the variable for the EC2 instance's EIP
variable "AWS_EIP_ALLOC_ID_PREPROD" {
  description = "Elastic IP used for the created EC2 Instance"
  type        = string
  default     = "eipalloc-0bc66a23ab973f43d"
}
# Declaration of the variable for the AWS access key ID
variable "AWS_ACCESS_KEY_ID" {
  description = "The ID of the AWS access key"
  type        = string
}
# Declaration of the variable for the AWS secret key
variable "AWS_SECRET_ACCESS_KEY" {
  description = "The AWS secret key"
  type        = string
}
# Declaration of the variable for the AWS region
variable "AWS_DEFAULT_REGION" {
  description = "The AWS region to use"
  type        = string
  default     = "eu-west-3"
}
# Declaration of the variable for the instances tags
variable "AWS_INSTANCE_TAGS" {
  description = "The tags to apply to the EC2 instances"
  type        = map(string)
  default = {
    Name = "morningnews-backend-preprod"
    Environment = "preprod"
    Url = "preprod.isinetwork.fr"
  }
}