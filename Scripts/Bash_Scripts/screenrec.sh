#!/bin/bash

# this script will record your screen and audio

display_resolution=$(xrandr --query | grep "primary" | awk '{print $4}' | sed 's/\([0-9]*\)x\([0-9]*\).*/\1x\2/')
frame_rate=25
OUTPUT=ffmpeg_screen_capture_${display_resolution}_${frame_rate}_fps_$(date +"%d_%m_%Y-%H-%M-%S")

printf "Recording PRIMARY DISPLAY at %s at %s fps\n" "$display_resolution" "$frame_rate"
printf "Saving to %s.mkv\n" "$OUTPUT"
printf "Press Ctrl+C to stop recording\n"

ffmpeg -video_size "$display_resolution" -framerate "$frame_rate" -f x11grab -i :0.0 -f pulse -ac 2 -i default /home/andrew/Videos/FFMPEG_ScreenCapture/"$OUTPUT".mkv > /dev/null 2>&1 < /dev/null

