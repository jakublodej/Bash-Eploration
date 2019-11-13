#!/bin/zsh

if [ $# -lt 1 ] 					#sprawdza czy podane zostaly jakies arg / sprawdza czy liczba jest mniejsza od jedynki
then
        echo "Poprawna skladnia: $0 katalog1 katalog2 ..."	#jeśli jest $0 to wypisz i
        exit 1												# zamyka terminal 
fi

n=0													# nie wiem po co jest tu umieszczona ta zmienna, pewnie aby ułatwić dalsza czesc zadania
while [ $1 ]										#sprawdzamy dopuki na $1 jest jakis argument
do
        if [ -d $1 ]							# -d plik sprawdza czy plik jest katalogiem 
        then
			fullpath=$(readlink -f $1)			#pobiera cala sciezke katalogu
			echo $fullpath						#wypisuje na ekran sciezke
			n=$((n+1))							#dodajemy do n plus jeden
        else
			echo "$1 - nie jest katalogiem"				# gdy podany argument nie jest katalogiem wypisz 
        fi
       
        shift								#powoduje przesuniecie sie na kolejny arg 
done


# przykłady użycia 
# pawel@pawel-VirtualBox:~$. katalogi        -> spowoduje zamkniecie terminalu
# pawel@pawel-VirtualBox:~$. katalogi adb     ->  adb nie jest katalogiem        * nie ma takiego katalogu w bieżacym miejscu
# pawel@pawel-VirtualBox:~$. katalogi Dokumenty Myzuka Obrazy adb     ->>>
#			->/home/pawel/Dokumenty
#			->/home/pawel/Muzyka
#			->/home/pawel/Obrazy
#			->adb nie jest katalogiem

