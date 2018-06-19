# Docker Swarm + openssh server

NOT FOR PRODUCTION ENVIRONMENT

## Running the image
```console
docker build --tag swarm .
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock swarm
```

## openssh

## User and password access
- login:
user: root
password: root

```console
ssh root@CONTEINER_IP
```

### Publickey access
Bind a volume with the public key (*.pub) in the directory /init-pub-key.d/ to access using a publickey:

```console
docker run -v "/var/run/docker.sock:/var/run/docker.sock" -v "$HOME/.ssh/id_rsa.pub:/init-pub-key.d/id_rsa.pub" swarm
```

And connect using your private key:

```console
ssh -i $HOME/.ssh/id_rsa root@CONTEINER_IP
```

If your public/private key are in the $HOME/.ssh you dont need to pass the key path:
```console
ssh root@CONTEINER_IP
```
