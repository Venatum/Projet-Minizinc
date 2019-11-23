#!/bin/bash
## R5.sh for Minizinc R5 in /home/etudiant/dev/M1-Angers/ResPb/Projet Minizinc/Exo 1
## 
## Made by Vincent Le Quec
## Login   <vincentlequec@gmail.com>
## 
## Started on  Fri Nov 22 10:09:23 2019 etudiant
## Last update Fri Nov 22 11:24:11 2019 etudiant
##

function help() {
    echo "Usage:"
    echo "  $0 -n nQueens"
    echo "          -h, --help: Display this help"
}

function createSatFile() {
    # n = $1
    echo "Generate Sat File for $1 queens..."
    fileName='R5.test.cnf'
    # Define variables & clauses
    let "nbClauses = $1 / 2" # TODO nbClauses
    echo "p cnf $1 $nbClauses 0" > $fileName

    echo " 0" >> $fileName
}

if [ $# -ne 2 ]
then
    help
else
    if [ $1 = "-n" ]
    then
        createSatFile $2
    else
        help
    fi
fi
