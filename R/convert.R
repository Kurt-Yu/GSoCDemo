#' Create a function converting ggplot object to Vega-Lite Spec
#'
#' More detailed description.
#'
#' @param g A ggplot2 object.
#'
#' @return Corresponding Vega-Lite Spec
#'
#' @examples
#' g <- ggplot(anscombe, aes(x=x1, y=y1)) + geom_point()
#' convert(g)
#'
#' g <- ggplot(mpg, aes(class)) + geom_bar()
#' convert(g)
#'
#' @export
#'
library(vegalite)
library(ggplot2)
convert <- function(g){
  # extract data frame from ggplot object
  df <- g$data

  # extract x and y labels
  x <- g$labels$x
  y <- g$labels$y

  # extract geom type from ggplot object
  geom_type <- sapply(g$layers, function(x) class(x$geom)[1])

  # build corresponding vegalite code
  if (identical(geom_type, "GeomPoint")) {
    vegalite() %>% add_data(df) %>% encode_x(x) %>% encode_y(y) %>% mark_point() -> vl
  } else if (identical(geom_type, "GeomBar")){
    vegalite() %>% add_data(df) %>% encode_x(x) %>% encode_y(y) %>% mark_bar() -> vl
  }

  return(to_spec(vl))
}
