#!/bin/bash

# Get text from PDF and write in TXT files on AWS S3

get_text () {
    IP=$(curl ipinfo.io/ip)
    aws s3 cp s3://bgd-content/eperiodica-pdf/${1}.pdf test.pdf
    curl -T test.pdf http://${IP}:28228/tika --header "Accept: text/plain" | \
                aws s3 cp - s3://bgd-content/eperiodica-txt/${1}.txt
}

# Invoke function

get_text $1