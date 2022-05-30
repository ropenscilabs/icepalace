#' Backup a Package Repository
#'
#' @param url URL to the CRAN-like repository.
#' @param destdir Folder where to save the archives.
#' @param type Type of package archives.
#' @param r_version R version
#'
#' @return
#' @export
#'
#' @examples
#' backup_package_repository("https://jeroen.r-universe.dev", type = "src")
backup_package_repository <- function(url, destdir = basename(url),
                                      type = c("source", "mac.binary", "win.binary"),
                                      r_version = NULL) {

  # TODO
  # check url is length 1 and remove backslash at the end
  # or use urltools to grow it later in the code, might be safer

  type <- rlang::arg_match(type, values = c("source", "mac.binary", "win.binary"), multiple = TRUE)

  if (is.null(r_version)) {
    r_version <- substr(rversions::r_release()$version, 1, 3)
  }

  if (!curl::has_internet()) {
    rlang::abort("Can't connect, is this machine offline?")
  }

  purrr::walk(
    type,
    backup_package_repository_type,
    url = url, destdir = destdir, r_version = r_version
  )

}

backup_package_repository_type <- function(type, url, destdir, r_version) {
  switch(
    type,
    src = backup_package_repository_src(url, destdir, r_version),
    mac.binary = backup_package_repository_mac(url, destdir, r_version),
    win.binary = backup_package_repository(url, destdir, r_version)
  )
}

backup_package_repository_src <- function(url, destdir, r_version) {
  srcdir <- file.path(destdir, 'src', 'contrib')
  available_packages <- suppressWarnings(as.data.frame(available.packages(repos = url)))

  if (nrow(available_packages) == 0) {
    rlang::abort(sprintf("Can't find any package for repository %s.", url))
  }

  dir.create(srcdir, recursive = TRUE)

  download.file(file.path(url, 'src/contrib/PACKAGES'), file.path(srcdir, "PACKAGES"))
  download.file(file.path(url, 'src/contrib/PACKAGES.gz'), file.path(srcdir, "PACKAGES.gz"))
  download.file(file.path(url, 'src/contrib/PACKAGES.json'), file.path(srcdir, "PACKAGES.json"))
  download.packages(available_packages$Package, destdir = srcdir, available = available_packages)
}

backup_package_repository_mac <- function(url, destdir, r_version) {
  bin_url <- sprintf("%s/bin/macosx/contrib/%s", url, r_version)
  available_packages <- as.data.frame(suppressWarnings(available.packages(bin_url)))

  macdir <- file.path(destdir, 'bin', 'macosx', 'contrib', r_version)


  dir.create(macdir, recursive = TRUE)

  download.file(file.path(bin_url, 'PACKAGES'), file.path(macdir, "PACKAGES"))
  download.file(file.path(bin_url, 'PACKAGES.gz'), file.path(macdir, "PACKAGES.gz"))
  download.file(file.path(bin_url, 'PACKAGES.json'), file.path(macdir, "PACKAGES.json"))
  download.packages(available_packages$Package, destdir = macdir, available = available_packages, type = "mac.binary")
}

# backup_package_repository

