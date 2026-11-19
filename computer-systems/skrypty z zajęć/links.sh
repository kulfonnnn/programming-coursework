#!/bin/bash

#Z1
echo "tworze folder $1"
mkdir $1

#Z2
echo "tworze drzewo katalogow wg wzoru"
mkdir -p $1/D1 $1/D2/ $1/D3/ $1/D4/
touch $1/D2/F1.txt $1/D3/F1.txt $1/D4/F1.txt


#Z3
echo "tworze dowiazanie symboliczne do /etc/passwd: dowiazanie"
ln -s /etc/passwd $1/D1/dowiazanie

#Z4
echo "stworzone dowiazanie (sciezka):"
readlink $1/D1/dowiazanie

#Z5
echo "tworze twarde dowiazania"
sudo ln $1/D3/F1.txt $1/D2/twarde_do_D3F1

#Z6
echo "zmieniam uprawnienia w zad 6"
chmod 600 $1/D2/twarde_do_D3F1

#Z7
echo "zmieniam grupe dowiazania na spark"
sudo chown :_gvm $1/D2/twarde_do_D3F1

#Z8
echo "zmieniam grupe katalogu D3 na spark"
sudo chgrp _gvm $1/D3

#Z9
echo "uprawnienia katalogu D3 na zakaz wchodzenia dla wszystkich"
chmod 000 $1/D3

#Z10
echo "zmiana uprawnien D2/ tak, zeby nie dalo sie tworzyc w nim plikow i katalogow"
chmod 555 $1/D2

#Z11
echo "D4 nie mozna przegladac zawartosci, ale mozna wejs i tworzyc w nim nowy plik"
chmod 333 $1/D4 

#Z12
echo "D4 dostaje sticky bita"
chmod +t $1/D4

#Z13
echo "tworze plik w D1"
touch $1/D1/scr1.sh
echo "daje prawa do wykonywania do wlasciciela i grupy"
chmod 550 $1/D1/scr1.sh

#Z14
echo "ustawiam SUID i SGID na tym pliku"
chmod u+s,g+s $1/D1/scr1.sh

 






