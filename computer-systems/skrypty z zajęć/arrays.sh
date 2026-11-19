#!/bin/bash



bombelki() {

        local tablicaa=$@
        local tablica=()
        for zmienna in $tablicaa; do
                if ! [[ "$zmienna" =~ ^-?[0-9]+$ ]]; then
                        echo "Podano liczbe, ktora nie jest calkowita"
                        exit
                fi
                tablica+=($zmienna)
        done

        echo "tablica do sortowania:"
        echo ${tablica[@]}

        local n=$#
        for ((i=0; i<n; i++)); do
                for ((j=0; j<n-1; j++)); do
                        if (( tablica[j] > tablica[j+1] )); then
                                temp=${tablica[j]}
                                tablica[j]=${tablica[j+1]}
                                tablica[j+1]=$temp

                        fi
                done
        done
        echo "Posortowana tablica:"
        echo ${tablica[@]}
}



fat_array() {

        if ! [[ $# -eq 2 ]]; then
                echo "Podano zla liczba argumentow"
                exit
        fi

        local tablica=$@
        for zmienna in $tablica; do
                if ! [[ "$zmienna" =~ ^[0-9]+$ ]]; then
                        echo "Podano liczbe, ktora nie jest calkowita i dodatnia"
                        exit
                fi
        done



        x=$1
        y=$2
        echo "tabliczka mnozenia $x x $y"

        for ((i=1; i<=x; i++)); do
                for ((j=1; j<=y; j++)); do
                        wynik=$((i*j))
                        echo -n "$wynik "
                done
                echo
        done

}





caleczka() {

        local tablica=$@
        for zmienna in $tablica; do
                if ! [[ "$zmienna" =~ ^-?[0-9]*\.?[0-9]*$ ]]; then
                        echo "Podano liczbe, ktora nie jest rzeczywista"
                        exit
                fi
        done

        h=1 #predefiniowanie zgodne z poleeniem
        suma=0
        for ((i=1; i<$#; i++)); do
                a=${!i}
                j=$((i+1))
                b=${!j}
                trapez=$(echo "( $a + $b ) * $h / 2" | bc -l)
                suma=$(echo "$suma + $trapez" | bc -l)
        done
	echo "caleczka = $suma"

}







bombelki 43 1 5 3 69
fat_array 5 4
caleczka 2 4 6 

