#!/bin/sh

total=0
./../lem_in < maps/neg_ant > /dev/null 2> /dev/null
test1=$?
./../lem_in < maps/zero_ant > /dev/null 2> /dev/null
test2=$?
if [ $test1 -eq 1 -a $test2 -eq 1 ]
then
    let "total += 1"
    echo "Test bad ants number : OK"
elif [ $test1 -eq 139 -o $test2 == 139 ]
then
    echo "Test bad ants number : Segfault"
else
    echo "Test bad ants number : KO"
fi

./../lem_in < maps/no_room > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test No room : OK"
elif [ $? -eq 139 ]
then
    echo "echo Test No room : Segfault"
else
    echo "Test No room : KO"
fi

./../lem_in < maps/no_start > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test No start room : OK"
elif [ $? -eq 139 ]
    then
    echo "Test No start room : Segfault"
else
    echo "Test No start room : KO"
fi

./../lem_in < maps/no_end > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test No end room : OK"
elif [ $? -eq 139 ]
then
    echo "Test No end room : Segfault"
else
    echo "Test No end room : KO"
fi

./../lem_in < maps/multiple_start > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test Multiple start rooms : OK"
elif [ $? -eq 139 ]
then
    echo "Test Multiple start rooms : Segfaut"
else
    echo "Test Multiple start rooms : KO"
fi

./../lem_in < maps/multiple_end > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test Multiple end rooms : OK"
elif [ $? -eq 139 ]
then
    echo "Test Multiple end rooms : Segfault"
else
    echo "Test Multiple end rooms : KO"
fi

./../lem_in < maps/multiple_room_name > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test Multiple rooms with same name : OK"
elif [ $? -eq 139 ]
then
    echo "Test Multiple rooms with same name : Segfault"
else
    echo "Test Multiple rooms with same name : KO"
fi

./../lem_in < maps/multiple_same_coord > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test Multiple rooms with identical coordinates : OK"
elif [ $? -eq 139 ]
then
    echo "Test Multiple rooms with identical coordinates : Segfault"
else
    echo "Test Multiple rooms with identical coordinates : KO"
fi

./../lem_in < maps/no_pipe > /dev/null 2> /dev/null
if [ $? -eq 1 ]
then
    let "total += 1"
    echo "Test No pipe : OK"
elif [ $? -eq 139 ]
then
    echo "Test No pipe : Segfault"
else
    echo "Test No pipe : KO"
fi

echo "total : $total / 9"
