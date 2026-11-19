#!/bin/bash



obliczonka() {
	
x=$1
y=$2
licznik=$(( x + y ))
mianownik=$(( x - y ))
if [[ $mianownik -eq 0 ]]; then
	exit -1
else
	echo "Wynik zad1:"
	echo $((licznik / mianownik))
	echo
fi
}



silnia() {
	
	if [[ $# -ne 1 ]]; then
		exit -1
	else
		if (( $1 <= 1 )); then
			echo 1
		else
			poprzednia_silnia=$(silnia $(( $1 - 1 )))
			echo $(($1 * poprzednia_silnia))
		fi
	fi

}


silnia2() {
	if [[ $# -ne 1 ]]; then
		exit -1
	else
		wynik=1
		for ((i=2; i<=$1; i++)); do
			wynik=$((i * wynik))
		done
		echo "Silnia wynosi $wynik"
	fi
	}	

suma_arg() {

	tablica=$@
	
		suma=0
		for zmienna in $tablica; do
			if [[ "$zmienna" =~  ^-?[0-9]+$ ]]; then
				suma=$(( zmienna + suma))
			else
				echo "Liczba nie jest calkowita, podawaj tylko calkowite argumenty"
				exit -1
			fi
		done
		echo "Suma wynosi $suma"
}

	
obliczonka $1 $2
echo "Silnia wynosi"
silnia 4
silnia2 4

suma_arg 5 2 3 



