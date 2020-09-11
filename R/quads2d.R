
#' Add Quads to a Plot
#'
#' Draw quads with quadruplets of points, quadruplets are defined sequentially.
#'
#' It is expected that there will be a number of coordinates exactly divisible by 4.
#'
#' This is a convenience function (analogous to `rgl`'s `quads3d()`) that
#' doesn't require reshaping sequential coordinates into a new structure.
#'
#' If there's no current plot this function will start one, this may not be a good
#' idea.
#'
#' @param x,y coordinates any reasonable way of defining the coordinates is
#'   acceptable. See the function [xy.coords()] for details
#' @param ... further arguments passed to [grid.polygon()] WIP
#' @param asp control the aspect ratio of the plot (only when `add = TRUE`)
#' @param add logical, add to current plot or start a new one
#' @param border border line colour
#' @param col fill colour
#' @param x
#' @param y
#' @param lty line type
#' @param lwd line width
#' @param alpha alpha transparency
#'
#' @return called for its side effect, drawing quads on a plot
#' @export
#' @importFrom gridBase baseViewports
#' @importFrom grid pushViewport grid.polygon popViewport
#' @importFrom grDevices dev.cur xy.coords
#' @examples
#' quads2d(runif(36), runif(36), add = FALSE, col = sample(colors(), 9))
quads2d <- function(x, y = NULL, border = NULL, col = NA, ..., alpha = 1, lty = 1, lwd = 1, asp = "", add = TRUE) {
  xy <- xy.coords(x, y)
  xy$id <- rep(seq_len(length(xy$x)%/%4), each = 4L, length.out = length(xy$x))
  if (!length(xy$x) %% 4 == 0) {
    message("number of coordinates is not divisible by 4, result may fail, or be non-sensible")
  }

  if ( names(dev.cur()) == "null device" || !add) plot(x, y, asp = asp, type = "n", axes = F, xlab = "", ylab = "")
  vps <- gridBase::baseViewports()
  grid::pushViewport(vps$inner, vps$figure, vps$plot)

  grid::grid.polygon(xy$x, xy$y, xy$id, gp = grid::gpar(col = border, fill = col, alpha = alpha, lwd = lwd, lty = lty),
                     default.units = "native")


  grid::popViewport(3)

}
