#!/usr/bin/env bash
echo "Irvin's RainbowTable Cracking Program in Bash"
echo "Rainbow Tables can be downloaded here: https://infocon.org/rainbow%20tables/"
echo "Passwords can be generated at https://www.tobtu.com/lmntlm.php"
echo "Tables can also come from https://freerainbowtables.com/"
echo "What is the hash you are cracking?"
read hash
input=$(grep -i $hash results.txt)
search=$(echo "${input^^}")
match=$(echo $search | awk -F: '{print $1}')
	if [[ $match == $hash ]]; then
                answer=$(echo $search | awk -F: '{print $2}')
                echo "The password is" $answer
	else
		./rcracki_mt -t 4 -o results.txt -h $hash ~/git/rt/
	fi
