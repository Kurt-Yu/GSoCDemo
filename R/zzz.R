alt <- NULL
pd <- NULL

.onLoad <- function(libname, pkgname) {
  alt <<- reticulate::import("altair", delay_load = TRUE)
  pd <<- reticulate::import("pandas", delay_load = TRUE)
}
