#!/bin/bash
echo "Update mdc to latest version"
git config http.proxy socks5://10.0.0.241:9875
git update-index --assume-unchanged /app/config.ini
git pull --rebase
echo "Create logs folder"
[[ -d /app/JAV_output/logs ]] || mkdir /app/JAV_output/logs
echo "Start mdc main program"
python -u Movie_Data_Capture.py -a -o /app/JAV_output/logs