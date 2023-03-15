#!/bin/bash

# if use_proxy from env is set to true, then set proxy
if [ "${use_proxy}" = true ]; then
    # check whether proxychains4.conf exists
    if [ -f /root/proxychains4.conf ]; then
        proxychains4 -q -f /root/proxychains4.conf kintil cut.ini
    else
        echo "Proxychains4.conf not found, exit"
        exit 1
    fi
else
    kintil cut.ini
fi
