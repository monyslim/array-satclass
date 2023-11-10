terraform{
    required_providers {
      aws ={
        source = "hashicorp/aws"
        version = "~>5.1"
      }
    }
}
provider "aws"{
    region = "us-east-1"
}
resource "aws_key_pair" "array-satclass-pair" {
  key_name   = "array-satclass-pair"
  public_key = ""
}
resource "aws_security_group" "create_array_satclass_sg" {
  name        = "array_satclass_sg"
  description = "This allows access to the instances"
  vpc_id      = "vpc-04d64f80071d1887e"

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound traffic for array_satclass_instance"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "Security group for array_satclass_instance"
  }
}
resource "aws_instance" "array_satclass_instance" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  count = "1"
  subnet_id     = "subnet-06e09c0e9342a167a"
  key_name      = aws_key_pair.array-satclass-pair.key_name
  vpc_security_group_ids = [aws_security_group.create_array_satclass_sg.id]
  associate_public_ip_address = true
  user_data = file("/home/david/array-satclass/array.sh")
  tags = {
    Name = "arrays_satclass_instance"
  }
}