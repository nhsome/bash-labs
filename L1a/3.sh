#!/bin/bash

# Изменить расширения группы файлов. (Под
# «расширением» понимается часть имени файла после
# последней точки). Параметры: новое расширение extn и
# имена файлов, число которых заранее не известно.
# Примечание: в случае, если исходное имя файла не
# содержит точки или заканчивается ею, к нему должно
# быть добавлено .extn или extn, соответственно.

#Запуск: ./3.sh newextn test_extn/t.txt test_extn/t2.fo.hi test_extn/t3 test_extn/t4.

extn=$1 # берём первый аргумент (в примере запуска это newextn) — это будет наше расширение
shift # «убираем» первый аргумент, то есть теперь под $1 понимаем первый файл, а не расширение

for arg in "$@"
do
	filename=$(basename $arg) # получить название файла без пути
	newfilename="${filename%.*}.$extn"
	mv $arg $(dirname $arg)/$newfilename # изменить имя файла; dirname $arg берёт путь из нужного аргумента
done
