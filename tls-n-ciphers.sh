#!/bin/bash

target=$1
tlsVersions="tls1 tls1_1 tls1_2 tls1_3"

for tlsVersion in $tlsVersions
do
        tls_ciphers=`openssl ciphers -$tlsVersion | tr ':' ' '`
        cipherCommand="cipher"
        [ $tlsVersion = "tls1_3" ] && cipherCommand="ciphersuites"
        for cipher in $tls_ciphers
        do
        echo -n Testing $tlsVersion - $cipher...
        result=$(echo -n | openssl s_client -$cipherCommand "$cipher" -$tlsVersion -connect $target 2>&1)
        if [[ "$result" =~ ":error:" ]] ; then
            error=$(echo -n $result | cut -d':' -f6)
            echo NO \($error\)
        else
            if [[ "$result" =~ "Cipher is ${cipher}" ]] ; then
                echo YES
            else
                echo UNKNOWN RESPONSE
                echo $result
            fi
        fi
        done
done