# Samba Server for Lab/Home Use #

This container is a samba server with wide open permissions on the share.
It stores shared files on the parent/host.

Ensure you don't have a samba server already running on the parent host.

Run: sh ./build.sh in the current directory to build the container.

Files added to the samba share will be located within the share directory in this folder after the build script has been run.




