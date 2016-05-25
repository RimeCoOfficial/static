# Static

![](http://rimeofficial.github.io/static/images/favicon.png)

## Pre-commit

This is a pre commit script that checks added, copied, modified or renamed files for:

- Minify js/css
- ~~Dynamic revision (add hash to file name) to escape browser cache~~
- ~~syntax errors and PSR2 coding standards.~~

## Installation

```shell
# Run from repository root dir
sh pre-commit-setup.sh
```

## Dependencies

### YUI Compressor ([yui.github.io](http://yui.github.io/yuicompressor/))

```shell
brew install yuicompressor
```

JDK required http://www.java.com/en/download/mac_download.jsp

## References

- [keesvanbochove/**gist:4319624**](https://gist.github.com/keesvanbochove/4319624)
- [WouterSioen/**pre-commit**](https://github.com/WouterSioen/pre-commit)
- [larsxschneider/**.git-fix-whitespaces.sh**](https://gist.github.com/larsxschneider/3957621)
- [phpbb/**phpbb**](https://github.com/phpbb/phpbb/blob/develop-olympus/git-tools/hooks/pre-commit)
