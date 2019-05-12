#!/bin/bash

# Составить пару скриптов:
# А. Архивирование заданных файлов либо 1) при помощи
# tar с последующей упаковкой полученного архива при
# помощи bzip2 (на выходе должен сформироваться файл
# вида archive.tar.bz2), либо 2) при помощи тилиты zip
# (на выходе — файл archive.zip). Параметры: имя
# создаваемого архива (archive.tar или archive.zip) и
# имена архивируемых файлов; число последних заранее не
# известно. Примечание: последняя часть имени архива
# (tar.bz2 или zip) и должна управлять тем, как именно
# будут архивироваться файлы (при помощи tar/bzip2 или
# zip).

# Запуск: ./6A.sh archive.zip 6test/file1 6test/file2 ИЛИ ./6A.sh archive.tar.bz2 6test/file1 6test/file2

archiveName=$1
shift

tempDir="${archiveName%%.*}"

mkdir $tempDir

for arg in "$@"
do
	cp $arg $tempDir
done

archiveExtn=${archiveName#*.}

case "$archiveExtn" in
	zip)
		zip -r $archiveName $tempDir
		;;
	tar.bz2)
		tar cjf $archiveName $tempDir
		;;
	*)
		echo "Архивный формат не распознан."
		;;
esac

rm -rf $tempDir