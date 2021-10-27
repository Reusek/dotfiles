#!/bin/bash

function printClear()
{
  tput sc; tput el
  printf "%s" "$1"
  tput rc
}

echo "Installing all config files!"

for directory in `find ./.config -type f`
do
  f="$(echo $directory | cut -c2-)"
  # echo "Dir" $f
  srcf=$(realpath .$f)
  desf=$(realpath $HOME$f)
  # echo -e "\tSource file $(find $srcf)"
  # echo -e "\tDestin file $(find $desf)"

  diff $srcf $desf >> /dev/null

  if [[ $? -eq 0 ]];
  then
    echo "$f ... OK"
  elif [[ $? -eq 1 ]]
  then
    cp $srcf $desf
    echo "$f ... DIFF"
  fi

  # echo $(realpath .$f)
  # echo "does exist: $?"
  # diff ~$f .$f
  # cd $directory
  # for FILE in `find $directory -type f`
  # do
  
  # done
done
  
