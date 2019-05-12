#!/bin/bash

# Удалить все процессы, выполняющие заданную команду.
# Вывести PID удаляемых процессов или сообщение об
# отсутствии таких процессов. Перед собственно удалением
# процессов запрашивать подтверждение на эту операцию.
# Параметр имя команды.

# Запуск: ./12.sh '/opt/google/chrome/chrome'

pids=`pidof $1`

read -p "Are you sure to kill $pids? (Y/N) " -n 1 -r # прочитать ответ пользователя; -r - do not allow backslashes to escape any characters; -n 1 - вернуть значение после считывания 1 символа
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	kill $pids
fi
