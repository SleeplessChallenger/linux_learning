#!/bin/bash
echo "which directory would you like to check?"
read directory # user input is assigned to variable `directory`
	find $directory -type f | while read file; do
		if [[ "$file" = *[[:space:]]* ]]; then
		mv "$file" `echo $file | tr ' ' '_'`
		fi;
	done


# `echo` prints to stdout & wants user input
# `-type f` returns all the file objects in the directory
# from `find` it'll read them one at a time
# `fi` stops the loop when there is no more in the dir 