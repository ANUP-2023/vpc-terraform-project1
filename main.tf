resource "aws_security_group" "webSg" {
  name        = "web"
  description = "Security group for web servers allowing HTTP and SSH access"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "Allow incoming HTTP traffic on port 80 from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow incoming SSH traffic on port 22 from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"   # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "WebSecurityGroup"
    Environment = "dev"
  }
}

