#!/bin/sh

clear
cat <<'BANNER'
    _        _   
   / \   ___| |_ 
  / _ \ / __| __|
 / ___ \ (__| |_ 
/_/   \_\___|\__|
                 

             _            __   _   _            _               
  ___  _   _| |_    ___  / _| | |_| |__   ___  | |__   _____  __
 / _ \| | | | __|  / _ \| |_  | __| '_ \ / _ \ | '_ \ / _ \ \/ /
| (_) | |_| | |_  | (_) |  _| | |_| | | |  __/ | |_) | (_) >  < 
 \___/ \__,_|\__|  \___/|_|    \__|_| |_|\___| |_.__/ \___/_/\_\
                                                                

BANNER
sleep 3

echo
echo "You should not run this script unless you know what you are doing."
echo "There is no assurance that it works or does what you mean."
echo "You have been warned."
echo
echo "                                Theo van Hoesel & Alex Muntada"
echo
read -p "Are you sure you want to continue [Yes] ? " -r CONFIRM

if [ "$CONFIRM" != "Yes" ]
then
  echo
  echo "Exit, very well"
  echo
  exit
else
  echo
  echo "Enjoy the ride..."
  echo
fi

set -e

export INSTALLER="/vagrant"

export LANG="en_US.UTF8"
export LC_ALL="en_US.UTF8"

#
# where to find everything...
#

$INSTALLER/bin/pre_install.sh
$INSTALLER/bin/apache-with-mod_perl.sh
$INSTALLER/bin/database.sh
$INSTALLER/bin/mailer.sh
$INSTALLER/bin/dependencies.sh
$INSTALLER/bin/useradd.sh 'act_developper'

echo
cat <<'BANNER'
             _______                                            
            |       |                                           
            |       |  _______                                  
   _______  |       | |       |                                 
  |       | |_______| |       |                                 
  |       |  _______  |       |                                 
  |       | |       | |_______|                                 
  |_______| |       |  _______                                  
   _______  |       | |       |                                 
  |       | |_______| |       |                                 
  |       |  _______  |       |                                 
  |       | |       | |_______|                                 
  |_______| |       |                                           
            |       |                                           
            |_______|             (c) 2014  www.THEMA-MEDIA.nl  
                                                                                                
BANNER
sleep 3

echo "we hope you did enjoy the ride..."
sleep 3
echo "now exit and re-login as actuser"

