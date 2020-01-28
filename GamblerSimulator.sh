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
	#if taken inside for loop then it win go upto amount 50 only
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
		if (( $cash > 100 ))
		then
		 	win=$(( $win + 50 ))
		else	
       		        loss=$(( $loss + 50 )) 	
	fi	

done
echo "Total winning amount : $win"
echo "Total losing amount :  $loss "
}

echo "Welcome to Gambler Simulation !"
#Declaring constants
readonly STAKE=100
readonly BET=1
checkBet

