#!/bin/sh

# Generate host keys (if necessary)
if ! [ -f /etc/ssh/ssh_host_rsa_key ]; then
	ssh-keygen -A
fi

# Install authorized_keys (if available)
install -d -m 700 "$HOME/.ssh"
install -m 600 /dev/null "$HOME/.ssh/authorized_keys"
if [ -f /config/authorized_keys ]; then
	cat /config/authorized_keys >"$HOME/.ssh/authorized_keys"
fi

exec "$@"
