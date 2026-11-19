#!/bin/bash


#Z1
echo "Sposb kodowania pliku to"
file -i $1

#Z2
echo "Liczba linijek pliku wynosi:"
wc -l $1

#Z3
echo "Liczba znakow w pliku:"
wc -m $1

$Z4
echo "Rozmiar pliku:"
du -h $1

#Z5
echo "W pliku $1 slowo $2 wystepuje w tej ilosci linijek:"
grep $2 $1 | wc -l

#Z6
echo "W pliku $1 slowo $2 nie wystepuje w tej ilosci linijek:"
grep -v $2 $1 | wc -l

#Z7
echo "Pita linijka pliku $1 to:"
cat $1 | head -n 5 | tail -n 1




