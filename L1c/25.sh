#!/bin/bash

# Создать список обычных файлов, находящихся рекурсивно
# в заданной директории и имеющих права доступа
# заданного вида для группы пользователей other. Имена
# файлов должны быть полными (начинаться с /).
# Параметр: имя директории.

echo "Input target directory:"
read dir
cd $dir

echo "Showing files with rights 'rw-' for group 'other':"
find "$PWD" -type f -perm -006