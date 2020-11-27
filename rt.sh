#!/usr/bin/env bash
function prep() {
	hash=$(echo "${a^^}")
	input=$(grep -i $hash results.txt)
	search=$(echo "${input^^}")
	match=$(echo $search | awk -F: '{print $1}')
}

function yes() {
	answer=$(echo $search | awk -F: '{print $2}')
	echo "The password is: " $answer
}

function no() {
	nul=$(./rcracki_mt -t 4 -o results.txt -h $hash ~/git/rt/)
}


while test $# -gt 0; do
		case "$1" in
			-a)
				shift
				a=$1
				prep
				if [[ $match == $hash ]]; then
					yes
				else
						no
						prep
						yes
				fi
				shift
				;;
		esac
	done
