# rimeofficial.github.io `CDN`

This is a pre commit script that checks added, copied, modified or renamed files for:

- Minify js/css
- File name add hash to escape browser cache
- ~~syntax errors and PSR2 coding standards.~~

## Installation

``` shell
# create new hooks folder
mkdir .git/hooks

# move pre-commit to new hooks folder
ln -fs pre-commit.sh .git/hooks/pre-commit

# don't forget to make the pre-commit file executable
chmod +x .git/hooks/pre-commit
```

## Dependencies

### YUI Compressor

``` shell
brew install yuicompressor
```

## References

- [keesvanbochove/**gist:4319624**](https://gist.github.com/keesvanbochove/4319624)
- [WouterSioen/**pre-commit**](https://github.com/WouterSioen/pre-commit)
- [larsxschneider/**.git-fix-whitespaces.sh**](https://gist.github.com/larsxschneider/3957621)