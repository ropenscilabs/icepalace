#' Snapshot a Package Repository
#'
#' @param url URL to the CRAN-like repository.
#' @param destdir Folder where to save the archives.
#' @param type Type of package archives.
#' @param r_version R version (character vector)
#'
#' @importFrom rlang `%||%`
#'
#' @export
#'
#' @examples
#' \dontrun{
#' snapshot_package_repository("https://jeroen.r-universe.dev", type = "source")
#' }
snapshot_package_repository <- function(url, destdir = basename(url),
  type = c("source", "mac.binary", "win.binary"),
  r_version = NULL) {

  # TODO
  # check url is length 1 and remove backslash at the end
  # or use urltools to grow it later in the code, might be safer

  type <- rlang::arg_match(type, values = c("source", "mac.binary", "win.binary"), multiple = TRUE)

  r_version <- (r_version %||% rversions::r_release()$version) |>
    purrr::map_chr(sanitize_version)

  if (!curl::has_internet()) {
    rlang::abort("Can't connect, is this machine offline?")
  }


  if ("source" %in% type) {
    snapshot_package_repository_src(url, destdir)
  }

  type <- type[type != "source"]
  if (length(type) > 0) {
    purrr::walk(
      r_version,
      ~ purrr::walk(
        type,
        snapshot_package_repository_type,
        url = url, destdir = destdir, r_version = .
      )
    )
  }

}

snapshot_package_repository_type <- function(type, url, destdir, r_version) {
  switch(
    type,
    mac.binary = snapshot_package_repository_bin("macosx", url, destdir, r_version),
    win.binary = snapshot_package_repository_bin("windows", url, destdir, r_version)
  )
}

snapshot_package_repository_src <- function(url, destdir) {
  srcdir <- file.path(destdir, 'src', 'contrib')
  available_packages <-
    as.data.frame(
      utils::available.packages(
        repos = url,
        type = "source",
        ignore_repo_cache = TRUE
      )
    )

  if (nrow(available_packages) == 0) {
    rlang::abort(
      c(
        x = sprintf("Can't find any package source for repository `%s`.", url)),
      i = "Maybe try another R version?"
    )
  }

  dir.create(srcdir, recursive = TRUE)

  safely_download_file(file.path(url, 'src/contrib/PACKAGES'), file.path(srcdir, "PACKAGES"))
  safely_download_file(file.path(url, 'src/contrib/PACKAGES.gz'), file.path(srcdir, "PACKAGES.gz"))
  safely_download_file(file.path(url, 'src/contrib/PACKAGES.json'), file.path(srcdir, "PACKAGES.json"))
  safely_download_package(
    file.path(url, 'src/contrib'),
    package = available_packages$Package,
    destdir = srcdir,
    available_packages = available_packages
  )
}

snapshot_package_repository_bin <- function(os, url, destdir, r_version) {
  bin_url <- sprintf("%s/bin/%s/contrib/%s", url, os, r_version)

  type <- switch(os, macosx = "mac.binary", windows = "win.binary")

  available_packages <- as.data.frame(utils::available.packages(bin_url, type = type))

  if (nrow(available_packages) == 0) {
    rlang::warn(
      c(
        x = sprintf("Can't find any package %s for repository `%s`.", type, bin_url),
        i = "Maybe try another R version?"
      )
    )
    return()
  }

  bindir <- file.path(destdir, 'bin', os, 'contrib', r_version)

  dir.create(bindir, recursive = TRUE)

  safely_download_file(file.path(bin_url, 'PACKAGES'), file.path(bindir, "PACKAGES"))
  safely_download_file(file.path(bin_url, 'PACKAGES.gz'), file.path(bindir, "PACKAGES.gz"))
  safely_download_file(file.path(bin_url, 'PACKAGES.json'), file.path(bindir, "PACKAGES.json"))

  safely_download_package(
    bin_url,
    package = available_packages$Package,
    destdir = bindir,
    available_packages = available_packages,
    type = type
  )
}
