#! /bin/bash/
#
# Скрипт должен создавать по 10 файлов с порядковым номером и датой создания. 
# 1_20.04.23 , 2_20.04.23 , 3_20.04.23 .. 10_20.04.23
export EDITOR=nano

for i in {1..10}; do
    touch "${i}_$(date + '%d.%m.%y')"
done
