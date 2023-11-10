#!/bin/bash
declare -a users
users=("James" "John" "Jerry")
# echo "${users[0]}"

## Is to get an item alone in an array
# echo "${users[2]}"

### To get the last item of an array
# echo "${users[${#users[@]} - 1]}"

## To get the index of the last item of an array
# echo $(( ${#users[@]} - 1))

### Is to change item in an array
# users[0]="Mary"
# echo "${users[@]}"

## To prepend items to an array
# users=("Andrew" "${users[@]}")
# echo "${users[@]}"

## To append item(s) to an array
# users=("${users[@]}" "Taiwo")

# new_users=("Japhet" "Moses" "Johnbull")
# users+=("${new_users[@]}")
# echo "${users[@]}"

## To loop through the users array using forin loop
# for user in "${users[@]}"
# do
#     echo $user
# done


## Is to print each index using loop in array
# for (( i=0; i<${#users[@]}; i++ ))
# do
#     echo $i
# done

## To print each items in an array using loop
# for (( i=0; i<${#users[@]}; i++ ))
# do
#     echo "${users[$i]}"
# done


## To delete elements/items in an array
# unset users[0]
# echo "${users[@]}"

## To slice through an array
# echo "${users[@]:1:2}"