*** Settings ***
Library   pyta.py
Library   SSHLibrary


*** Variables ***
${TROSZKE_INACZEJ}   chcialem zeby mi wypisal tenze teks i zobacze co wyrzuci
${HOST}   localhost
${LOGIN}   kris
${HASLO}   ${SPACE}



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

Zamknij polaczenia
   Close Connection
