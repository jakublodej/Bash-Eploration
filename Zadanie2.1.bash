#!/bin/zsh

# Sprawdzenie czy wprowadzone argumenty są mniejsze od 1 
if [ $# -lt 1 ] 

then
	#Powinno być $1
        echo "Poprawna skladnia: $0 katalog1 katalog2 ..."	
	#Zamknięcie terminalu
        exit 1												
fi
#Deklaracja zmiennej od której rozpoczynamy pętlę warunkową while
n=0				
#Pętla warunkowa while, dopóki $1 jest argumentem, pętla jest wykonywana
while [ $1 ]		
do
	#Sprawdzenie czy plik jest katalogiem
        if [ -d $1 ]							
        then
			#Pobranie całej ściezki katalogu
			fullpath=$(readlink -f $1)
			#Wyświetlenie na ekranie ściezki katalogu
			echo $fullpath
			#Kontynuowanie pętli (dodawanie do n kolejnych argumentów)
			n=$((n+1))							
        else
			#Wyświetlenie informacji gdy podany argument nie jest katalogiem
			echo "$1 - nie jest katalogiem"				
        fi
        #Przejście na kolejny argument
        shift								
done


# przykłady użycia 
#Zamknięcie terminalu
# kuba@kuba-VirtualBox:~$. katalogi

#Wyświetli się informacja że check nie jest katalogiem
# kuba@kuba-VirtualBox:~$. katalogi check    ->  check nie jest katalogiem 

#Wyświetli się poprawny katalog
# kuba@kuba-VirtualBox:~$. katalogi Dokumenty Zdjęcia Filmy      ->>>
#			->/home/kuba/Dokumenty
#			->/home/kuba/Zdjęcia
#			->/home/kuba/Filmy

#Wyświetli się katalog z błędem
# kuba@kuba-VirtualBox:~$. katalogi Dokumenty Zdjęcia Filmy check      ->>>
#			->/home/kuba/Dokumenty
#			->/home/kuba/Zdjęcia
#			->/home/kuba/Filmy
#			-> check nie jest katalogiem 

