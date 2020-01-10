#!/bin/zsh
charset='[:alnum:]'

# set default pasword length to 10 if not specified
length=$1
if [[ $length = "h" || $length = "-h" || $length = "--h" || $length = "help" ]]
then
    echo "Usage: ./passgen.sh [length]"
    exit
elif [[ -n $length ]]
then
    count=$length
else
    count=10
fi

# do we want to include symbols?
read -q "symbols?Include symbols? (y|n) "

if [[ $symbols = "y" || $symbols = "Y" ]]
then
    charset='[:alnum:][:punct:]'
fi

# generate 10 random passwords with the length and charset chosen
echo "\nGenerating 10 random $count character passwords using $charset: \n"
i=0
while (( i++ < 10 )) { 
    password="$(cat /dev/urandom | LC_ALL=C tr -dc $charset | head -c $count)"
    echo $password
    }
print "\n"
exit