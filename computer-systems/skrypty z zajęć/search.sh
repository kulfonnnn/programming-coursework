#!/bin/bash



#Z1
mkdir -p $2

#Z2
echo "Pliki .txt:"
find $1 -type f -name "*.txt"

#Z3
echo "Katalogi na A/a/B/b"
find $1 \( -iname "A*" -o -iname "B*" \)

#Z4
echo "Pliki executable i .sh"
find $1 -type f -name "*.sh" -executable

#Z5
echo "pliki od uzytkownika kali" #(bo nie ma tu chyba uzytkownika student
find $1 -type f -empty -user kali

#Z6
echo "dowiazania:"
find $1 -type l

#Z7
echo "pliku grupy kali i <1MB"
find $1 -type f -group kali -size -1M

#Z8
echo "wykonywalne, SUID, SGID"
find $1 -type f -executable \(  -perm -4000 -or -perm -2000 \)

#Z9 
echo "wyszukaj foldery ze sticky bitem"
find $1 -type d -perm -1000

#Z10
echo "modyfikowane w ostatniej godzinie"
find $1 -type f -mmin -60


#Z11
echo "w katalogu /dev/ znajdz urzadznia blokowe/znakowe"
find /dev -type b -o -type c

#Z12
echo "znajdz i usun puste katalogi"
find $1 -type d -empty -exec rmdir {} \;

#Z13
echo "Pliki >5MB wedruja do $2"
find $1 -type f -size +5M -exec mv {} "$2" \;

#Z14
echo "katalogi na pierwszym poziomie $1, nazwa od Z, kopiowanie do $2"
find $1 -maxdepth 1 -type d -name "Z*" -exec cp -r {} $2 \;





