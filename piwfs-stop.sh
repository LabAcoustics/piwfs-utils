#!/bin/bash
./piwfs-cmd.sh 'ps aux | grep piwfs | awk '"'"'{print $2}'"'"' | xargs kill'
