#! /bin/bash
echo "Enter the first Number"
read n1
echo "Enter the second Number"
read n2

sum=$(($n1+$n2))
prod=$(( $n1*$n2 ))

echo "The sum of $n1 and $n2 is $sum"
echo "The prod of $n1 and $n2 is $prod"

if [[ $sum -lt $prod ]]
then
    echo "The sum is less than the product."
elif [[ $sum -eq $prod ]]
then
   echo "The sum is equal to the product."
elif [[ $sum -gt $prod ]]
then
   echo "The sum is greater than the product."
fi