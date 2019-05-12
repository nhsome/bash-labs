#!/bin/bash

# Выполнить контекстное изменение имен файлов —
# заменить во всех именах одну комбинацию символов на
# другую. Параметры: общая часть имен файлов,
# подлежащая замене; комбинация символов на которую
# будет заменена это общая часть; собственно имена
# файлов, число которых заранее не известно.

# Запуск: ./5.sh foo bar 5test/fooggg.txt 5test/fookkk.txt 5test/foonnnkkk

find=$1
shift
replace=$1
shift

for arg in "$@"
do
	filename=$(basename $arg)
	newfilename="${filename//$find/$replace}"
	mv $arg $(dirname $arg)/$newfilename
done