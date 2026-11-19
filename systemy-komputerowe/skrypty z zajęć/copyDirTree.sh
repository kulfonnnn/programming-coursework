#1/bin/bash

#z1
echo "tworze katalog $2"
mkdir $2

#z2
echo "kopiuje $1 do $2"
cp -r "$1" "$2"

#z3
echo "przechodze do $2"
cd "$2"
sciezka_na_pozniej=$(pwd)

#z4
echo "wypisuje zawartosc $2 :"
ls -l 

#z5
echo "drzewo katalogow:"
tree -h
#-h =human readable

#z6
echo "jestesmy teraz w:"
pwd

#z7
echo "przechodzimy do wczesniej zapisanej sciezki (zad 3):"
cd "$sciezka_na_pozniej"

#z8
echo "usuwam stworzony katalog"
rm -rf "$2"
