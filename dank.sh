#!/bin/bash

#-----------------------------------------------------------------------------------------------------------------#
#                                                                                                                 #
#                                                                                                                 #
#          ________  ________  ________   ___  __            ________  ________      ________                     #    
#         |\   ___ \|\   __  \|\   ___  \|\  \|\  \         |\   ___ \|\   __  \    |\   ___ \                    #
#         \ \  \_|\ \ \  \|\  \ \  \\ \  \ \  \/  /|_       \ \  \_|\ \ \  \|\  \  /\ \  \_|\ \                   #
#          \ \  \ \\ \ \   __  \ \  \\ \  \ \   ___  \       \ \  \ \\ \ \__     \/  \ \  \ \\ \                  #
#           \ \  \_\\ \ \  \ \  \ \  \\ \  \ \  \\ \  \       \ \  \_\\ \|_/  __     /\ \  \_\\ \                 # 
#            \ \_______\ \__\ \__\ \__\\ \__\ \__\\ \__\       \ \_______\/  /_|\   / /\ \_______\                #
#             \|_______|\|__|\|__|\|__| \|__|\|__| \|__|        \|_______/_______   \/  \|_______|                #
#                                                                        |_______|\__\                            #
#                                                                                \|__|                            #
#                                                                                                                 #
#                                                                                                                 #
#-----------------------------------------------------------------------------------------------------------------#
# This is a text based game that will save if/then and case constructs to callable functions to sequence a story  #
# Some if/then constructs will be resolved using a simulated 20 sided die popularized by dungeons and dragons.    #
#-----------------------------------------------------------------------------------------------------------------#

#Declare variables and functions

name=$(whoami) #stores username to the variable $name
function install() #installs packages needed to draw the ascii banner
                {
                    echo -e "Dank D&D requires the installation of dependencies.
                                \n(a)Install dependencies
                                \n(b)I already have them installed
                                \n(c)I do not wish to install them"
                    read ANSWER
                    case $ANSWER in
                    a | A ) clear
                                echo -e 'Please select the appropriate package manager for your distribution:
                                    \n (a) APT
                                    \n (b) DNF 
                                    \n (c) PACMAN --->\c'
                                read ANSWER
                                case $ANSWER in
                                a | A ) sudo apt update && sudo apt upgrade -y; sudo apt install toilet -y; sudo apt install boxes -y; sudo apt install lolcat -y
                                ;;
                                b | B ) sudo dnf update && sudo dnf upgrade -y; sudo dnf install toilet -y; sudo dnf install boxes -y; sudo apt install lolcat -y
                                ;;
                                c | C ) sudo pacman -Syy && sudo pacman -Syu -y; -sudo pacman -s toilet -y; sudo pacman -s boxes -y; sudo pacman -s lolcat -y 
                                ;;
                                esac 
                    ;;
                    b | B ) read -p "Press enter to continue --->"
                    ;;
                    c |C ) exit
                    ;;
                    esac     
                }          
function banner() 
                { 
                    toilet 'Dank D&D' | boxes | lolcat     #this function draws the title ASCII banner
                } 
function gameover()
                {
                    toilet 'Game Over' | boxes | lolcat  #This function draws the ascii game over banner
                }                
function memelord()
                {
                    clear; toilet -t 'Victory!' | boxes | lolcat; toilet All Hail; toilet Meme Lord; toilet $name #this function draws the ascii victory banner
                }
declare -i mod=0 #creates the modifer variable and sets it with a starting value of 0
declare -i modemod=0 #creates the modemod variable and starts it with a value of 0
function mode() #Creates the game difficulty menu, assigning a value to modemod, and saving it to the function mode
        {
                clear; banner; echo ""; echo ""; echo -e "$name, please choose a difficulty mode:
                        \n(a)Easy
                        \n(b)Normal
                        \n(c)Hard --->\c"
                read ANSWER
                case $ANSWER in
                a | A ) modemod=$(($modemod-3)); read -p "PLease press enter to continue --->"
                ;;
                b | B ) read -p  "Please press enter to continue --->"
                ;;
                c | C ) modemod=$(($modemod+3)); read -p "Please press enter to continue --->"
                ;;
                esac 
        }
function roll()
            {
                d20=$(($RANDOM%20+1)) #creates a function for the 20 sided die roll and adds any additional modifiers
                d20=$(($d20+$mod))
            }
function intro() #Creates the titlescreen menu and saves it to the function intro
        {
            clear; banner; echo ""; echo ""
            echo  -e "$name, Welcome to your digital nightmare, where you must traverse a labrynth of 
                    \ndungeons where you must face off against the most infamous of memes.
                    \nWill you be triumphant and emerge the newly crowned meme lord?
                    \nOr will your defeat be immortalized in the internet memedom for all to laugh at?
                    \nEvery decision you make, is decided by a 20 sided die roll.
                    \nSome concluding interactions may result in gaining additional modifiers for your dice rolls"
            echo ""
            read -p "Press enter to continue --->"       
        }
