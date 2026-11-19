import random


#Losowanie danych wejściowych
def generuj_strony(liczba=1000, zakres_stron = 9): #1000 liczb z zakresu 0-9
    strony=[]
    for i in range(liczba):
        strony.append(random.randint(0, zakres_stron)) 
    return strony

strony = generuj_strony()


def first_in_first_out(strony, liczba_ramek):
    ramki=[]
    bledy_strony=0
    
    #dla kazdej strony w liscie
    for strona in strony:
        #jezeli strony nie ma w ramkach
        if strona not in ramki:
            #jezeli ramki sa pelne
            if len(ramki) == liczba_ramek:
                ramki.pop(0) #usuwamy pierwsza strone z ramki

            ramki.append(strona) #dodajemy strone do ramki
            bledy_strony+=1

    procent_bledow = (bledy_strony / len(strony)) * 100 #obliczamy procent bledow

    with open("fifo_results.txt", "a") as f: #otwieramy plik w trybie append (dopisywanie)
        f.write(f"\nLiczba stron: {len(strony)}, liczba ramek: {liczba_ramek}\n") #dodajemy do pliku linijke
        f.write(f"Bledy strony: {bledy_strony}\n") 
        f.write(f"Procent bledow: {procent_bledow}%\n")


def least_recently_used(strony, liczba_ramek):
    ramki=[]
    bledy_strony=0
    
    #dla kazdej strony w liscie
    for strona in strony:
        #jezeli strony nie ma w ramkach
        if strona not in ramki:
            #jezeli ramki sa pelne
            if len(ramki) == liczba_ramek:
                ramki.pop(0) #usuwamy pierwsza strone z ramki
            ramki.append(strona) #dodajemy strone do ramki
            bledy_strony+=1
        else:
            #jezeli strona jest w ramkach, musimy odswiezyc jej pozycje
            ramki.remove(strona)
            ramki.append(strona)

    procent_bledow = (bledy_strony / len(strony)) * 100 #obliczamy procent bledow

    with open("lru_results.txt", "a") as f: #otwieramy plik w trybie append (dopisywanie)
        f.write(f"\nLiczba stron: {len(strony)}, liczba ramek: {liczba_ramek}\n") #dodajemy do pliku linijke
        f.write(f"Bledy strony: {bledy_strony}\n") 
        f.write(f"Procent bledow: {procent_bledow}%\n")
    





open("fifo_results.txt", "w").close() #wyczysszczenie pliku z wynikami
first_in_first_out(strony, 1)
first_in_first_out(strony, 3)
first_in_first_out(strony, 5)
first_in_first_out(strony, 7)    

open("lru_results.txt", "w").close()  # wyczyszczenie pliku z wynikami
least_recently_used(strony, 1)
least_recently_used(strony, 3)
least_recently_used(strony, 5)
least_recently_used(strony, 7)



