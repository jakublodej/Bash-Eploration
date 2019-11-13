#!/bin/zsh

if [ $# -lt 1 ]
then
        echo "Poprawna skladnia: $0 katalog1 katalog2 ..."
        exit 1
fi

n=0
x=0
while [ $1 ]
do
        if [ -d $1 ]
        then
			fullpath=$(readlink -f $1)
			echo $fullpath
			n=$((n+1))
			x=$((x+1))
        else
			if[ -s $1 ]
			then
				echo "$1 to jest plik innego typu"
			else
				echo "$1 - nie jest katalogiem ani plikiem"
			fi
			n=$((n+1))
        fi
       
        shift
done
echo "Wszystkich argumentow bylo: $n"
echo "Katalogow bylo: $x"


#jedyne nad czym się zastanawialem to jak okreslic czy argument jest plikiem innego typu. czy to jest rozwiazanie nie wiem jak trzeba tez sprawdzic -f, -c, -b, -p, -h to mozna to zrobic za pomoca case i wypisywac w zaleznosci co za typ pliku to byl