function badluckbrian() #The rest of the functions defined are specific story sequences surrounding a single meme character
        {
            clear; banner; echo ""; echo ""
            echo -e "You enter the first room of the digital labrynth of meme terror and hear terrible geeky laughter
                    \nYour first oponent is none other than Bad Luck Brian! Do you:
                    \n(a) Give him an atomic wedgie
                    \n(b) Punch him in the face --->\c"
                    read ANSWER; memeroll=$(($modemod+7)); roll
                    case $ANSWER in
                    a | A ) if (($d20>$memeroll))
                            then clear; banner; echo ""; echo ""; echo "$name's roll: $d20 Bad Luck Brian's Roll: $memeroll"; echo ""
                                echo -e "Bad Luck Brian screamed in agonizing pain due to the forcefullness of your atomic wedgie
                                        \nHe gave you the key to the next room and his lunch money! +2 modifier added!"
                                mod=$(($mod+2))
                                echo ""
                                read -p "Press enter to continue --->"
                            else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20 Bad Luck Brian's Roll: $memeroll"; echo ""
                                echo -e "There isn't anything you can do to Bad Luck Brian to make his life worse
                                        \nor his name wouldn't be Bad Luck Brian"
                                exit
                            fi
                    ;;
                    b | B ) if (($d20>$memeroll))
                            then clear; banner; echo ""; echo ""; echo -e "$name's roll: $d20 \nBad Luck Brian's roll: $memeroll"; echo ""
                                echo -e "You easily punch poor Bad Luck Brian out cold. 
                                        \nYou frisk him for the key to the next room and take his lunch money. +2 modifier added!"
                                mod=$(($mod+2))
                                echo ""
                                read -p "Press enter to continue"
                            else clear; gameover; echo ""; echo ""; echo -e "$name's roll: $d20 \nBad Luck Brian's roll: $memeroll"; echo ""
                                echo -e "You attempt to punch Bad Luck Brian, but his braces slice your hands open.
                                        \n His name is Bad Luck Brian for a reason. You can't make his life worse!"
                                exit
                            fi
                    ;;
                    esac
        }
function scumbagsteve() 
        {
            roll; clear; banner; echo ""; echo ""
            echo -e "You enter the next room and it stanks like a can of axe body spray. 
                    \nBefore you can say Phew you hear Hey how old is your sister? 
                    \nIt's Scumbag Steve! Do you:
                    \n(a) Beat him with his flat billed hat
                    \n(b) Give him Bad Luck Brian's lunch money in return for pasing to the next chamber --->\c"
            read ANSWER; roll; memeroll=$(($modemod+9))
            case $ANSWER in
            a | A ) if (($d20>$memeroll))
                    then clear; banner; echo ""; echo ""; echo "$name's roll: $d20  Scumbag Steve's roll: $memeroll"; echo ""
                        echo -e "Scumbag Steve cries and swears to never ask for your sister again, 
                                \nand gives you the key to the next chamber. You keep the hat +1 modifier!"
                        mod=$(($mod+1)); echo ""
                        read -p "Press enter to continue --->"
                    else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20  Scumbag Steve's roll: $memeroll"; echo ""
                        echo "Scumbug steve beats you up, takes Bad Luck Brian's lunch money and his hat back!"
                        exit
                    fi
            ;;
            b | B ) clear; gameover; echo ""; echo ""; echo "Instant Defeat! Not a big brain play!"; echo ""
                    echo -e "Scumbag Steve agrees to trade, takes Bad Lunch Brian's lunch money and sucker punches you.
                            \nNever trust a scumbag!"
                    exit
            ;;
            esac 
        }
function ducreux()
        {
            clear; banner; echo ""; echo ""
            echo -e "Upon entering the next chamber, you are greeted by a talking painting with a thick European accent.
                    \nDisregard females, acquire currency! The painting says to you. It's none other than the famous 
                    \nself portrait of 18th century French artist Jospeh Ducreux!
                    \n(a) Douse the painting in paint thinner
                    \n(b) Out-meme Ducreux --->\c"
            read ANSWER
            case $ANSWER in
            a | A ) clear; banner; echo ""; echo ""; echo "Instant victory for a big brain play"; echo ""
                    echo -e "Paint runs off the canvas and pools on the ground at your feet,
                            \nleaving behind the key to the next chamber"
                    echo ""
                    read -p "Press enter to continue --->"
            ;;
            b | B ) roll; memeroll=$(($modemod+10))
                    if (($d20>$memeroll))
                    then clear; banner; echo ""; echo ""; echo ""; echo "$name's roll: $d20  Ducreux's roll: $memeroll"; echo ""
                        echo -e "I have acquired four score and 19 problems, but a wench cannot be counted among them,
                                \nsaid $name enthusastically to Deucreux!
                                \nDucreux bows to you graciously accepting defeat, rewarding you with the key to the next chamber."
                                echo ""
                                read -p "Press enter to continue --->"
                    else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20  Ducreux's roll: $memeroll"; echo ""
                        echo "$name stammers like a dummy. Ducruex, not impressed, orders $name to be placed in Facebook jail."
                        exit
                    fi
            ;;
            esac            
        }
