#! /bin/bash
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl restart httpd
sudo echo "<h1>Hello from Web Instance<br> Omg can't believe it worked</h1>" > /var/www/html/index.html
sudo chown -R apache:apache /var/www/html