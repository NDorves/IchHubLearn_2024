#!/bin/bash
USER=Nelja
date
echo "Hello, $USER"
echo "Work directory: $(pwd)"
ps -ef | grep bioset | grep -v grep | wc -l
ls -l /etc/passwd | awk '{print $1}'
