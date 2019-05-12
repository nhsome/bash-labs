#!/bin/bash

# Выполнить рекурсивный поиск в заданной директории всех
# символьных ссылок, ссылающихся на заданное имя файла.
# Параметры: имена директории и файла.

while true; do
read -p "Show symbolic link? Y/n " yn
case $yn in
[Yy]* )
read -p "Write Directory: " dir
read -p "File name: " file
find $dir -lname $file -ls | cut -f2- -d" "
;;
[Nn]* ) break;;

* ) echo "Choose Y/n ";;
esac
done