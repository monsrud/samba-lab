#!/bin/sh
set -e

CONTAINER_NAME=samba-lab
IMAGE_NAME=samba-lab
CONTAINER_FE=docker  # or CONTAINER_FE=podman

$CONTAINER_FE container stop $CONTAINER_NAME  > /dev/null 2>&1 || true
$CONTAINER_FE container rm $CONTAINER_NAME  > /dev/null 2>&1 || true

# Simple samba config

cat << EOF > smb.conf 

#
# Example smb.conf for a wide open share
#
[global]
   map to guest = bad user
[share]
    path = /share
    read only = no
    guest ok = yes

EOF

$CONTAINER_FE build -t $IMAGE_NAME --rm=true --force-rm=true --no-cache .

echo ""
echo "Start your container with the command:"
echo ""
echo "${CONTAINER_FE} run --name ${CONTAINER_NAME} -d -v ${CONTAINER_NAME}:/share -p 445:445 -p 193:139/udp ${IMAGE_NAME}"

