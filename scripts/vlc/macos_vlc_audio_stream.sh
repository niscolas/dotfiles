#!/bin/bash

vlc -vvv avaudiocapture://BlackHole2ch_UID --sout '#transcode{ab=128,acodec=mpga,channels=2}:rtp{dst=10.42.0.1,port=8123,ttl=1}' --no-sout-video
