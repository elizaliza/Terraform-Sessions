provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "secondinst" {
  ami           = "ami-0518bb0e75d3619ca"
  instance_type = "t2.micro"
  user_data     = <<-EOF
                #!/bin/bash
                sudo yum install httpd -y
                sudo systemctl enable httpd
                sudo systemctl restart httpd
                sudo echo "Hello from Web Instance" > /var/www/html/index.html
                sudo chown -R apache:apache /var/www/html
                EOF
  tags = {
    Name = "Web-Instance"
  }
}