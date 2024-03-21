# Allocate EIP to EC2 Instance (Fixed IP address)
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.prod_morningnews_backend.id
  allocation_id = var.AWS_EIP_ALLOC_ID_PROD
}
# Configure Firewall Inbound/Outbound rules
resource "aws_security_group" "prod_morningnews_backend_sg" {
  name        = "prod-morningnews-backend-sg"
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
  # Inbound rule to allow Monitor from Prometheus
  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["35.181.111.254/32"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["35.181.111.254/32"]
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