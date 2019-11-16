#!/bin/bash
#
# Demonstration of Zombie processes.

#This script will create child processes that will "run" several seconds.
# Before the child processes terminate the script will have paused itself.
# As a reult it will never request the exit codes of its child processes.
# That is how we end up with little Zombies
# From marcoach.nl/zombie-process-how-to-create-and-demonstrate-them/

e
OUR_PID=$$
echo "When this script has finished you should be able to find one or two zombie processes"

sleep 5&
sleep 15&

echo "Type the command:  ps aux | grep sleep a couple of times until both processes are zombies"
echo
echo "Type kill -SIGCONT $OUR_PID to resume the parent process"

sleep 1

kill -SIGSTOP $OUR_PID
