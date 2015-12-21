# Install pre-commit git hook for repository:
# Run from repository root dir
if [ -f pre-commit.sh ]
then
  # # create new hooks folder
  # mkdir .git/hooks
  
  # move pre-commit.sh to new hooks folder
  cp pre-commit.sh .git/hooks/pre-commit

  # don't forget to make the pre-commit file executable
  chmod +x .git/hooks/pre-commit
else
  echo 'Error: Pre-commit script not found repository.'
fi