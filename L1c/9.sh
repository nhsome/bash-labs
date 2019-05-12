#!/bin/bash

# Сравнить отчеты (листинги вывода) команды du для
# заданной директории на текущий и некоторый предыдущий
# момент времени, когда данный скрипт выполнялся для
# этой директории в последний раз. Текущий и предыдущий
# временные штампы моментов начала выполнения скрипта
# и различия между отчетами должны сохраняться на диске
# и передаваться вьюеру. Скрипт должен в начале
# проверять, выполнялся ли он уже для заданной
# директории, и если нет, то выдавать соответствующее
# сообщение, не пытаясь при этом выполнить сравнение.
# Параметр: имя директории. Если параметр отсутствует, то
# сравнение должно выполняться для домашней директории.

# Запуск: ./9.sh или ./9.sh ../../../../../ИТМО/

outputDir="9output/"

if [ $1 ]
then
	directory=`readlink -f $1` # -f - следовать пути в аргументе
else
	directory=`pwd`
fi

size=`du --summarize "$directory"`# --summarize - показывать только общую сумму объекта; du = disk usage
size="${size%	*}"

directoryHash=`echo -n $directory | shasum` #shasum - вычислить хэш-сумму; -n - не выводить перевод строки
directoryHash="${directoryHash%  -*}" # убираем всё, кроме хэша

filePath=$outputDir$directoryHash

if [ -f "$filePath" ] # проверить наличие файла, если есть - then
then
	sizeBefore=`cat $filePath`
	echo "Size before: $sizeBefore"
else
	echo "Not found size before"
fi

echo "Size now: $size"

echo "$size" > $filePath
