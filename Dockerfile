FROM amazonlinux:2023

ENV destination foo

WORKDIR /opt/

RUN yum -y update && yum upgrade && \
    yum install -y openssl && \
    yum clean all && rm -rf /var/cache/yum

COPY tls-n-ciphers.sh .

ENTRYPOINT sh ./tls-n-ciphers.sh $destination