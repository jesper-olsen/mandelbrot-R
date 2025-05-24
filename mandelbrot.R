mandelbrot <- function(width = 100, height = 75, png = 0) {
  ll_x <- -1.2
  ll_y <- 0.20
  ur_x <- -1.0
  ur_y <- 0.35
  max_iter <- 255

  if (png == 0) {
    ascii_output(ll_x, ll_y, ur_x, ur_y, max_iter, width, height)
  } else {
    gptext_output(ll_x, ll_y, ur_x, ur_y, max_iter, width, height)
  }
}

ascii_output <- function(ll_x, ll_y, ur_x, ur_y, max_iter, width, height) {
  fwidth <- ur_x - ll_x
  fheight <- ur_y - ll_y

  for (y in 0:(height - 1)) {
    line <- ""
    for (x in 0:(width - 1)) {
      real <- ll_x + x * fwidth / width
      imag <- ur_y - y * fheight / height
      iter <- escape_time(real, imag, max_iter)
      line <- paste0(line, cnt2char(iter))
    }
    cat(line, "\n")
  }
}

gptext_output <- function(ll_x, ll_y, ur_x, ur_y, max_iter, width, height) {
  fwidth <- ur_x - ll_x
  fheight <- ur_y - ll_y

  for (y in height:1) {
    row <- c()
    for (x in 0:(width - 1)) {
      real <- ll_x + x * fwidth / width
      imag <- ur_y - y * fheight / height
      iter <- escape_time(real, imag, max_iter)
      row <- c(row, iter)
    }
    cat(paste(row, collapse = ", "), "\n")
  }
}

escape_time <- function(x, y, max_iter) {
  z <- complex(real = 0, imaginary = 0)
  c <- complex(real = x, imaginary = y)
  iter <- 0

  while (Mod(z) <= 2 && iter < max_iter) {
    z <- z^2 + c
    iter <- iter + 1
  }
  return(max_iter - iter)
}

cnt2char <- function(value) {
  symbols <- c("M", "W", "2", "a", "_", ".", " ")
  ns <- length(symbols)
  idx <- as.integer(value / 255.0 * ns) + 1
  return(symbols[idx])
}

args <- commandArgs(trailingOnly = TRUE)

# Parse args like width=800 or height (without =) into a named list
parse_args <- function(args) {
  out <- list()
  for (arg in args) {
    split <- strsplit(arg, "=")[[1]]
    name <- split[1]
    value <- if (length(split) == 2) split[2] else NA
    out[[name]] <- value
  }
  out
}

`%||%` <- function(a, b) {
  if (is.null(a) || length(a) == 0 || is.na(a)) b else a
}

params <- parse_args(commandArgs(trailingOnly = TRUE))
width <- as.numeric(params[["width"]]) %||% 100
height <- as.numeric(params[["height"]]) %||% 75
png <- as.numeric(params[["png"]]) %||% 0

mandelbrot(width = width, height = height, png = png)
