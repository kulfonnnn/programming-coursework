#!/bin/bash


file_destroyer() {

	#sprawdzamy, czy mozemy odczytac plik wejsciowy
	if [[ ! -r $1 ]]; then
		echo "Nie masz uprawnień do odczytania pliku $1" >&2
		exit -1
	fi
	
	#spradzamy pierwszy plik wyjsciowy
	if [[ -e $2 ]]; then
		echo "" > $2
		if [[ ! -w $2 ]]; then
			echo "Nie masz uprawnień do modyfikowania pliku $2" >&2
			exit -1
		fi
	else
		touch $2
	fi

	#drugi plik wyjsciowy
	if [[ -e $3 ]]; then
		echo "" > $3
		if [[ ! -w $3 ]]; then
			echo "Nie masz uprawnień do modyfikowania pliku $3" >&2
			exit -1
		fi
	else
		touch $3
	fi

	
	#przenoszenie linijek

	while IFS= read -r linia; do
		if [[ $((RANDOM % 2)) -eq 0 ]]; then
			echo "$linia" >> $2
		else
			echo "$linia" >> $3
		fi
	done < "$1"

}

katalogomaker() {

	#sprawdzanie poprawnosci sciezki do katalogu
	if [[ ! -d $1 ]]; then
		echo "Katalog $1 nie istnieje, lub nie jest to katalog." >&2
		return 1
	fi

	#sprawdzanie, czy mam uprawnienia do edytowania katalogu
	if [[ ! -w $1 ]]; then
		echo "Nie masz uprawnień do edytowania katalogu $1" >&2
		return 1
	fi
	

	#sprawdzenie uprawnień do odczytywania pliku z nazwami podkatalogów
	if [[ ! -r $2 ]]; then
		echo "Nie masz uprawnień do odczytywania pliku $2" >&2
		return 1
	fi



	#tworzenie podkatalogów
	while IFS= read -r linia; do #<- rozdziela po linijakch
    		mkdir "$1"/"$linia"
	done < nazwy.txt

	#tworzenie plików w podkatalogach
	for katalog in $(ls $1); do
		for ((i=0; i<10; i++)); do
			touch "$1""/""$katalog""/F""$i"
		done
	done

}



file_destroyer inn.txt out1.txt out2.txt

katalogomaker folderr nazwy.txt
