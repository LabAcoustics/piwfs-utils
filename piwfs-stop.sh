#!/bin/bash
./piwfs-parallel.sh 'ps aux | grep piwfs | awk '"'"'{print $2}'"'"' | xargs kill'
