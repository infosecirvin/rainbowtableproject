#!/usr/bin/env bash

function lm {
	echo "What is the LM hash?"
	read lmhash
	input=$(grep -i $lmhash results.txt)
	search=$(echo "${input^^}")
	match=$(echo $search | awk -F: '{print $1}')
	if [ $match == $lmhash ]
		then
		answer=$(echo $search | awk -F: '{print $2}')
		echo "The password is" $answer
	else
		./rcracki_mt -o results.txt -h $lmhash ~/git/rt/lanman/
	fi
}

function sha {
	echo "What is the MySQL or SHA1 hash?"
	read shahash
	input=$(grep -i $shahash results.txt)
        search=$(echo "${input^^}")
        match=$(echo $search | awk -F: '{print $1}')
        if [ $match == $shahash ]
                then
                answer=$(echo $search | awk -F: '{print $2}')
                echo "The password is" $answer
        else
                ./rcracki_mt -o results.txt -h $shahash ~/git/rt/mysqlsha1/
        fi
}

function ntlm {
	echo "ntlm"
}

echo "Rainbow Tables can be downloaded here: https://infocon.org/rainbow%20tables/"
echo "What type of hash are you cracking?"
echo "1) LM"
echo "2) MySQL or SHA1"
echo "3) NTLM"

read choice
if [[ $choice == 1 ]]; then
	lm
elif [[ $choice == 2 ]]; then
	sha
elif [[ $choice == 3 ]]; then
	ntlm
fi
