#!/bin/bash

RESULT=$(lsusb -t | awk '
/Mass Storage/ {
    found=1;
    match($0, /[0-9]+M/, m);
    speed=m[0];
    if (speed == "10000M") type="USB 3.2 Gen 2 (10Gbps)";
    else if (speed == "5000M") type="USB 3.0/3.1 Gen 1 (5Gbps)";
    else if (speed == "20000M") type="USB 3.2 Gen 2x2 (20Gbps)";
    else if (speed == "40000M") type="USB4/Thunderbolt (40Gbps)";
    else if (speed == "480M") type="USB 2.0 (480Mbps)";
    else type="Unknown";
    print "\n### Detected: " speed " - " type " ###\n";
}
/Mass Storage/ {exit}
END {
    if (!found) print "\n### No data connection detected — likely a power-only cable. ###\n";
}')

# Print result
echo -e "$RESULT"

