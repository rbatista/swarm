#!/usr/bin/env bash

for pkey in /init-pub-key.d/*.pub; do
  echo "Authorize key $pkey"
  cat $pkey >> /root/.ssh/authorized_keys
done

echo "Starting ssh server"
service ssh start

echo "Initialize swarm"
docker swarm init > /swarm_id

tail -f /swarm_id

