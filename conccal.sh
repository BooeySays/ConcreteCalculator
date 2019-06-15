#!/bin/bash

__version__=1.0

function __conc_title(){
	clear
	echo -en """
 The \"How Much Concrete Do We Need To Order\" Calculator v"$__version__"
"""
	printf "\e[01;38;5;196m"
	printf '⎺%.s' $(seq 1 $COLUMNS)
	printf "\e[m\n"
}

function __conc_mainmenu(){
	__conc_title
	echo -en """
\e[38;5;15mAre you pouring for :

	\e[38;5;47m[\e[38;5;15m1\e[38;5;47m]\e[38;5;15m	A box? (Area= Height x Width x Depth)
	\e[38;5;47m[\e[38;5;15m2\e[38;5;47m]\e[38;5;15m	A ramp? (Area = [(H x W x D)÷2])

: """
	read -n 1 -r CONC_MAINMENU
	case $CONC_MAINMENU in
	1)
		__conc_cal_box
		unset CONC_MAINMENU
		;;
	2)
		__conc_cal_ramp
		unset CONC_MAINMENU
		;;
	*)
		echo -en """


ERROR: Invalid Selection. Please try again.

[ Press any key to try again or CTRL+C to exit ]

"""
		read
		unset CONC_MAINMENU
		__conc_mainmenu
		;;
	esac
}
