#!/bin/bash

function printClear()
{
  tput sc; tput el
  printf "%s" "$1"
  tput rc
}

function update()
{
	for directory in `find $1 -type f`
	do
		f="$(echo $directory | cut -c2-)"
		desf="$HOME$f"
		mkdir -p $(dirname $desf)

		[[ -f $desf ]] || touch $desf
		srcf=$(realpath .$f)

		echo -e "\tfile -> $(basename $srcf)"
		echo -e "\tdest -> $(dirname $desf)"
		mkdir -p "$(dirname $desf)"
		diff $srcf $desf >> /dev/null

		if [[ $? -eq 0 ]];
			then
				echo "$f ... OK"
			elif [[ $? -eq 1 ]]
			then
				cp -a $srcf $desf
				echo "$f ... DIFF"
			fi
		done
}

update ./.config
update ./.local/bin

echo "Installing all config files!"

