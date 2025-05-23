resource "aws_security_group" "nodejs_sg" {
  name        = "nodejs_sg"
  description = "Allow port 3000"

  ingress {
    from_port   = 3000
    to_port     = 3000
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

resource "aws_instance" "nodejs_app" {
  ami                         = "ami-0953476d60561c955"
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.nodejs_sg.id]
  associate_public_ip_address = true
  key_name                    = "terraform-key"

  user_data = file("../scripts/userdata.sh")

  tags = {
    Name = "Terraform-NodeJS-Server"
  }
}