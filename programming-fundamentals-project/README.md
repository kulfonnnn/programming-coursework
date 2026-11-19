# Spacery w ogrodzie - symulacja ruchu zwierząt

Aplikacja desktopowa w Pythonie symulująca poruszanie się myszy oraz trzech typów kotów po ogrodzie o wymiarach 100 x 100 (100 iteracji na dzień) wraz z podglądem wydeptanych ścieżek w GUI (tkinter + matplotlib).

## Zasady symulacji
- Mysz (Mouse) - wykonuje ruch o [-1, 1] na osi X i Y; przy zbliżeniu na dystans mniejszy niż 4 do kota wraca do punktu startowego (home_x, home_y).
- Kot przeciętniak (Cat) - porusza się o [-10, 10] i przegania pobliskie myszy do ich domu.
- Kociak (Kitten) - porusza się o [-5, 5]; jeśli oddali się od domu na dystans większy niż 50 i spotka mysz, wraca do pudełka, w przeciwnym razie odsyła mysz.
- Kot leniuch (Lazy_cat) - porusza się o [-10, 10], a szansę na przegonienie myszy liczy ze wzoru 1 / (1 + e^(-0.1 * n)), gdzie n to liczba dotychczasowych sukcesów.

## Wymagania i uruchomienie
1. Zainstaluj matplotlib (tkinter jest zazwyczaj wbudowany w Pythona):
   pip install matplotlib
2. W folderze ze skryptem umieść pliki ze współrzędnymi startowymi (x y w zakresie 0-100, jedna para na linię; brak pliku lub błędne wartości są obsłużone):
   - mouse.txt
   - cat.txt
   - kitten.txt
   - lazy_cat.txt
3. Uruchom skrypt:
   python nazwa_pliku.py

## Obsługa interfejsu
- Zobacz wydeptane ścieżki! - pokazuje wykres ścieżek w oknie aplikacji.
- Zobacz symulację z następnego dnia - resetuje pozycje do punktów startowych i uruchamia kolejne 100 iteracji.
- Zamknij program - zamyka okno.
