# Install whitespace git hook for repository:
# Run from repository root dir
if [ -f pre-commit.sh ]
then
  ln -fs ../../pre-commit.sh .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
else
  echo '\nError: Fix whitespace script not found repository.'
fi