#!/bin/bash

# Удалить страховочные файлы, рекурсивно содержащиеся в
# заданной директории. Маски таких файлов (*~, *.bak и
# пр.) должны храниться в отдельном файле и считываться
# оттуда скриптом. Команду удаления задавать с ключом
# -i. Передать вьюеру список масок для удаления, имя
# директории и список удаленных файлов. Параметр: имя
# директории. Этот параметр должен быть
# необязательным — по умолчанию удаления выполняются
# для домашней директории. Примечание: необходимо
# помнить. что символ * не включает системные файлы
# вида .*.

# Запуск: ./4.sh 4test/

directory=${1:-.} # для директории использовать первый аргумент, если нет, то .
directory=${directory%/} # убрать последний slash
echo "Directory: $directory"

IFS=$'\n' # IFS = internal field separator, здесь назначается новая строка вместо дефолтного пробела
for mask in `cat 4.masks`; do
    echo "Mask: $mask"
    rm -i $directory/$mask # -i - выводить запрос на подтверждение каждой операции удаления
done
exit 0 # выход из скрипта с удачным завершением
