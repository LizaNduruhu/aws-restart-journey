#!/bin/bash

prefix="Liza"

# Find the highest existing number
last_number=$(ls ${prefix}[0-9]* 2>/dev/null | sed "s/${prefix}//" | sort -n | tail -1)

# If no files exist, start from 1
if [ -z "$last_number" ]; then
    last_number=0
fi

# Create the next 25 files
for ((i=1; i<=25; i++))
do
    number=$((last_number + i))
    touch "${prefix}${number}"
done

echo "Created 25 files starting from ${prefix}$((last_number + 1))"
echo "Ending with ${prefix}$((last_number + 25))"
