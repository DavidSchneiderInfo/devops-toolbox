#!/bin/zsh

cloud-init status --wait

echo set debconf to Noninteractive 
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https curl docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ubuntu
sudo docker -v