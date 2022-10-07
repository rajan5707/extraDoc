provider "aws" {
  access_key = "AKIAWSA5FVC5D5A7NIGF"
  secret_key = "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"
  region     = "ap-south-1"
}
resource "aws_instance" "web" {
  count = 2
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0910a859df4b2ed77"]
 # key_name          = "naveenaws.pem"

  tags = {
    Name = "Hellow"
  }
}

####### Saves  the pemkey in a local file ##########
/*
resource "tls_private_key" "pk" {
  algorithm = "RSA"
#  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
  }
}*/
#######################
/*
output "public_ips" {
        value       = [aws_instance.web.*.public_ip]
  #value = aws_eip.one.public_ip
}
output "private_ips" {
        value       = [aws_instance.web.*.private_ip]
  #value = aws_eip.one.public_ip
}
*/
#############################
resource "local_file" "foo" {
 #   content  = [aws_instance.web.*.public_ip]
  #  content  = aws_instance.web[0].public_ip
    filename = "invent.txt"
    #filename = "/etc/ansible/hosts"
    content = <<EOF
[webserver]
${aws_instance.web[0].public_ip}
${aws_instance.web[1].public_ip}
[dbserve]
${aws_instance.web[0].public_ip}
EOF
}


