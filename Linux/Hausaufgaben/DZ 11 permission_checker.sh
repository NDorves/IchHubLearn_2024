#!/bin/bash
#
USER='Nelja'
# echo 'Сделать его исполняемым:'
#chmod +x ~/permission_checker.sh
#echo 'Создать Cкрипт, который получит список прав на файлы внутри директории +x /opt/310524-ptm/ *.sh'
#chmod +x /opt/310524-ptm/ *.sh


files=$(ls)
for file in $files;
do
  if [[ $file == *.sh ]];
  then

    chmod +x "$file"
    echo "Права на исполнение добавлены к $file"
  fi
done
