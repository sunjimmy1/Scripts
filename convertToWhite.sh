#!/bin/bash

if [[ $# -eq 0 ]]; then
    thedir=.
else
    thedir=$1
fi

for file in $thedir/*; do

    # ignore files with lowercase letters
    svg=$(echo ${file##*/} | grep .*\.svg)

    if [[ ${file##*/} = $svg ]]; then
        echo $file
        sed -Ei s/'rgb\(([0-9]{3}|[0-9]{2}|[0-9]),([0-9]{3}|[0-9]{2}|[0-9]),([0-9]{3}|[0-9]{2}|[0-9])\)'/'rgb(255,255,255)'/g $file
        sed -Ei s/'\#[0-9a-fA-F]{6}'/'\#FFFFFF'/g $file
    fi

done
