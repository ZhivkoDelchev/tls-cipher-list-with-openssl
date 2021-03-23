# tls-cipher-list-with-openssl
This is a simple script for scanning supported cipher suites and tls version using openssl. It loops over all supported ciphers from the openssl installation and then tries to connect to the specified host.

## Requirement
* bash
* openssl

## Usage
```bash
./tls-n-ciphers.sh <host:port>
```