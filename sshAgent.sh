echo "### ---  ESTABLISHING SSH CONNECTION BETWEEN ALL THE HOSTS ---####"
echo "ssh-agent bash"
ssh-agent bash


#write new file
echo "cp naveen.pem ~/.ssh/"
cp naveen.pem ~/.ssh/
echo "sudo chmod 600 ~/.ssh/naveen.pem"
sudo chmod 600 ~/.ssh/naveen.pem
echo "ssh-add ~/.ssh/naveen.pem"
ssh-add ~/.ssh/naveen.pem
