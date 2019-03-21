# GSoCDemo

This is a package for the thrid test of [this R project](https://github.com/rstats-gsoc/gsoc2019/wiki/Translator-from-ggplot2-to-Vega-Lite).

The `convert` function inside `convert.R` file should able to work with those two examples specified in the test description. Example:
```R
g = ggplot(anscombe, aes(x=x1, y=y1)) + geom_point()
convert(g)

g = ggplot(mpg, aes(class)) + geom_bar()
convert(g)
```

The idea is this: I found a R packge called [vegalite](https://github.com/hrbrmstr/vegalite) on github, which allow users type ggplot-like bindings to produce Vega-Lite spec. I first extract the labels and attributes from ggplot object, then use those to produce vegalite code. 