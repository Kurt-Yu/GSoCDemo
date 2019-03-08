library(reticulate)

translate <- function(g){
  # Step 1: extract the geom type from ggplot object
  geom <- sapply(g$layers, function(x) class(x$geom)[1])

  # Step 2: extract the actual data from ggplot object
  d <- ggplot_build(g)$data

  # Step 3: using altair methods to convert ggplot object to vega-lite spec
  df <- pd$DataFrame$to_dict(r_to_py(d)[0])
  chart <- NULL
  if (geom == "GeomPoint"){
    chart <- alt$Chart(df)$mark_point()
  } else if (geom == "GeomBar"){
    chart <- alt$Chart(df)$mark_bar()
  }

  chart <- chart$encode(
    x='x1:Q',
    y='y1:Q',
    color='Origin:N'
  )$configure_view(
    height=300,
    width=400
  )

  return(chart$to_json(indent=2))
}
