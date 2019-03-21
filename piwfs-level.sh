#!/bin/bash
level=$1
./piwfs-cmd.sh "amixer set Digital $level%"
