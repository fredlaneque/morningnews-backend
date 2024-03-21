# Allocate EIP to EC2 Instance (Fixed IP address)
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.preprod_morningnews_backend.id
  allocation_id = var.AWS_EIP_ALLOC_ID_PREPROD
}
# Configure Firewall Inbound/Outbound rules
resource "aws_security_group" "preprod_morningnews_backend_sg" {
  name        = "preprod-morningnews-backend-sg"
  description = "Security group for Morning News Backend"
  # Inbound rule to allow HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Inbound rule to allow HTTPS from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Inbound rule to allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change this param to YOUR_IP_ADDRESS/32 for improved security
  }
  # Inbound rule to allow ICMP (ping) from anywhere
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # Change this param to YOUR_IP_ADDRESS/32 for improved security
  }
  # Outbound rule to allow internet connection
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}