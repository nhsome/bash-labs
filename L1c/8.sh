#!/bin/bash

# Предоставить группе group разрешение исполнять
# заданные файлы, пользователям группы other запретить
# читать и редактировать, но разрешить исполнять эти
# файлы. На стандартный вывод должна посылаться
# информация, которая позволяет убедиться, что эти
# изменения произошли. Параметры: имена файлов; их
# число заранее не известно.

# Запуск: sudo ./8.sh 651 8test/file.txt

# @see https://ss64.com/bash/chmod.html

rights="$1"
shift

for arg in "$@"
do
	echo "Before:"
	ls -l $arg # -l - long listing format (тип, права, кол-во ссылок, группа, размер, время, имя)
	chmod $rights $arg # -,rwx,rwx,--x file(-)/dir(d), owner, group, other
	echo "After:"
	ls -l $arg
done
