#!/bin/bash

# Выполнить рекурсивный поиск в заданной директории 𝑛
# файлов, наибольших по объему. Одному найденному
# файлу должна соответствовать одна строка в списке.
# Имена файлов должны быть полными (начинаться с /).
# Параметры: имя директории и число 𝑛. Последний
# параметр — необязательный; по умолчанию ищутся 10
# таких файлов.

echo "Input target directory:"
read dir
cd $dir
echo "Would you like to input number of required files? (N/no)"
read N
if [[ $N == "no" ]]
	then N=10
fi
echo "Showing "$N" biggest files:"
find "$PWD" -type f | xargs ls --sort=size | head -n $N # xargs - формирует список, xargs получила на вход команду ls с сортировкой, ограничение на показ по количеству
