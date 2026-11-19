#!/bin/bash


#Z1
echo "Znalezniska zad 1"
grep -P -o "(?<=^|\s)0x[a-fA-F0-9]+(?=$|\s)" $1


#Z2
echo "Znaleziska zad 2:"
grep -P -o "(?<=^|\s)[a-zA-Z0-9.,;:]+@[-a-zA-Z0-9]+\.[a-zA-Z0-9.-]+(?=$|\s)" $1



#Z3
echo "Znaleziska zad 3"
grep -P -o "(?<=^|\s)[+-]?[0-9]*\.[0-9]+(?=$|\s)" $1

