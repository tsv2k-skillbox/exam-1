#!/bin/bash
yc compute instance create \
 --name web --hostname web.sb.stumasov.ru \
 --zone=ru-central1-d \
 --network-interface subnet-name=private-subnet,ipv4-address=172.16.4.21,dns-record-spec=\{name=web.sb.stumasov.ru.,dns-zone-id=dnsem7bu52eup0ufq8jh,ttl=600\} \
 --platform=standard-v2 --cores=2 --memory=1G --core-fraction=5 \
 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2004-lts-oslogin,size=10G,auto-delete=true \
 --metadata serial-port-enable=0 \
 --metadata-from-file ssh-keys="/home/ubuntu/.ssh/id_ed25519.pub" \
 --metadata-from-file user-data="./user-data" 
