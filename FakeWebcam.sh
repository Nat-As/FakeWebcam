#!/bin/bash

#Check for arg
if [[ $# -eq 0 ]]
then
    cat << "EOF"
Usage:

FakeWebcam [OPTIONS] [LOCATION] [DEVICE]

options:
    patch       Patches the kernel with modprobe (create /dev/video0)
    pipe        Start streaming an mp4 to the device

examples:
    FakeWebcam patch                            Set up Video1 device
    FakeWebcam pipe Videos/video.mp4 video1     Pipe video.mp4 to video1 device
EOF
fi

if [ "$1" == "patch" ]
then
    echo "Patching kernel"
    sudo modprobe v4l2loopback || echo "Patch Failed"
    echo "video device started at:"
    ls /dev | grep video
fi

if [ "$1" == "pipe" ]
then
    echo "Piping video to webcam"
    ffmpeg -re -i $2 -map 0:v -vf format=yuv420p -f v4l2 /dev/$3

fi