function disastergirl ()
        {
            clear; banner; echo ""; echo ""
            echo -e "In the next chamber, the walls are covered in flames, and only a single creepy little girl
                        \nstands in the center of the chamber with a devilish smirk on her face.
                        \nIt's Disaster Girl!
                        \n(a)Put out the fire and call CPS
                        \n(b)She's a demon, push her in! --->\c"
                read ANSWER
                roll; memeroll=$(($modemod+12))
                case $ANSWER in
                a | A ) if (($d20>$memeroll))
                        then clear; banner; echo ""; echo ""; echo "$name's roll: $d20  Disaster Girl's roll: $memeroll"; echo ""
                                echo -e "$name extinguishes the fire as Disaster Girl is carried away screaming by CPS.
                                \nShe dropped the key to the next chamber as well as her book of matches. +1 modifier rewarded!"
                                read -p "Press enter to continue --->"
                        else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20  Disaster Girl's roll: $memeroll"; echo ""
                                echo "Disaster girl smiles as the flames consume you"
                                exit
                        fi
                ;;
                b | B ) if (($d20>$memeroll))
                        then clear; banner; echo ""; echo ""; echo "$name's roll: $d20  Disaster Girl's roll: $memeroll"; echo ""
                                echo "$name pushes her in and catches the key as she falls in and dashes to the next door"
                                read -p "Press enter to continue --->"
                        else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20  Disaster Girl's roll: $memeroll"; echo ""
                                echo "Disaster Girl smiles as the flames consume you"
                                exit 
                        fi
                ;;
                esac
        }
function philosoraptor()
        {
                clear; banner; echo ""; echo ""
                echo -e "In the next chamber, $name is greated by Philosrapter!
                        \nWouldn't it be ironic to die in a living room?
                        \n(a)Fight him off with a spear
                        \n(b)Give Philosoraptor a treat --->\c"
                read ANSWER
                roll; memeroll=$(($modemod+13))
                case $ANSWER in
                a | A ) if (($d20>$memeroll))
                        then clear; banner; echo ""; echo ""; echo "$name's roll: $d20  Philosoraptor's roll: $memeroll"; echo ""
                                echo -e "If someone doesn't like ghosts, does that make them wraithist?
                                        \nYou slain Philosorapter and stole his claw and the key to the final chamber +5 modifier rewarded"
                                mod=$(($mod+5))
                                read -p "Press enter to continue --->"
                        else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20  Philosoraptor's roll: $memeroll"; echo ""
                                echo "If the Philosorapter ate $name for lunch, does that mean he ate American?"
                                exit
                        fi 
                ;;
                b | B ) if (($d20>$memeroll))
                        then clear; banner; echo ""; echo ""; echo "$name's roll: $d20  Philosoraptor's roll: $memeroll"; echo ""
                                echo "Philosorapter was delighted by the treat he was given, and gives $name the key to the final chamber."
                                read -p "Press enter to continue --->"
                        else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20  Philosoraptor's roll: $memeroll"; echo ""
                                echo "If the Philosorapter ate $name for lunch, does that mean he ate American?"
                                exit
                        fi
                ;;
                esac 
        }
function willsmith()
        {
                clear; banner; echo ""; echo ""
                echo -e "$name walks in the final chamber and hears a familiar tune:
                        \nI got into one little fight and my mom got scared, she said
                        \nYou can't slap Chris Rock cuz your wife has no hair!
                        \nOH NO! It's Will Smith?
                        \n(a)Slap him before he slaps you too
                        \n(b)Tell him a Jada joke --->\c"
                read ANSWER
                roll; memeroll=$(($modemod+15))
                case $ANSWER in
                a | A ) if (($d20>$memeroll))
                        then clear; banner; echo ""; echo ""; echo "$name's roll: $d20  Will Smith's roll: $memeroll"; echo ""
                                echo "$name snatched Will's oscar and beat him with it!"
                                echo ""; read -p "Press enter to continue --->"
                        else clear; gameover; echo ""; echo ""; echo "$name's roll: $d20  Will Smith's roll: $memeroll"; echo ""
                                echo "Will slaps $name into next year!"
                                exit
                        fi
                ;;
                b | B ) clear; gameover; echo ""; echo ""; echo "Instant defeat! Not a big brain play!"; echo ""
                        echo "Will slaps $name into next year!"
                        exit
                ;;
                esac 
        }

#seaquence the events in game

install
intro
mode
badluckbrian
scumbagsteve
ducreux
disastergirl
philosoraptor
willsmith
memelord
