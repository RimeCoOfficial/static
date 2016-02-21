#!/bin/bash
#
# This script checks if all added, copied, modified or renamed files are valid against the PSR2 coding standards
# and if there are no php, javascript or css errors
# dependencies:
#   codesniffer (http://pear.php.net/package/PHP_CodeSniffer)
#   esvalidate (https://github.com/duereg/esvalidate)
#   CSS lint (https://github.com/stubbornella/csslint/wiki/Command-line-interface)
#   SCSS lint (https://github.com/causes/scss-lint)
#
# @version  1.0.0
# @author Shubhajit Saha <www@suvozit.com>

# create empty errors array
declare -a errors

echo "1. Adding untracked Files"
git add "."


echo '2. Minify JS/CSS files'

# # Check if we're on a semi-secret empty tree
# if git rev-parse --verify HEAD
# then
#   against=HEAD
# else
#   # Initial commit: diff against an empty tree object
#   against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
# fi

# # fetch all changed php files and validate them
# files=$(git diff-index --name-only --diff-filter=ACMR $against | grep 'asset/css/.*\.css$')

# files=$(git diff --name-only HEAD | egrep '(javascripts|stylesheets)/.*')
files=$(git diff --name-only HEAD | grep 'javascripts/.*')
if [ -n "$files" ]; then

  for file in $files; do

    file_name_ext=$(basename "$file")
    dest_dir=$(dirname "$file")
    file_name="${file_name_ext%.*}"
    file_ext="${file_name_ext##*.}" 
    
    dest_file="$dest_dir/$file_name.min.$file_ext"

    # remove old *.min.ext file
    old_file=`find "$dest_dir" -maxdepth 1 | grep "$file_name.min.$file_ext" -m1`
    if [ ! -z "$old_file" ]; then
      echo "-- $old_file"
      git rm "$old_file"
    fi

    # minify
    echo "Searching for YUI Compressor..."
    YUIC="/usr/local/bin/yuicompressor"

    if [ -l "$YUIC" ]; then
      echo "Unable to find YUI Compressor! Goodbye!"
      exit 1
    fi

    echo "YUI Compressor found! Start compressing..."

    echo "$file_name_ext => $dest_file"
    
    $YUIC $file > $dest_file
    # output=`$YUIC $file > $dest_file`
    # # if our output is not empty, there were errors
    # if [ -n "$output" ]; then
    #   echo "$file contains scss syntax errors"
    #   errors=("${errors[@]}" "$output")
    # fi

    git add "$dest_file"

  done
fi

files=$(git diff --name-only HEAD | grep 'stylesheets/.*')
if [ -n "$files" ]; then

  for file in $files; do

    file_name_ext=$(basename "$file")
    dest_dir=$(dirname "$file")
    file_name="${file_name_ext%.*}"
    file_ext="${file_name_ext##*.}" 
    
    dest_file="$dest_dir/$file_name.min.$file_ext"

    # remove old *.min.ext file
    old_file=`find "$dest_dir" -maxdepth 1 | grep "$file_name.min.$file_ext" -m1`
    if [ ! -z "$old_file" ]; then
      echo "-- $old_file"
      git rm "$old_file"
    fi

    # minify
    echo "Searching for YUI Compressor..."
    YUIC="/usr/local/bin/yuicompressor"

    if [ -l "$YUIC" ]; then
      echo "Unable to find YUI Compressor! Goodbye!"
      exit 1
    fi

    echo "YUI Compressor found! Start compressing..."

    echo "$file_name_ext => $dest_file"
    
    $YUIC $file > $dest_file
    # output=`$YUIC $file > $dest_file`
    # # if our output is not empty, there were errors
    # if [ -n "$output" ]; then
    #   echo "$file contains scss syntax errors"
    #   errors=("${errors[@]}" "$output")
    # fi

    git add "$dest_file"

  done
fi

# if we have errors, exit with 1
if [ -n "$errors" ]; then
  exit 1
fi

echo '🍺  No errors found!'
