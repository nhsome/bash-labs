#!/bin/bash

# Выполнить поиск файла с самым поздним временем
# последней модификации. Поиск производится среди всех
# файлов (в том числе и .*), находящихся рекурсивно в
# заданной директории. Скрипт должен выдавать имя файла
# и время модификации. Необязательный параметр: имя
# директории. Если скрипт вызывается без параметра, поиск
# выполняется в текущей директории.

directory=${1:-.}
find $directory -type f -printf '%T+ %p\n' | sort -n | tail -1  # -printf '%T+ %p\n' - выводить построчно время+название файла, sort -n - сортировать в порядке возрастания, tail -1 - показать одно последнее
