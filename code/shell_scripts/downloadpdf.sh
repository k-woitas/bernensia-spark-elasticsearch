#!/bin/bash
# Download PDF from e-Periodica and transfer to AWS S3

download_pdf () {
    curl https://www.e-periodica.ch/cntmng?pid=${1} | aws s3 cp - s3://bgd-test-content/pdf/${1}.pdf
}
# Invoke function
download_pdf $1