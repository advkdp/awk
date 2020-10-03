#!/bin/bash
read -p "Enter value a:" a
read -p "Enter value b:" b

#if giving input from command then no need of BEGIN or input file like ab.txt

echo "$a $b" | awk '{ x=$1 ; y=$2 ; print "addition of x & y is:" x+y }'

awk -v a=$a -v b=$b 'BEGIN { print "addition of a & b is:" a+b }'

==========================================================================
output
===============
[adminuser@centos awk]$ sh cliinput.sh 
Enter value a:2
Enter value b:3
addition of x & y is:5
addition of a & b is:5
