#!/usr/bin/env bash

google_chrome_version=$(google-chrome-stable --version | cut -d' ' -f3)
given_url=$1
clean_url=${given_url%%\?*}
crx_id=${clean_url##*/}
strip_extension=${clean_url%/*}
extension_name=${strip_extension##*/}

URL="https://clients2.google.com/service/update2/crx?response=redirect&prodversion="
URL+="$google_chrome_version"
URL+="&acceptformat=crx2,crx3&x=id%3D${crx_id}%26uc"

curl -fLo "$extension_name.crx" "$URL"
