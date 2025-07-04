#!/bin/sed -Ef

# replace all commas with newlines
s/,/\
/g

# Do we need to re-join any lines?
:loop
# Unmatched brace containing possibly another (matched) level of
# braces:
s/(\"([^{}]|\"[^{}]*\")*)\
/\1,/
tloop

# remove any leading space
s/\n */\
/g

# At first line, print result, then exit.
1q
