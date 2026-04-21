resource "aws_security_group" "devops_sg" {
  name        = "devops-sg"
  description = "Allow SSH and app ports"

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

  ingress {
    description = "NodePort Range"
    from_port   = 30000
    to_port     = 32767
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

resource "aws_instance" "devops_server" {
  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 (Mumbai)
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "devops-platform"
  }
}
resource "aws_ecr_repository" "app_repo" {
  name = "devops-platform-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "devops-platform-ecr"
  }
}