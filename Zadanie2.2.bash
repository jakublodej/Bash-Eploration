#!/bin/zsh

if [ $# -lt 1 ]
then
        echo "Poprawna skladnia: $0 katalog1 katalog2 ..."
        exit 1
fi

echo "Liczba argumentow: $#"
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
				echo "$1 - nie jest katalogiem"
				if [ ! -f $1 ]
				then
				echo "$1 - nie jest plikiem"
			fi
			n=$((n+1))
        fi
       
        shift
done
echo "Znaleziono katalogow: $n"
echo "Katalogow bylo: $x"































