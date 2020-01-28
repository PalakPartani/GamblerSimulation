#!/bin/bash
calculatePercent()
{
	percent=$(($STAKE*50/100))
	minVal=$(($STAKE-$percent))
	maxVal=$(($STAKE+$percent))
}

checkBet() {
	#for 20 days
	calculatePercent
	#if taken inside for loop then it will go upto amount 50 only
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

#Adding daily amount that is win or loss 
addValues(){

	i=2
	while ((i<=20))
	do
		gamblerDict[$i]=$((${gamblerDict[$i]}+${gamblerDict[$((i-1))]}))
		((i++))
	done
	echo  ${!gamblerDict[@]}
	echo  ${gamblerDict[@]}
}

#checking the day where amount is greatest or lowest
checkLuck() {
	addValues
	echo "Luckiest day : "
	for day in ${!gamblerDict[@]}
	do
    		echo $day ${gamblerDict[$day]}
	done | sort -k2 -rn | head -n 1

	echo "unluckiest day :"
	for day in ${!gamblerDict[@]}
	do
     		echo $day ${gamblerDict[$day]}
	done | sort -k2 -n | head -n 1

}
checkWinRepeat()
{
	while((${gamblerDict[20]}>0))
	do
		checkBet
		checkLuck
	done
	echo "Sorry!Can't Play!"
}
		
echo "Welcome to Gambler Simulation !"
#Declaring constants
readonly STAKE=100
readonly BET=1
checkBet
checkLuck
checkWinRepeat
