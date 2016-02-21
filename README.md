# Static

[![favicon](https://static.rime.co/favicon.png)](https://static.rime.co/favicon.png)

```
X-Cache: Hit form cloudfront
```

# Pre-commit

This is a pre commit script that checks added, copied, modified or renamed files for:

- Minify js/css
- ~~Dynamic revision (add hash to file name) to escape browser cache~~
- ~~syntax errors and PSR2 coding standards.~~

## Installation

``` shell
# Run from repository root dir
sh pre-commit-setup.sh
```

## Dependencies

### YUI Compressor ([yui.github.io](http://yui.github.io/yuicompressor/))

``` shell
brew install yuicompressor
```

JDK required http://www.java.com/en/download/mac_download.jsp

## References

- [keesvanbochove/**gist:4319624**](https://gist.github.com/keesvanbochove/4319624)
- [WouterSioen/**pre-commit**](https://github.com/WouterSioen/pre-commit)
- [larsxschneider/**.git-fix-whitespaces.sh**](https://gist.github.com/larsxschneider/3957621)
- [phpbb/**phpbb**](https://github.com/phpbb/phpbb/blob/develop-olympus/git-tools/hooks/pre-commit)

# Endpoints

1. http://rimeofficial.github.io/static/
2. http://pages.rime.co/static/
3. http://s3.amazonaws.com/static.rime/index.html
4. https://s3.amazonaws.com/static.rime/index.html
5. https://d1xk7omnmhphih.cloudfront.net/index.html
6. https://static.rime.co/favicon.ico

# Comparison
- 
- Gh-pages [1](http://pages.rime.co/favicon.ico), [2](http://pages.rime.co/rimeofficial.GitHub.io/favicon.ico)
- CloudFront [1](https://static.rime.co/favicon.ico), [2](https://pages.rime.co/images/favicon.ico)
