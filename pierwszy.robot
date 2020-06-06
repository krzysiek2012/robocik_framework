*** Settings ***
Library   pyta.py

*** Variables ***
${TROSZKE_INACZEJ}   chcialem zeby mi wypisal tenze teks i zobacze co wyrzuci

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


*** Keywords ***
Wyswietlanie napisu
   [Arguments]   ${tekst_jakis}
   Log to console   ${tekst_jakis}
