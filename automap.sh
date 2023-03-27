#!/bin/bash
#
# Ejemplo de Menu en BASH
#
date
    echo "|"
    echo "|---------------------------|"
    echo "|   Menu Principal          |"
    echo "|---------------------------|"
    echo "|1. Escaneo de red"
    echo "|2. Escaneo individual"
    echo "|3. Escaneo UDP"
    echo "|4. Escaneo de script"
    echo "|5. Salir"
    echo "|"
read -p "Opción  [ 1 - 5 ] " c
case $c in
        1) read -p "Escribe la subred a escanear 
[En este formato--->0.0.0.0/0]: " sbred; nmap -sn $sbred -oN ${sbred:0:${#sbred}-3}_escaneo_red.txt;;
        2) read -p "Escribe la direccion ip a escanear: " ipp; nmap -v -A $ipp -oN ${ipp}_escaneo_individual.txt ;;
        3) read -p "Escribe la direccion ip a escanear: " ipp; sudo nmap -sU $ipp -oN ${ipp}_escaneo_UDP.txt;;
        4) read -p "Escribe la direccion ip a escanear: " ipp;
read -p "Escribe el script a verificar en $ipp [Ejem---> ssl-ccs-injection]: " scrip ; nmap --script $scrip $ipp -oN ${ipp}_${scrip};;
        5) echo "Bye!"; exit 0;;
esac