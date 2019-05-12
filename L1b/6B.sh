#!/bin/bash

# Б. Обратные операции — распаковка и разархивирование
# сжатого архива archive.tar.bz2 или archive.zip.
# Параметр: имя файла архива (archive.tar.bz2 или
# archive.zip).

# Запуск: ./6B.sh archive.zip ИЛИ ./6B.sh archive.tar.bz2

archiveName=$1
archiveExtn=${archiveName#*.}

case "$archiveExtn" in
	zip)
		unzip $1
		;;
	tar.bz2)
		tar xvjf $1
		;;
	*)
		echo "Архивный формат не распознан."
		exit
		;;
esac