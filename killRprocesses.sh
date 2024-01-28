#!/bin/sh

ps -A | grep "R" | awk '{print $1}' |  xargs kill -9 $1