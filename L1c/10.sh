#!/bin/bash

# Вычислить разность между полным объемом домашней
# директории (который она занимает на диске) на момент
# текущего запуска скрипта и на момент предыдущего
# запуска. В общем случае листинг скрипта должен
# содержать предыдущие временной штамп и объем,
# текущие штамп и объем и разность между объемами.
# Указание: скрипт должен сохранять текущие штамп и
# объем на диске, чтобы использовать эту информацию при
# следующем исполнении. Естественно, скрипт должен
# различать первое и последующие исполнения.


# Чем отличается от 9 кроме вывода разности?????

# Запуск: ./10.sh или ./10.sh ../../../../../ИТМО/

outputDir="10output/"

if [ $1 ]
then
	directory=`readlink -f $1`
else
	directory=`pwd`
fi

size=`du --summarize "$directory"`
size="${size%	*}"

directoryHash=`echo -n $directory | shasum`
directoryHash="${directoryHash%  -*}"

filePath=$outputDir$directoryHash

if [ -f "$filePath" ]
then
	sizeBefore=`cat $filePath`
else
	echo "It is first execution. Size now: $size"
	echo "$size" > $filePath
	exit
fi

dif=$(( size-sizeBefore ))
echo "Difference: $dif"
echo "$size" > $filePath