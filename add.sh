#! /bin/bash
echo "Enter the first Number"
read n1
echo "Enter the second Number"
read n2

sum=$(($n1+$n2))
prod=$(( $n1*$n2 ))

echo "The sum of $n1 and $n2 is $sum"
echo "The prod of $n1 and $n2 is $prod"