#!/bin/bash
calcPercent()
{
	percent=$(($STAKE*50/100))
	minVal=$(($STAKE-$percent))
	maxVal=$(($STAKE+$percent))
}

checkBet() {
	calcPercent
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
echo "Cash for the day : " $cash
}

echo "Welcome to Gambler Simulation !"
#Declaring constants
readonly STAKE=100
readonly BET=1
checkBet

