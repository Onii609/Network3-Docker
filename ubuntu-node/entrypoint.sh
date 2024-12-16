#!/bin/bash

# Set umask to restrict file permissions
umask 077

# Set file permissions as needed (make sure the files are properly restricted)
chmod +x /root/ubuntu-node/manager.sh
chmod 600 /root/ubuntu-node/wg0.conf
chmod -R 700 /root/ubuntu-node/arm64 /root/ubuntu-node/www /root/ubuntu-node/x86_64

# Now run the original manager.sh script
exec "$@"

