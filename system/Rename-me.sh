#!/bin/bash

function change_name { 
  file="$1"
  directory=`dirname "$file"`
  oldname=`basename "$file"`
  newname=`echo "$oldname" | sed 's/\s\+/_/g'`
  echo Your absolute path: $file
  mv "$directory/$oldname" "$directory/$newname"
  if [ $? -ne 0 ]
   then
    echo "Something was wrong.. Sorry! Check what happened"
    exit 2
  fi
}

if [ $# = 0 ]
 then
  echo "No arguments received. Please, give me a path to start renaming their files!"
  exit 1
else
  if [ -d $1 ]
   then
    echo "Renaming Folders.."

  # Renaming all folders bellow $1
    find $1 -type d -name "* *" |
    while read directory_name
     do
      change_name "$directory_name"
    done

  # Renaming all files bellow $1
    echo "Renaming Files.."
    find $1 -type f -name "* *" |
    while read filename
     do
      change_name "$filename"
    done

  else
    echo "$1 does not exist!"
    exit 1
  fi
fi
