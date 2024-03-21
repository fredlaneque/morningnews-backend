# Declaration of the variable for the EC2 instance's EIP
variable "AWS_EIP_ALLOC_ID_PROD" {
  description = "Elastic IP used for the created EC2 Instance"
  type        = string
  default     = "eipalloc-05f44db59d1e099c5"
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
    Name = "morningnews-backend-prod"
    Environment = "prod"
    Url = "prod.isinetwork.fr"
  }
}