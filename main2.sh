#!/usr/bin/env bash
echo "Irvin's RainbowTable Cracking Program in Bash"
echo "Rainbow Tables can be downloaded here: https://infocon.org/rainbow%20tables/"
echo "What type of hash are you cracking?"
echo "1) LM"
echo "2) MySQL or SHA1"
echo "3) MD5"
echo "4) NTLM"
read choice

echo "What is the hash?"
read hash
input=$(grep -i $hash results.txt)
search=$(echo "${input^^}")
match=$(echo $search | awk -F: '{print $1}')
	if [[ $match == $hash ]]; then
                answer=$(echo $search | awk -F: '{print $2}')
                echo "The password is" $answer
	elif [[ $match != $hash && $choice == 1 ]]; then
		./rcracki_mt -o results.txt -h $hash ~/git/rt/lanman/
	elif [[ $match != $hash && $choice == 2 ]]; then
		echo "mysqlsha"
	elif [[ $match != $hash && $choice == 3 ]]; then
		echo "md5"
	elif [[ $match != $hash && $choice == 4 ]]; then
		echo "ntlm"
	fi
