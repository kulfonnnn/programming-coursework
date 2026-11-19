#!/bin/bash


licznikslowek() {
	
	#sprawdzanie pliku wejsciowego
	if [[ ! -r $1 ]]; then
		echo "Nie masz uprawnien do czytania pliku $1 lub plik nie istnieje" >&2
		exit 1
	fi

	#sprawdzanie pliku wyjsciowego
	if [[ -e $2 ]]; then
		if [[ ! -w $2 ]]; then
			echo "Nie masz uprawnien do modyfikowania pliku $2" >&2
			exit 1
		fi
	else
		if ! touch $2 2>/dev/null; then #przekierowanie komunikatu bledu do "czarnej dziury"
			echo "Plik $2 nie istnieje i nie mozna go utworzyc"
			exit 1
		fi
	fi

	#dane to zawartosc pliku, gdzie kazdy ciag spacji/tabulatorow zmienil sie w entera	
	dane=$(tr -s '[:blank:]' '\n' < $1)

	#deklaracja tablicy asocjacyjnej
	declare -A licznik


	#dodanie slow do tablicy jako klucze i wartosci licznika
	for slowo in $dane; do
		((licznik["$slowo"]++))
	done
	

	#wypisanie tablicy 
	for slowo in "${!licznik[@]}"; do
		echo "$slowo" "${licznik[$slowo]}"
	done  | sort -n -r -k2 > $2



}

licznikslowek input.txt output.txt

