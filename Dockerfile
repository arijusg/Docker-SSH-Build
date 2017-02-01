FROM ubuntu


#Install packages
RUN apt-get update && apt-get install -y \
    wget \
    git \
 && rm -rf /var/lib/apt/lists/*

#Optional, enable sudo commands
#RUN install -y sudo && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

##Add some hosts
#RUN echo "{ip}  {host}" >> /etc/hosts

## Add known hosts 
# RUN mkdir -p ~/.ssh \
#  && chmod 0700 ~/.ssh \
#  && ssh-keyscan -p {port} {host} >> ~/.ssh/known_hosts

# using Habitus secrets
ARG host
RUN mkdir -p ~/.ssh && chmod 0600 ~/.ssh

RUN wget -O ~/.ssh/id_rsa http://$host:8080/v1/secrets/file/id_rsa \
 && echo "Pull repo here" \
 && rm ~/.ssh/id_rsa