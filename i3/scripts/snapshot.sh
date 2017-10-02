#!/usr/bin/env bash

IMAGE_URL=$(date +"%Y_%m_%d_%I_%M_%s_%p")".png"
scrot /home/begood/Pictures/$IMAGE_URL && xclip -selection c -t image/png < /home/begood/Pictures/$IMAGE_URL

