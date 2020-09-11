#' Add Triangles to a Plot
#'
#' Draw triangles with triplets of points, triplets are defined sequentially.
#'
#' It is expected that there will be a number of coordinates exactly divisible by 3.
#'
#' This is a convenience function (analogous to `rgl`'s `triangles3d()`) that
#' doesn't require reshaping sequential coordinates into a new structure.
#'
#' If there's no current plot this function will start one, this may not be a good
#' idea.
#'
#' TODO: add all line rendering options for borders
#'
#' @param ... further arguments passed to [grid.polygon()]
#' @param asp control the aspect ratio of the plot (only when `add = TRUE`)
#' @param add logical, add to current plot or start a new one
#' @param x,y coordinates any reasonable way of defining the coordinates is
#'   acceptable. See the function [xy.coords()] for details
#' @param border border line colour
#' @param col fill colour
#' @param lty line type
#' @param lwd line width
#' @param alpha transparency
#'
#' @return called for its side effect, drawing triangles on a plot
#' @export
#'
#' @examples
#' triangles2d(runif(27), runif(27), add = FALSE, col = sample(colors(), 9))
triangles2d <- function(x, y = NULL, border = NULL, col = NA, ..., alpha = 1, lwd = 1, lty = 1, asp = "", add = TRUE) {
  xy <- xy.coords(x, y)
  xy$id <- rep(seq_len(length(xy$x)%/%3), each = 3L, length.out = length(xy$x))
  if (!length(xy$x) %% 3 == 0) {
    message("number of coordinates is not divisible by 3, result may fail, or be non-sensible")
  }

  if ( names(dev.cur()) == "null device" || !add) plot(x, y, asp = asp, type = "n", axes = F, xlab = "", ylab = "")
  vps <- gridBase::baseViewports()
  grid::pushViewport(vps$inner, vps$figure, vps$plot)

  grid::grid.polygon(xy$x, xy$y, xy$id, gp = grid::gpar(col = border, fill = col, alpha = alpha, lwd = lwd, lty = lty),
                     default.units = "native")


  grid::popViewport(3)

}
