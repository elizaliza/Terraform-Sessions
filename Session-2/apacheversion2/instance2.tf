#working code
#creating security group, allow ssh and http
resource "aws_security_group" "allow_ssh_and_http" {
  name        = "allow_ssh_and_http"
  description = "Allowing ssh and http traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
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

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "apache" {
  ami             = "ami-0518bb0e75d3619ca"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssh_and_http.name}"]
  user_data       = file("install_apache.sh")
  tags = {
    Name = "Web-Instance"
  }
}