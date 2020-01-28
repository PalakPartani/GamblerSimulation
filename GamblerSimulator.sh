#!/bin/bash
calcPercent()
{
	percent=$(($STAKE*50/100))
	minVal=$(($STAKE-$percent))
	maxVal=$(($STAKE+$percent))
}

checkBet() {
	#for 20 days
	calcPercent
	#if taken inside for loop then it will go upto amount 50 only
	win=0
	loss=0
	for ((i=1;i<=20;i++))
	do
	cash=$STAKE
		
	while (($cash>$minVal && $cash<$maxVal))
	do
		if (($((RANDOM%2))==1))
		then
			cash=$(($cash+$BET))
		else
			cash=$(($cash-$BET))
		fi
	done
#Adding values in dictionary named gamblerDict
gamblerDict[$i]=$(($cash-$STAKE))
done
}
echo "Welcome to Gambler Simulation !"
#Declaring constants
readonly STAKE=100
readonly BET=1
checkBet
echo "Days   " ${!gamblerDict[@]}
echo "Amount W or L" ${gamblerDict[@]}

