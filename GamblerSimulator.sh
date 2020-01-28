#!/bin/bash
checkBet() {
	if (($((RANDOM%2))==1))
		then
			echo "Win!"
		else
			echo "Lose!"
		fi

}

echo "Welcome to Gambler Simulation !"
#Declaring constants
readonly STAKE=100
readonly BET=1
checkBet

