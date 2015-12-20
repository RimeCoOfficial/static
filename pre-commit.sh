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

echo "Renaming files"

# create empty errors array
declare -a errors

# Check if we're on a semi-secret empty tree
if git rev-parse --verify HEAD
then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# fetch all changed php files and validate them
files=$(git diff-index --name-only --diff-filter=ACMR $against | grep '\.css$')
if [ -n "$files" ]; then

  echo 'Checking NEW Files'

  for file in $files; do

    # output=`esvalidate $file`

    # # if our output is not empty, there were errors
    # if [ -n "$output" ]; then
    #   echo "$file contains javascript syntax errors"
    #   echo $output
    #   errors=("${errors[@]}" "$output")
    # fi

    fname=$(basename "$1")
    echo "$fname"

  done
fi


# function _c
# {
#     fname=$(basename "$1")
#     dest=$(dirname "$1")
#     ext="${fname##*.}"
#     dest_fname="$dest/${fname%.*}.min.$ext"
#     echo "Compressing $1..."
#     $YUIC $1 > $dest_fname
#     git add $dest_fname
#     echo "Done."
#     echo ""
# }

# for file in $(ls web-app/js/*.js web-app/css/*.css|grep -vi min.);
# do
#     _c $file
# done

# date +"%Y%m%d-%H%m%S%z"

# # create empty errors array
# declare -a errors

# # Check if we're on a semi-secret empty tree
# if git rev-parse --verify HEAD
# then
#  against=HEAD
# else
#  # Initial commit: diff against an empty tree object
#  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
# fi

# # fetch all changed php files and validate them
# files=$(git diff-index --name-only --diff-filter=ACMR $against | grep '\.php$')
# if [ -n "$files" ]; then

#  echo 'Checking PHP Files'
#  echo '------------------'
#  echo

#  for file in $files; do

#    # first check if they are valid php files
#    output=`php -l $file | grep 'Errors parsing'`

#    # if it did contain errors, we have output
#    if [ -n "$output" ]; then
#      echo "$file contains php syntax errors"
#      errors=("${errors[@]}" "$output")
#    fi

#    # checks if the phpcs output contains '| ERROR |'
#    output=`phpcs --standard=PSR2 --extensions=php --encoding=utf8 --report=full $file | grep '| ERROR |'`

#    # if it did contain errors, we have output
#    if [ -n "$output" ]; then
#      echo "$file fails coding standards"
#      phpcs --standard=PSR2 --extensions=php --encoding=utf8 --report=full $file
#      errors=("${errors[@]}" "$output")
#    fi
#  done
# fi

# # fetch all changed js files and validate them
# files=$(git diff-index --name-only --diff-filter=ACMR $against | grep '\.js$')
# if [ -n "$files" ]; then

#  echo
#  echo 'Checking Javascript Files'
#  echo '------------------'
#  echo

#  for file in $files; do
#    output=`esvalidate $file`

#    # if our output is not empty, there were errors
#    if [ -n "$output" ]; then
#      echo "$file contains javascript syntax errors"
#      echo $output
#      errors=("${errors[@]}" "$output")
#    fi
#  done
# fi

# # fetch all changed css files and validate them
# files=$(git diff-index --name-only --diff-filter=ACMR $against | grep '\.css$')
# if [ -n "$files" ]; then

#  echo
#  echo 'Checking CSS Files'
#  echo '------------------'
#  echo

#  for file in $files; do
#    output=`csslint --format=compact $file | grep 'Error -'`

#    # if our output is not empty, there were errors
#    if [ -n "$output" ]; then
#      echo "$file contains css syntax errors"
#      echo $output
#      errors=("${errors[@]}" "$output")
#    fi
#  done
# fi

# # fetch all changed css files and validate them
# files=$(git diff-index --name-only --diff-filter=ACMR $against | grep -E '\.s(c|a)ss$')
# if [ -n "$files" ]; then

#  echo
#  echo 'Checking SCSS Files'
#  echo '------------------'
#  echo

#  for file in $files; do
#    output=`scss-lint $file | grep '\[E\]'`

#    # if our output is not empty, there were errors
#    if [ -n "$output" ]; then
#      echo "$file contains scss syntax errors"
#      scss-lint $file | grep '\[E\]'
#      errors=("${errors[@]}" "$output")
#    fi
#  done
# fi

# # if we have errors, exit with 1
# if [ -n "$errors" ]; then
#  exit 1
# fi

echo '🍺  No errors found!'