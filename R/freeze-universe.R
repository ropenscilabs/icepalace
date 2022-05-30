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
                                      type = c("src", "mac_binaries", "windows_binaries"),
                                      r_version = NULL) {

  # TODO
  # check url is length 1 and remove backslash at the end
  # or use urltools to grow it later in the code, might be safer

  type <- rlang::arg_match(type, values = c("src", "mac_binaries", "windows_binaries"), multiple = TRUE)

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
    mac_binaries = backup_package_repository_mac(url, destdir, r_version),
    windows_binaries = backup_package_repository(url, destdir, r_version)
  )
}

backup_package_repository_src <- function(url, destdir, r_version) {
  srcdir <- file.path(destdir, 'src', 'contrib')
  dir.create(srcdir, recursive = TRUE)
  available_packages <- suppressWarnings(as.data.frame(available.packages(repos = url)))

  if (nrow(available_packages) == 0) {
    rlang::abort(sprintf("Can't find any package for repository %s.", url))
  }

  download.file(file.path(url, 'src/contrib/PACKAGES'), file.path(srcdir, "PACKAGES"))
  download.file(file.path(url, 'src/contrib/PACKAGES.gz'), file.path(srcdir, "PACKAGES.gz"))
  download.file(file.path(url, 'src/contrib/PACKAGES.json'), file.path(srcdir, "PACKAGES.json"))
  download.packages(available_packages$Package, destdir = srcdir, available = available_packages)
}

# backup_package_repository_mac

# backup_package_repository

