#!/bin/bash

# collects all crash and stores them in a file (awk + sed to keep only the crash IDs)
ceph crash ls | awk '{print $1}' |  sed -n '2, $p'  > infos

# deletes everything afterwards
while IFS= read -r crash; do
    ceph crash rm "$crash"
done < infos
