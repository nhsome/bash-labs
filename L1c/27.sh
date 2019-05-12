#!/bin/bash

#Выполнить инверсию элементов входной строки,
#разделенных символами . Параметр: строка общего вида
#[.]seg_1.seg_2.. . . .seg_n[.]. На стандартный вывод
#должна быть выведена строка
#[.]seg_n.. . . .seg_2.seg_1[.]. Инверсии подлежат и
#возможные первый и последний символы .; если входная
#строка начинается с символа ., то выходная должна им
#заканчиваться и наоборот.

#./27.sh "somethingelement.somthingelement.somethingelement"
str=$1
echo "$str" | awk 'BEGIN {FS="."}; { for (i=NF; i>1; i--) printf("%s.", $i); print $1; }'