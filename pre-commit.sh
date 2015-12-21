#! /bin/bash
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

files=$(git status -s)
if [ -n "$files" ]; then

  prev_file='!!'

  for file in $files; do

    if [ $prev_file == '??' ]; then
      echo "++ $file"
      git add "$file"
    fi

    prev_file=$file
  done
fi


echo '2. Renaming CSS files'

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

files=$(git diff --name-only HEAD | grep 'test/.*\.css$')
if [ -n "$files" ]; then

  for file in $files; do

    fname=$(basename "$file")
    dest=$(dirname "$file")
    ext="${fname##*.}"

    # hex_date=$(date +"%Y%m%d%H%m%S")
    # hex_date=$(date +"%s")  
    # random_hash=$(printf "%x\n" $hex_date)

    # random_hash=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    # random_hash=$(hexdump -e '/1 "%02x"' -n 4 < /dev/urandom)
    random_hash=$(echo $RANDOM $RANDOM $RANDOM $RANDOM $RANDOM | md5 | cut -c -8)
    
    dest_fname="$dest/${fname%.*}-v$random_hash.min.$ext"

    # @todo: minify

    echo "$fname => $dest_fname"
    cp "$file" "$dest_fname"
    git add "$dest_fname"

  done

  echo "Done."
fi


# if we have errors, exit with 1
if [ -n "$errors" ]; then
  exit 1
fi

echo '🍺  No errors found!'
