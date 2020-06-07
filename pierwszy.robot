*** Settings ***
Library   pyta.py
Library   SSHLibrary
Library   Collections
Library   Impansible

*** Variables ***
${TROSZKE_INACZEJ}   chcialem zeby mi wypisal tenze teks i zobacze co wyrzuci
${HOST}   localhost
${LOGIN}   kris
${HASLO}   jakies haslo
${ansible_become_password}   jakies haslo
${ansible_user}   kris

*** Test Cases ***
kinder test dnia dzisiejszego
   Log to console   ale dzis zimno, i pada deszcz ale nie wiadomo co

Kolejny test case dla celów naukowych
   Log to console   ${TROSZKE_INACZEJ}

Pisze nastepny test, daje sporo teskstu dla celow naukowych rzecz jasna
   Wyswietlanie napisu   mialem dzis sie uczyc roboto, kolejny przypadek testowy.


Sprawdzam test z pliku pyta.py ktory jest w tym samym folderze i to wlasnie testuje
   ${jakas_zmienna_jakas_nazwa}=   polacz   ala   kota
   Should Be Equal   ${jakas_zmienna_jakas_nazwa}   ala ma kota

Test SSH localhost
    Nawiazuje polaczenie z serverem

    Autoryzacja, wpisuje haslo, logujemy sie do komputera zewnetrzenego

    Wpisuje uname -a, aby uzyskac informacje na temat uzyskanego polaczenia

    Zamknij polaczenia

Test SSH localhost ktrory sprawdza przez funkcje ping i zaraz zobaczymy jak to dziala
   Nawiazuje polaczenie z serverem

   Autoryzacja, wpisuje haslo, logujemy sie do komputera zewnetrzenego

   Wpisuje funkcje ping, aby uzyskac informacje na temat uzyskanego polaczenia

   Zamknij polaczenia

Tescik ktory liczy ile procesorow jest w komputerze
   Nawiazuje polaczenie z serverem

   Autoryzacja, wpisuje haslo, logujemy sie do komputera zewnetrzenego

   Wpisuje /proc/cpuinfo/ i korzystam z grepa przy okazji

   Zamknij polaczenia

Przypadek testowy number8
   ${xy}=   Setup   localhost
   #Log To Console   ${xy}
   #zaciagam z tej biblioteki xy i przypisuje do x1
   ${x1}=   Get From Dictionary   ${xy}   ansible_facts
   #Log To Console   ${x1}
   #tworze nowa zmienna zaciagajac dane z x1
   ${y1}=   Get From Dictionary   ${x1}   ansible_distribution
   Log To Console   ${y1}
   Should Be Equal   ${y1}   Ubuntu


*** Keywords ***
Wyswietlanie napisu
   [Arguments]   ${tekst_jakis}
   Log to console   ${tekst_jakis}

Nawiazuje polaczenie z serverem
   Open Connection   ${HOST}

Autoryzacja, wpisuje haslo, logujemy sie do komputera zewnetrzenego
   Login   ${LOGIN}   ${HASLO}

Wpisuje uname -a, aby uzyskac informacje na temat uzyskanego polaczenia
   ${output}=   Execute Command   uname -a
   Should Contain   ${output}   GNU/Linux

Wpisuje funkcje ping, aby uzyskac informacje na temat uzyskanego polaczenia
#8semka na koncu to tak ma byc bo jak jest polaczenie w porzadku to nie wywala
#tej informacji o 100% loss, bo nie ma jej komu odbierac, w kazdym razie dlatego
#jest should not contain
   ${oppp}=   Execute Command   ping -c1 8.8.8.8
   Should Not Contain   ${oppp}   100% packet loss


Wpisuje /proc/cpuinfo/ i korzystam z grepa przy okazji
   ${kiko}=   Execute Command   cat /proc/cpuinfo | grep processor | wc -l
   Should Be Equal   ${kiko}    1

Zamknij polaczenia
   Close Connection
