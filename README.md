
<!-- README.md is generated from README.Rmd. Please edit that file -->

# icepalace

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/ropenscilabs/icepalace/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ropenscilabs/icepalace/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of this package is to download entire CRAN-like repositories,
for instance R-universe repositories to use the archive as a frozen
snapshot. The frozen snapshot could be kept locally, or for instance
served on GitHub Pages. It might be useful for reproducibility.

The goal of this package is **not** to also snapshot the dependencies of
the repository packages that are not in the repository. If you want such
an exhaustive snapshot, use tools like
[MRAN](https://mran.microsoft.com/timemachine) or [RStudio Package
Manager](https://www.rstudio.com/products/package-manager/).

## Installation

You can install the development version of icepalace from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ropenscilabs/icepalace")
```

## Example

Let’s snapshot the vimc R-universe repository and then install porcelain
from that repo.

``` r
library(icepalace)
# In real life do not use a temporary directory :-)
destdir <- withr::local_tempdir()
snapshot_package_repository("https://vimc.r-universe.dev", destdir = destdir)
fs::dir_tree(destdir)
#> /tmp/RtmpOZlGbo/fileb4758a9515
#> ├── bin
#> │   ├── macosx
#> │   │   └── contrib
#> │   │       └── 4.2
#> │   │           ├── PACKAGES
#> │   │           ├── PACKAGES.gz
#> │   │           ├── PACKAGES.json
#> │   │           ├── beers_0.1.0.tgz
#> │   │           ├── dettl_0.0.19.tgz
#> │   │           ├── jenner_0.0.26.tgz
#> │   │           ├── jsonvalidate_1.4.0.tgz
#> │   │           ├── montagu_0.6.1.tgz
#> │   │           ├── orderly.rstudio_0.0.3.tgz
#> │   │           ├── orderly.sharepoint_0.1.4.tgz
#> │   │           ├── orderly_1.4.8.tgz
#> │   │           ├── orderlyweb_0.1.13.tgz
#> │   │           ├── porcelain_0.1.8.tgz
#> │   │           ├── spud_0.1.7.tgz
#> │   │           └── vaultr_1.1.0.tgz
#> │   └── windows
#> │       └── contrib
#> │           └── 4.2
#> │               ├── PACKAGES
#> │               ├── PACKAGES.gz
#> │               ├── PACKAGES.json
#> │               ├── beers_0.1.0.zip
#> │               ├── dettl_0.0.19.zip
#> │               ├── jenner_0.0.26.zip
#> │               ├── jsonvalidate_1.4.0.zip
#> │               ├── montagu_0.6.1.zip
#> │               ├── orderly.rstudio_0.0.3.zip
#> │               ├── orderly.sharepoint_0.1.4.zip
#> │               ├── orderly_1.4.8.zip
#> │               ├── orderlyweb_0.1.13.zip
#> │               ├── porcelain_0.1.8.zip
#> │               ├── spud_0.1.7.zip
#> │               └── vaultr_1.1.0.zip
#> └── src
#>     └── contrib
#>         ├── PACKAGES
#>         ├── PACKAGES.gz
#>         ├── PACKAGES.json
#>         ├── beers_0.1.0.tar.gz
#>         ├── dettl_0.0.19.tar.gz
#>         ├── jenner_0.0.26.tar.gz
#>         ├── jsonvalidate_1.4.0.tar.gz
#>         ├── montagu_0.6.1.tar.gz
#>         ├── orderly.rstudio_0.0.3.tar.gz
#>         ├── orderly.sharepoint_0.1.4.tar.gz
#>         ├── orderly_1.4.8.tar.gz
#>         ├── orderlyweb_0.1.13.tar.gz
#>         ├── porcelain_0.1.8.tar.gz
#>         ├── spud_0.1.7.tar.gz
#>         └── vaultr_1.1.0.tar.gz

repo <- sprintf("file:///%s", destdir)
repo
#> [1] "file:////tmp/RtmpOZlGbo/fileb4758a9515"
install.packages("porcelain", repos = c(rlib = repo, CRAN = 'https://cloud.r-project.org'))
#> Installation du package dans '/home/maelle/R/x86_64-pc-linux-gnu-library/4.2'
#> (car 'lib' n'est pas spécifié)
#> installation des dépendances 'webutils', 'swagger', 'V8', 'jsonvalidate', 'plumber'

pkg_info <- sessioninfo::package_info("porcelain")
pkg_info[pkg_info$package == "porcelain",]
#>  package   * version date (UTC) lib source
#>  porcelain   0.1.8   2022-05-31 [1] https://vimc.r-universe.dev (R 4.2.0)
#> 
#>  [1] /home/maelle/R/x86_64-pc-linux-gnu-library/4.2
#>  [2] /opt/R/4.2.0/lib/R/library
```

By default the binaries are downloaded for the latest released version
of R (`rversions::r_release()`). If `type` includes `win.binary` or
`mac.binary` (by default, `type` includes source and both kinds of
binaries), and there are no binary for the R version, the function will
warn.

``` r
snapshot_package_repository("https://ggseg.r-universe.dev", type = "win.binary", r_version = "3.3")
#> Warning: ✖ Can't find any package win.binary for repository `https://ggseg.r-universe.dev/bin/windows/contrib/3.3`.
#> ℹ Maybe try another R version?
```

If there are no package at all (for instance if there is a typo in the
URL), the function will error.

``` r
snapshot_package_repository("https://_blop_.r-universe.dev")
#> Error in `snapshot_package_repository_src()` at icepalace/R/snapshot.R:35:4:
#> ! ✖ Can't find any package source for repository `https://_blop_.r-universe.dev`.
```
