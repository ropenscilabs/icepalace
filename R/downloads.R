safely_download_file <- function(url, destfile) {
  httr2::request(url) |>
    httr2::req_user_agent("icepalace https://docs.ropensci.org/icepalace") |>
    httr2::req_retry(max_tries = 3) |>
    httr2::req_perform(path = destfile)
}

safely_download_packages <- function(url, packages, destdir, available_packages, type = "source") {

  extension <- switch(
    type,
    source = ".tar.gz",
    mac.binary = ".tgz",
    win.binary = ".zip"
  )

  file_names <- paste0(
    packages, "_",
    available_packages[available_packages$Package == packages, "Version"],
    extension
  )

  purrr::walk(
    file_names,
    ~ safely_download_file(file.path(url, .), file.path(destdir, .))
  )

}
