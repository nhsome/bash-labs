#!/bin/bash

# Выполнить рекурсивный поиск в заданной директории всех
# символьных ссылок, ссылающихся на заданное имя файла.
# Параметры: имена директории и файла.

read -p "Write Directory: " dir
read -p "File name: " file
find $dir -lname $file -ls | cut -f2- -d" "