# tls-cipher-list-with-openssl
This is a simple script for scanning supported cipher suites and tls version using openssl. It loops over all supported ciphers from the openssl installation and then tries to connect to the specified host.

## Requirement
* bash
* openssl

Alternative
* Docker

## Usage
```bash
./tls-n-ciphers.sh <host:port>
```


## Docker build & run
Build docker image: 
```bash
docker build -t tls-check .
```
Run: 
```bash
docker run -it -e "destination=google.com:443" tls-check | grep YES
```
