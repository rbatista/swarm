#!/usr/bin/env bash

for f in /init-pub-key.d/*.pub; do
  if [ -e "$f" ]; then
    echo "Authorize key $f"
    cat $f >> /root/.ssh/authorized_keys
  else
    echo "Ignoring $f"
  fi
done

echo "Starting ssh server"
service ssh start

echo "Initialize swarm"
docker swarm init

tail -f /dev/null

