
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mesh2d

<!-- badges: start -->

<!-- badges: end -->

The goal of mesh2d is to provide plotting helpers analogous to some rgl
functions.

Currently

  - `segments2d`
  - `triangles2d`
  - `quads2d`

## Installation

You can install the dev version of mesh2d from github with

``` r
## install.packages("remotes")
remotes::install_github("mdsumner/mesh2d")
```

## Example

``` r
library(mesh2d)
quads2d(runif(12), runif(12), border = hcl.colors(3), lwd = 5, col = c("grey", "firebrick", "dodgerblue"), alpha = 0.5)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r


triangles2d(rnorm(99), rnorm(99), col = gray.colors(33), add = FALSE)
```

<img src="man/figures/README-unnamed-chunk-2-2.png" width="100%" />

``` r
segments2d(sort(rnorm(50)), rnorm(50), col = hcl.colors(10), add = FALSE, lwd = 15)
```

<img src="man/figures/README-unnamed-chunk-2-3.png" width="100%" />

## Code of Conduct

Please note that the mesh2d project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
