# FakeWebcam
A simple hack designed for online proctoring systems such as proctorio.

# Requirements
+ Must have v4l2loopback [installed](https://github.com/Nat-As/v4l2loopback)
+ Tested on debian

# Usage
FakeWebcam [OPTIONS] [LOCATION] [DEVICE]

options:
    patch       Patches the kernel with modprobe (create /dev/video0)
    pipe        Start streaming an mp4 to the device

examples:
    FakeWebcam patch                            Set up Video1 device
    FakeWebcam pipe Videos/video.mp4 video1     Pipe video.mp4 to video1 device
# Background
This script uses v4l2loopback to patch the linux kernel and create a fake video device (For example /dev/video0). The script then uses this device as a webcam and streams a video to it. This is part of a proof of concept package used to hack the proctorio online exam proctoring software. The real magic happens when this is paired with google chrome running in a windows VM. In this case, a linux host has complete control of every aspect of the VM box, from webcam footage to screen sharing. An example would be a student taking a proctorio exam, which monitors the fake webcam and the fake screen (in the VM). The fake video could be a pre-recorded "attempt" at taking the exam, while the student is really doing something else.
# Why?
I am a student, and I do not think online proctoring is an adequate replacement for in-person proctoring. Programs like proctorio will never be a replacement for people like teachers and professors. These programs can always be tricked as shown in the code here. This program is not meant to be used to cheat on exams, but rather to warn against having machine learning replacing certain jobs, like professors, teachers, and proctors. While there are many things machine learning does very well, proctoring is not one of them.
