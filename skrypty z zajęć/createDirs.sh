#!/bin/bash


#z1
echo "Tworze teraz katalog $1"
mkdir -p "$1"

#z2
echo "przechodzimy do katalogu $1"
cd "$1"

#z3
echo "tworzymy odpowiednia strukture katalogow i plikow"
mkdir -p d1/d1.1
mkdir -p d2/d2.1
mkdir -p d3/d3.1 
mkdir -p d3/d3.2
mkdir Aa
mkdir Bb
mkdir Cc

touch d1/t1.txt
touch d2/d2.1/f1.csv
touch d3/d3.2/f2.csv

#z4
echo "zmieniam lokalizacje pliku t1.txt"
mv d1/t1.txt d1/d1.1

#z5
echo "kopiuje plik f1.csv do d1"
cp d2/d2.1/f1.csv d1/

#z6
echo "zmiana naazwy z Aa na Aa1"
mv Aa Aa1

#z7 
echo "lista katalogow ktore koncza sie na 1 lub 2:"
find . -type d -name "*1" -o -name "*2"

#z8
echo "rozmiary katalogow 1. poziomu (*/)"
du -sh */
#du -> disk usage, -sh -> summary human readable
