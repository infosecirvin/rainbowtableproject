#!/usr/bin/env bash
while test $# -gt 0; do
		case "$1" in
			-a)
				shift
				./rcracki_mt -t 4 -o results.txt -h $1 ~/git/rt/tables/
				shift
				;;
			-b)
		 		shift
				./rcracki_mt -d -t 4 -o results.txt -h $1 ~/git/rt/mysqlsha1/
				shift
				;;
		esac
	done
