#!/bin/bash

# Выполнить рекурсивный поиск в заданных директориях
# всех файлов, являющихся символьными ссылками.
# Параметры: имена директорий; их число заранее не
# известно. Если скрипт вызывается без параметров, поиск
# должен осуществляться для домашней директории.

while true; do
read -p "Show symbolic link? Y/n " yn
case $yn in
[Yy]* )
read -p "write directory: " dir
find ${dir:-~/} -type l -ls | cut -f2- -d" "
;;
[Nn]* ) break;;

* ) echo "Choose Y/n ";;
esac
done