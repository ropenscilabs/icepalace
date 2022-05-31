
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

Let’s snapshot the mrc-ide R-universe repository and then install dde
from that repo.

``` r
library(icepalace)
# In real life do not use a temporary directory :-)
destdir <- withr::local_tempdir()
snapshot_package_repository("https://mrc-ide.r-universe.dev", destdir = destdir)
fs::dir_tree(destdir)
#> /tmp/RtmprFXQAF/fileb97b14f07edc
#> ├── bin
#> │   ├── macosx
#> │   │   └── contrib
#> │   │       └── 4.2
#> │   │           ├── PACKAGES
#> │   │           ├── PACKAGES.gz
#> │   │           ├── PACKAGES.json
#> │   │           ├── beers_0.1.0.tgz
#> │   │           ├── buildr_0.0.3.tgz
#> │   │           ├── conan_0.1.1.tgz
#> │   │           ├── context_0.3.0.tgz
#> │   │           ├── dde_1.0.3.tgz
#> │   │           ├── defer_0.1.0.tgz
#> │   │           ├── didehpc_0.3.12.tgz
#> │   │           ├── dust_0.11.27.tgz
#> │   │           ├── heartbeatr_0.6.0.tgz
#> │   │           ├── individual_0.1.8.tgz
#> │   │           ├── jsonvalidate_1.4.0.tgz
#> │   │           ├── malariaEquilibrium_1.0.1.tgz
#> │   │           ├── malariasimulation_1.3.0.tgz
#> │   │           ├── mcstate_0.9.1.tgz
#> │   │           ├── nomad_0.0.1.tgz
#> │   │           ├── odin.dust_0.2.16.tgz
#> │   │           ├── odin.js_0.1.11.tgz
#> │   │           ├── odin_1.3.4.tgz
#> │   │           ├── porcelain_0.1.8.tgz
#> │   │           ├── provisionr_0.1.14.tgz
#> │   │           ├── queuer_0.3.0.tgz
#> │   │           ├── rrq_0.5.7.tgz
#> │   │           ├── specio_0.1.4.tgz
#> │   │           ├── syncr_0.0.3.tgz
#> │   │           ├── traduire_0.0.6.tgz
#> │   │           └── vaultr_1.1.0.tgz
#> │   └── windows
#> │       └── contrib
#> │           └── 4.2
#> │               ├── PACKAGES
#> │               ├── PACKAGES.gz
#> │               ├── PACKAGES.json
#> │               ├── beers_0.1.0.zip
#> │               ├── buildr_0.0.3.zip
#> │               ├── conan_0.1.1.zip
#> │               ├── context_0.3.0.zip
#> │               ├── dde_1.0.3.zip
#> │               ├── defer_0.1.0.zip
#> │               ├── didehpc_0.3.12.zip
#> │               ├── dust_0.11.27.zip
#> │               ├── individual_0.1.8.zip
#> │               ├── jsonvalidate_1.4.0.zip
#> │               ├── malariaEquilibrium_1.0.1.zip
#> │               ├── malariasimulation_1.3.0.zip
#> │               ├── mcstate_0.9.1.zip
#> │               ├── nomad_0.0.1.zip
#> │               ├── odin.dust_0.2.16.zip
#> │               ├── odin.js_0.1.11.zip
#> │               ├── odin_1.3.4.zip
#> │               ├── porcelain_0.1.8.zip
#> │               ├── provisionr_0.1.14.zip
#> │               ├── queuer_0.3.0.zip
#> │               ├── rrq_0.5.7.zip
#> │               ├── specio_0.1.4.zip
#> │               ├── syncr_0.0.3.zip
#> │               ├── traduire_0.0.6.zip
#> │               └── vaultr_1.1.0.zip
#> └── src
#>     └── contrib
#>         ├── PACKAGES
#>         ├── PACKAGES.gz
#>         ├── PACKAGES.json
#>         ├── beers_0.1.0.tar.gz
#>         ├── buildr_0.0.3.tar.gz
#>         ├── conan_0.1.1.tar.gz
#>         ├── context_0.3.0.tar.gz
#>         ├── dde_1.0.3.tar.gz
#>         ├── defer_0.1.0.tar.gz
#>         ├── didehpc_0.3.12.tar.gz
#>         ├── dust_0.11.27.tar.gz
#>         ├── heartbeatr_0.6.0.tar.gz
#>         ├── individual_0.1.8.tar.gz
#>         ├── jsonvalidate_1.4.0.tar.gz
#>         ├── malariaEquilibrium_1.0.1.tar.gz
#>         ├── malariasimulation_1.3.0.tar.gz
#>         ├── mcstate_0.9.1.tar.gz
#>         ├── nomad_0.0.1.tar.gz
#>         ├── odin.dust_0.2.16.tar.gz
#>         ├── odin.js_0.1.11.tar.gz
#>         ├── odin_1.3.4.tar.gz
#>         ├── porcelain_0.1.8.tar.gz
#>         ├── provisionr_0.1.14.tar.gz
#>         ├── queuer_0.3.0.tar.gz
#>         ├── rrq_0.5.7.tar.gz
#>         ├── specio_0.1.4.tar.gz
#>         ├── syncr_0.0.3.tar.gz
#>         ├── traduire_0.0.6.tar.gz
#>         └── vaultr_1.1.0.tar.gz

repo <- sprintf("file:///%s", destdir)
repo
#> [1] "file:////tmp/RtmprFXQAF/fileb97b14f07edc"
install.packages("dde", repos = c(rlib = repo, CRAN = 'https://cloud.r-project.org'))
#> Installation du package dans '/home/maelle/R/x86_64-pc-linux-gnu-library/4.2'
#> (car 'lib' n'est pas spécifié)
#> installation de la dépendance 'ring'

pkg_info <- sessioninfo::package_info("dde")
pkg_info[pkg_info$package == "dde",]
#>  package * version date (UTC) lib source
#>  dde       1.0.3   2022-05-31 [1] https://mrc-ide.r-universe.dev (R 4.2.0)
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
snapshot_package_repository("https://mrc-ide.r-universe.dev", type = "win.binary", r_version = "3.3")
#> Warning: ✖ Can't find any package win.binary for repository `https://mrc-ide.r-universe.dev/bin/windows/contrib/3.3`.
#> ℹ Maybe try another R version?
```

If there are no package at all (for instance if there is a typo in the
URL), the function will error.

``` r
snapshot_package_repository("https://_blop_.r-universe.dev")
#> Error in `snapshot_package_repository_src()` at icepalace/R/snapshot.R:35:4:
#> ! ✖ Can't find any package source for repository `https://_blop_.r-universe.dev`.
```
