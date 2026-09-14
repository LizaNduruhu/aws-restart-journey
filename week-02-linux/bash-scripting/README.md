# Bash Shell Scripting Lab 🐚

## Overview

As part of AWS re/Start Week 2, I practiced Bash shell scripting and automation using the Linux command line.

The main task was to create a Bash script that automatically generates batches of 25 empty files with sequentially numbered names.

## Objective

The script was required to:

* Create 25 empty files using the `touch` command.
* Name the files using a specified name followed by sequential numbers.
* Automatically detect the highest existing number.
* Create the next batch of 25 files when the script is run again.
* Avoid hard-coding the file numbers.
* Use Bash automation to generate the file names.

## Script

The script uses Bash variables, command substitution, conditional logic, a loop, and the `touch` command to automate file creation.

```bash
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
```

## How It Works

### 1. Define the file name prefix

The script defines the name used for the generated files:

```bash
prefix="Liza"
```

### 2. Find the highest existing number

The script checks the directory for existing files using the defined prefix and determines the highest number already created.

This allows the script to continue from the previous batch instead of starting again from 1.

### 3. Handle the first run

If no matching files exist, the script sets the starting number to `0`.

### 4. Generate the next 25 numbers

A Bash `for` loop generates 25 sequential numbers:

```bash
for ((i=1; i<=25; i++))
```

### 5. Create the files

The `touch` command creates the empty files:

```bash
touch "${prefix}${number}"
```

## Testing

I tested the script by running it and using:

```bash
ls -l
```

The directory listing was used to verify that the expected files were created and that they had a size of 0 bytes.

I also tested the script again to confirm that it continued with the next sequence of numbers instead of recreating the first batch.

## What I Learned

* How to create and execute Bash scripts.
* How to use variables in Bash.
* How to use loops for automation.
* How to use conditional logic.
* How to use command substitution.
* How to work with file names from the command line.
* How automation can eliminate repetitive manual tasks.
* How to validate file creation using `ls -l`.

## Key Takeaway

This lab helped me understand how Bash can be used to automate repetitive Linux tasks instead of performing them manually.

The most important part was designing the script so that it could determine where the previous batch ended and automatically continue from there.


## AWS re/Start Journey

**Programme:** AWS re/Start
**Cohort:** 15
**Week:** 02
**Lab:** Bash Shell Scripting
**Status:** ✅ Completed
