#!/bin/bash
yc compute instance create \
 --name gw --hostname gw \
 --zone=ru-central1-d \
 --network-interface subnet-name=public-subnet,security-group-ids=enpq6vce2eq77e3fm5k2,ipv4-address=10.104.0.11,nat-address="${EXT_IP}",nat-ip-version=ipv4 \
 --network-interface subnet-name=private-subnet,ipv4-address=172.16.4.11 \
 --platform=standard-v2 --cores=2 --memory=1G --core-fraction=5 \
 --create-boot-disk image-folder-id=standard-images,image-family=nat-instance-ubuntu,size=10G,auto-delete=true \
 --metadata serial-port-enable=0 \
 --metadata-from-file ssh-keys="/home/ubuntu/.ssh/id_ed25519.pub" \
 --metadata-from-file user-data="./user-data" 
