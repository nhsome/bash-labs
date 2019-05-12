#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

# отккрываем файл в редакторе
filename=$1
vi $filename

# получаем счетчик из файла или создаем новый
count=0
if [ -f ./.counter ]; then
    count=$(cat ./.counter)
fi
count=$(($count+1))
$(echo $count > ./.counter)

# создаем дирректорию для архивирования, если ее нет
if ! [ -d ./$filename"_archive" ]; then
    $(mkdir "$filename"_archive)
fi

# копируем новую версию файла в архивную дирректорию
$(cp $filename "./"$filename"_archive/$filename".$count)

echo "Версия файла "$filename": "$count

# для организации алиаса нужно добавить вот это:
# alias vi='bash ~/Загрузки/lab1/17.sh'
# вот в этот файл: ~/.bashrc , указав правильный путь к скрипту
