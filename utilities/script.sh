#!bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo echo "<h1>Hii ppl!</h1>" > /var/www/html/index.html
sudo yum install -y amazon-linux-extras
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install php-cli php-pdo php-fpm php-json php-mysqlnd -y
sudo systemctl start httpd
sudo systemctl enable httpd
 

