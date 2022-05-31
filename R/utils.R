parse_version <- function(r_version) {
  strsplit(r_version, split = ".", fixed = TRUE)[[1]][1:2] |>
    paste0(collapse = ".")
}

sanitize_version <- function(r_version) {
  parsed_version <- parse_version(r_version)

  if (!parsed_version %in% possible_r_versions()) {
    rlang::abort(
      c(
        x = sprintf("Can't find a major-minor R version for %s", r_version),
        i = "See `rversions::r_versions()` for all R versions."
      )
    )
  }

  parsed_version
}

.possible_r_versions <- function() {
  rversions::r_versions()[["version"]] |>
    purrr::map_chr(parse_version) |>
    unique()
}

#' @importFrom memoise memoise
possible_r_versions <- memoise::memoise(.possible_r_versions)
