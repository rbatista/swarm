FROM buildpack-deps:bionic-curl

# Install Docker
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        sudo && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" && \
    apt-get update && \
    apt-get install -y docker-ce && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        iproute2 \
        vim && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    /etc/init.d/ssh restart && \
    echo "root:root" | chpasswd && \
    mkdir -p /root/.ssh/ && \
    touch /root/.ssh/authorized_keys && \
    chmod -R 700 /root/.ssh && \
    mkdir -p /init-pub-key.d/

ADD ./entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
