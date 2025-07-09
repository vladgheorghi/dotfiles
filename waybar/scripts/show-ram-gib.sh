#!/bin/bash

# Get memory usage from /proc/meminfo (values in kB)
mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_available=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

# Calculate used memory
mem_used=$((mem_total - mem_available))

# Convert to GiB with 1 decimal
used_gib=$(awk "BEGIN {printf \"%.1f\", $mem_used/1024/1024}")
total_gib=$(awk "BEGIN {printf \"%.1f\", $mem_total/1024/1024}")

# Output in format: used/total GiB
echo "$used_gib/$total_gib GiB"

