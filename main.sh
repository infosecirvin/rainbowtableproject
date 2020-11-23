#!/usr/bin/env bash
echo "What is your LM hash?"
read hash
./rcracki_mt -h $hash ~/rt/lanman
