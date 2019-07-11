#!/bin/bash

yum install nfs-utils

 echo "Where do you want to create your sharing directory - give a path :"

  read -e path

   mkdir nfsshare $path

    systemctl nfs enable
     systemctl nfs-server enable
      systemctl nfs-lock enable
       systemctl nfs-idmap enable

        chmod -R 777 $path/nfsshare

         touch /etc/exports

          echo "What is your client's IP address? :"

         read -e ip

        touch /etc/exports

       bash -c 'cat > /etc/exports <<EOF

      $path/nfsshare $ip(rw,sync,no_root_squash,no_all_squash)
EOF
'

   systemctl restart nfs-server

echo " check your sharing directory path now and enjoy ! :"
