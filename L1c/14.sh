#!/bin/bash

# Создать и/или добавить строку к файлу-отчету,
# содержащему статистику данных о прохождении заданного
# процесса. Однократное применение скрипта добавляет к
# файлу, хранящемуся на диске после предыдущих
# применений, одну строку, содержащую текущий временной
# штамп и величину процессорного времени, потраченного
# на выполнение данного процесса на момент исполнения
# соответствующей команды в скрипте. Заголовок
# файла-отчета с названиями колонок и строкой команды,
# породившей процесс, формируется однажды при первом
# применении скрипта для данного процесса. Параметр: в
# общем случае полная строка команды, породившей
# процесс.

# Запуск: ./14.sh /opt/google/chrome/chrome

outputDir="11output/"
command=$1

commandHash=`echo -n $command | shasum`
commandHash="${commandHash%  -*}"

filePath=$outputDir$commandHash
data=`ps aux | grep $command | head -1`
data=($data)
data=`date`' '${data[9]}' '${data[10]}

if [ -f "$filePath" ]
then
	echo "Not first execution. Log file: $filePath"
else
	echo "First execution. Log file: $filePath"
	echo "Timestamp                   CPUTIME COMMAND" > $filePath
fi

echo $data >> $filePath