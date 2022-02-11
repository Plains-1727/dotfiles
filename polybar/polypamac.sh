#!/bin/bash

UPDATES=$(pamac checkupdates -a | sed 1q | sed s/://)

echo $UPDATES
