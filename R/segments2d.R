
#' Add Line Segments to a Plot
#'
#' Draw line segments between pairs of points, pairs are defined sequentially.
#'
#' It is expected that there will be an even number of coordinates.
#'
#' This is a convenience function (analogous to `rgl`'s `segments3d()`) that
#' doesn't require reshaping sequential coordinates into start,end pairs.
#'
#' If there's no current plot this function will start one, this may not be a good
#' idea.
#' @param x,y coordinates any reasonable way of defining the coordinates is
#'   acceptable. See the function [xy.coords()] for details
#' @param ... further arguments passed to [segments()]
#' @param asp control the aspect ratio of the plot (only when `add = TRUE`)
#' @param add logical, add to current plot or start a new one
#'
#' @return called for its side effect, drawing line segments on a plot
#' @export
#' @importFrom graphics segments
#' @examples
#' segments2d(runif(10), runif(10), add = FALSE)
segments2d <- function(x, y = NULL, ..., asp = "", add = TRUE) {
  xy <- xy.coords(x, y)
  if (!length(xy$x) %% 2 == 0) {
    message("odd number of coordinates provided, final segment cannot be valid and will be ignored")
  }


  if ( names(dev.cur()) == "null device" || !add) plot(x, y, asp = asp, type = "n")
  xx <- matrix(xy$x, 2L)
  yy <- matrix(xy$y, 2L)
  segments(xx[1L, ], yy[1L, ],
           xx[2L, ], yy[2L, ], ...)

}
