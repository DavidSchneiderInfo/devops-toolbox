#!/bin/bash

sudo apt update -y

sudo apt install xfsprogs -y

sudo mkfs -t xfs /dev/xvdd

sudo mkdir /srv/data

sudo mount /dev/xvdd /srv/data

BLK_ID=$(sudo blkid /dev/xvdd | cut -f2 -d" ")

if [[ -z $BLK_ID ]]; then
  echo "Hmm ... no block ID found ... "
  exit 1
fi

echo "$BLK_ID     /srv/data   xfs    defaults   0   2" | sudo tee --append /etc/fstab

sudo mount -a

echo "Bootstrapping Complete!"