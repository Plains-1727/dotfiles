#!/bin/bash

read -p "Enter password: " -s secret

sudo mount.cifs //herne.lokal/data/HOMES_02/h005873 ~/win/home -o user="h005873",password=$secret,uid=1000,rw
sudo mount.cifs //herne.lokal/data/fb12/a2 ~/win/fb -o user="h005873",password=$secret,uid=1000,rw

