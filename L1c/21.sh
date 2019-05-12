#/bin/bash

# Создать отсортированный по правам доступа список
# файлов всех типов, содержащихся рекурсивно в заданной
# директории. Одному файлу должна соответствовать одна
# строка в списке. Имена файлов должны быть полными
# (начинаться с /). Параметр: имя директории.

read -p "Write Directory: " dir
ls -lR $dir | sort -k 1