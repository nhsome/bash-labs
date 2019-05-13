#!/bin/bash

# Организовать редактирование текстового файла filename и
# ведение архива его версий. Каждое выполнение скрипта
# должно приводить к вызову редактора (произвольного)
# для этого файла и, после окончания редактирования, к
# появлению новой копии файла вида
# filename.number_of_version в архивной директории,
# имя которой содержит filename. Директория должна
# создаваться, если ее еще нет. Номер версии файла при
# каждом выполнении скрипта увеличивается на единицу.
# Должно выдаваться сообщение, содержащее номер новой
# версии. Параметр: имя файла (filename). Организовать
# alias, чтобы при обращении к данному редактору на деле
# выполнялся данный скрипт.

if [ "$#" -ne 1 ]; then # если передан не 1 параметр, то выдать текст в echo
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
