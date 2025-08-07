#!/bin/bash

function usage () {
    echo "usage: watch -n2 rec.sh -i <u3m8>"
}

while getopts "i:" opt; do
    case $opt in
            # If the option is 'i', assign the value of the argument to the 'u3m8' veriable
        i)
            u3m8=$OPTARG
            # echo the value of the argument
            echo "u3m8 address: ${OPTARG}" >&2
            ;;
            # If an invalid option is passed, display an error message and call the 'usage' function
        \?)
            echo "ERROR: Invalid option: -${OPTARG}" >&2
            usage
            ;;
            # If an option is passed without an argument, display an error message and exit
        :)
            echo "Option -${OPTARG} requires an argument." >&2
            exit
            ;;
    esac
done

# If no options were passed, echo a message indicating this and exit
if [ "$OPTIND" -eq 1 ]; then
    echo "No options were passed EXITING";
fi

# Shift the positional parameters to the left by the number of options processed by the 'getopts' loop
shift $((OPTIND-1))

OUTPUTDIR="/mnt/Crucial2TB/.Videos"

name=$(echo "$u3m8" | grep -oP 'amlst:\K[^-]*')
outputFile="$OUTPUTDIR/${name}_$(date +"%d_%m_%Y-%H-%M").mkv"

# Command
watch -n2 ffmpeg -i "$u3m8" -c copy -bsf:a aac_adtstoasc "$outputFile" > /dev/null 2>&1 < /dev/null

