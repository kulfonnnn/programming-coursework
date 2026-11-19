#!/bin/bash

#Z1
mkdir $1
echo "Stworzylem katalog $1"

#Z2
echo "Linkjka pliku odpowiadajaca mojemu uzytkownikowui:"
grep $(whoami) /etc/passwd

#Z3
echo "zapisalem danea do pliku F1"
cat /etc/passwd | cut -d: -f1,6,7 | sort -r > $1/F1.csv


#Z4
echo "Zrobilem plik f2"
cat /etc/passwd | cut -d: -f7 | rev | sort | rev | uniq > $1/F2.csv

#Z5
echo "zrobilem pluk f3"
cat /etc/passwd | cut -d: -f1 | tr 'a-z' 'A-Z' > $1/F3.txt


#Z6
echo "zrobilem plik F4"
grep -B 4 -A 4 "^nobody" /etc/passwd > $1/F4.txt

#Z7
echo "wypisalem roznice"
diff -y /etc/passwd $1/F4.txt > $1/differences.txt


