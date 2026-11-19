import csv  # Wbudowany moduł do pracy z plikami CSV

def load_csv_as_lists(file_path):
    # Tworzymy trzy puste listy do przechowywania danych procesów
    ids, arrivals, bursts = [], [], []

    # Otwieramy plik CSV w trybie odczytu
    with open(file_path, mode='r') as file:
        reader = csv.DictReader(file)  # Tworzymy czytnik, który zwraca wiersze jako słowniki

        for row in reader:
            # Dodajemy identyfikator procesu do listy 'ids'
            ids.append(row['ProcessID'])

            # Konwertujemy czas przybycia do int i dodajemy do listy 'arrivals'
            arrivals.append(int(row['ArrivalTime']))

            # Konwertujemy czas trwania (burst time) do int i dodajemy do listy 'bursts'
            bursts.append(int(row['BurstTime']))

    # Zwracamy trzy listy: identyfikatory, czasy przybycia i czasy wykonania
    return ids, arrivals, bursts

# Tworzymy tablice z danmi  z pliku CSV
ids, arrivals, bursts = load_csv_as_lists('processes_1000.csv')


#skróty: id - id procesu, at - czas przybycia, bt - czas wykonania (burst time), ct - czas zakończenia, wt - czas oczekiwania, tat - całkowity czas wykonania


def first_come_first_served(id, at, bt):
    ct=[]
    wt=[]
    tat=[]
    current_time=0
    # Inicjalizujemy zmienną 'time' na 0, aby śledzić czas wykonania

    #obliczamy parametry dla pierwszego procesu
    ct.append(at[0]+bt[0]) #czas wykonania to czas przybycia + czas wykonania
    wt.append(0)
    tat.append(bt[0]+wt[0]) #=bt
    current_time=ct[0] #przesuwamy sie w czasie na czas zakończenia pierwszego procesu


    #dla każdego procesu (poza pierwszym) 
    for i in range(1, len(id)):
        #jesli proces przybył po zakończeniu poprzedniego (procesor był wolny)
        if at[i]>current_time:
            current_time=at[i] #to przesuwamy czas na czas przybycia procesu

        #obliczamy parametry
        wt.append(current_time-at[i])
        ct.append(current_time+bt[i])
        tat.append(ct[i]-at[i])

        #przesuwamy sie w casie na czas zakończenia procesu
        current_time=ct[i]

    #oblcizamy sredni czas oczekiwania i czas wykonania 
    #dla różnych przedziałów czasowych, aby lepiej zobrazować wyniki
    avg_wt_25 = sum(wt[:25]) / 25
    avg_tat_25 = sum(tat[:25]) / 25

    avg_wt_100 = sum(wt[:100]) / 100
    avg_tat_100 = sum(tat[:100]) / 100

    avg_wt_500 = sum(wt[:500]) / 500
    avg_tat_500 = sum(tat[:500]) / 500

    avg_wt_1000=sum(wt)/len(wt)
    avg_tat_1000=sum(tat)/len(tat)

    #obliczanie maksymalnego opozniania i  czasu wykonania
    max_wt = max(wt)
    max_tat = max(tat)

    with open("fcfs_results.txt", "w") as f: #otwieramy plik w trybie write (nadpisuje aktualna zawartość)
        f.write(f"average_waiting_time_25: {avg_wt_25}\n") #dodajemy do pliku linijke
        f.write(f"average_turnaround_time_25: {avg_tat_25}\n")
        f.write(f"average_waiting_time_100: {avg_wt_100}\n")
        f.write(f"average_turnaround_time_100: {avg_tat_100}\n")
        f.write(f"average_waiting_time_500: {avg_wt_500}\n")
        f.write(f"average_turnaround_time_500: {avg_tat_500}\n")
        f.write(f"average_waiting_time_1000: {avg_wt_1000}\n") 
        f.write(f"average_turnaround_time_1000: {avg_tat_1000}\n")
        f.write(f"max_waiting_time: {max_wt}\n")
        f.write(f"max_turnaround_time: {max_tat}\n")
        


def shortest_job_first(id, at, bt):
    current_time=0
    completed = 0 #liczba zakonczonych procesów
    done = [False] * len(id) #tablica, która mówi, czy proces został już wykonany
    ct = [0] * len(id) #tablica do przechowywania czasu zakończenia
    wt = [0] * len(id) #tablica do przechowywania czasu oczekiwania
    tat = [0] * len(id) #tablica do przechowywania całkowitego czasu wykonania
    index = 0 #indeks procesu, który ma być wykonany
   

    #dopóki jakiś proces oczekuje na wykonanie
    while completed < len(id):
        max_burst = float('inf')
        found=False
        #szukamy procesu o najkrótszym czasie wykonania, który przybył przed aktualnym czasem i nie został jeszcze wykonany
        for i in range(len(id)):
            if at[i] <= current_time and bt[i] < max_burst and not done[i]:
                max_burst = bt[i]
                index = i
                found=True

        #jeśli nie znaleziono procesu, to przesuwamy czas o 1 do przodu i przerywamy iterację
        if found==False:
            current_time += 1
            continue

        #jesli znaleziono proces, to wykonujemy go i obliczamy czasy
        ct[index] = current_time + bt[index]
        wt[index] = current_time - at[index]
        tat[index] = ct[index] - at[index]

        current_time = ct[index] #przenosimy czas na czas zakończenia procesu
        done[index] = True #oznaczamy proces jako wykonany
        completed += 1

    #oblcizamy sredni czas oczekiwania i czas wykonania 
    avg_wt=sum(wt)/len(wt)
    avg_tat=sum(tat)/len(tat)

    #obliczanie maksymalnego opoznienia i  czasu wykonania
    max_wt = max(wt)
    max_tat = max(tat)

    with open("sjf_results.txt", "a") as f: #otwieramy plik w trybie append (dopisywanie)
        f.write(f"average_waiting_time_{len(id)}: {avg_wt}\n") #dodajemy do pliku linijke
        f.write(f"average_turnaround_{len(id)}: {avg_tat}\n")
        if len(id) == 1000:
            f.write(f"max_waiting_time: {max_wt}\n")
            f.write(f"max_turnaround_time: {max_tat}\n")

    

first_come_first_served(ids, arrivals, bursts) #wywołanie funkcji fcfs


open("sjf_results.txt", "w").close() #wyczysszczenie pliku z wynikami
#wywołanie funkcji sjf dla różnej ilości procesów
shortest_job_first(ids[:25], arrivals[:25], bursts[:25])
shortest_job_first(ids[:100], arrivals[:100], bursts[:100])
shortest_job_first(ids[:500], arrivals[:500], bursts[:500])
shortest_job_first(ids, arrivals, bursts)
