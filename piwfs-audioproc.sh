#!/bin/bash

nchan=$1
filen=$2
newfilen=$3
sequence1=($(seq -w 1 2 $(($nchan - 1))))
sequence2=($(seq -w 2 2 $nchan))
for it in $(seq -w 0 $(($nchan / 2))); do
  ffmpeg -y -i $filen${sequence2[it]}.wav -i $filen${sequence1[it]}.wav -filter_complex "[0:a][1:a]join=inputs=2:channel_layout=stereo[a]" -map "[a]" $newfilen-slave$((it + 1)).wav 2> /dev/null
done
