provider "aws" {
  access_key = "AKIA2GIT7SLIBQTLKA7B"
  secret_key = "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"
  region     = "ap-south-1"
}
resource "aws_instance" "web" {
  count = 2
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"

  tags = {
#       Name = "web-${count.index}"
    Name = "HelloWorld"
  }
}

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
resource "local_file" "foo" {
 #   content  = [aws_instance.web.*.public_ip]
  #  content  = aws_instance.web[0].public_ip
    filename = "testfile02"
    content = <<EOF
[webserver]
${aws_instance.web[0].public_ip}
${aws_instance.web[1].public_ip}
[dbserve]
${aws_instance.web[0].public_ip}
EOF
}

