
<!-- README.md is generated from README.Rmd. Please edit that file -->

# icepalace

<!-- badges: start -->
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

Let’s snapshot the r-lib R-universe repository.

``` r
library(icepalace)
# In real life do not use a temporary directory :-)
destdir <- withr::local_tempdir()
snapshot_package_repository("https://r-lib.r-universe.dev", destdir = destdir)
fs::dir_tree(destdir)
#> /tmp/RtmpPDQScQ/file63bc1344c4e
#> ├── bin
#> │   ├── macosx
#> │   │   └── contrib
#> │   │       └── 4.2
#> │   │           ├── PACKAGES
#> │   │           ├── PACKAGES.gz
#> │   │           ├── PACKAGES.json
#> │   │           ├── R6_2.5.1.9000.tgz
#> │   │           ├── archive_1.1.4.9000.tgz
#> │   │           ├── askpass_1.1.0.tgz
#> │   │           ├── available_1.0.5.9000.tgz
#> │   │           ├── backports_1.4.1-9000.tgz
#> │   │           ├── bench_1.1.2.9000.tgz
#> │   │           ├── brio_1.1.3.9000.tgz
#> │   │           ├── cachem_1.0.6.9000.tgz
#> │   │           ├── callr_3.7.0.9000.tgz
#> │   │           ├── carrier_0.1.0.9000.tgz
#> │   │           ├── cleancall_0.1.2.9000.tgz
#> │   │           ├── cli_3.3.0.9000.tgz
#> │   │           ├── cliapp_0.1.1.9000.tgz
#> │   │           ├── clisymbols_1.2.0.tgz
#> │   │           ├── clock_0.6.0.9000.tgz
#> │   │           ├── commonmark_1.8.0.tgz
#> │   │           ├── conflicted_1.1.0.9000.tgz
#> │   │           ├── coro_1.0.2.9000.tgz
#> │   │           ├── covr_3.5.1.9003.tgz
#> │   │           ├── cpp11_0.4.2.9000.tgz
#> │   │           ├── crayon_1.5.1.9000.tgz
#> │   │           ├── credentials_1.3.2.tgz
#> │   │           ├── debugme_1.1.0.9001.tgz
#> │   │           ├── decor_1.0.1.9000.tgz
#> │   │           ├── desc_1.4.1.9000.tgz
#> │   │           ├── devoid_0.1.1.9000.tgz
#> │   │           ├── devtools_2.4.3.9000.tgz
#> │   │           ├── diffviewer_0.1.1.9000.tgz
#> │   │           ├── downlit_0.4.0.9000.tgz
#> │   │           ├── ellipsis_0.3.2.9000.tgz
#> │   │           ├── evaluate_0.15.2.tgz
#> │   │           ├── fastmap_1.1.0.9000.tgz
#> │   │           ├── filelock_1.0.2.9000.tgz
#> │   │           ├── fs_1.5.2.9000.tgz
#> │   │           ├── gargle_1.2.0.9002.tgz
#> │   │           ├── generics_0.1.2.9000.tgz
#> │   │           ├── gert_1.6.0.9000.tgz
#> │   │           ├── gh_1.3.0.9000.tgz
#> │   │           ├── gitcreds_0.1.1.9000.tgz
#> │   │           ├── gmailr_1.0.1.9000.tgz
#> │   │           ├── gtable_0.3.0.9000.tgz
#> │   │           ├── here_1.0.1.9000.tgz
#> │   │           ├── httr2_0.2.1.9000.tgz
#> │   │           ├── httr_1.4.3.9000.tgz
#> │   │           ├── jose_1.2.0.tgz
#> │   │           ├── keyring_1.3.0.9000.tgz
#> │   │           ├── later_1.3.0.9000.tgz
#> │   │           ├── lifecycle_1.0.1.9000.tgz
#> │   │           ├── lintr_2.0.1.9000.tgz
#> │   │           ├── liteq_1.1.0.tgz
#> │   │           ├── lobstr_1.1.1.9000.tgz
#> │   │           ├── meltr_1.0.0.9000.tgz
#> │   │           ├── memoise_2.0.1.9000.tgz
#> │   │           ├── mockery_0.4.3.9000.tgz
#> │   │           ├── oskeyring_0.1.3.9000.tgz
#> │   │           ├── pak_0.3.0.9000.tgz
#> │   │           ├── pillar_1.7.0.9003.tgz
#> │   │           ├── pingr_2.0.0.9000.tgz
#> │   │           ├── pkgbuild_1.3.1.9000.tgz
#> │   │           ├── pkgcache_2.0.1.9000.tgz
#> │   │           ├── pkgconfig_2.0.3.tgz
#> │   │           ├── pkgdepends_0.3.1.9000.tgz
#> │   │           ├── pkgdown_2.0.3.9000.tgz
#> │   │           ├── pkgload_1.2.4.9000.tgz
#> │   │           ├── prettycode_1.1.0.9000.tgz
#> │   │           ├── prettyunits_1.1.1.9000.tgz
#> │   │           ├── processx_3.5.3.9000.tgz
#> │   │           ├── progress_1.2.2.9000.tgz
#> │   │           ├── ps_1.7.0.9000.tgz
#> │   │           ├── ragg_1.2.2.9000.tgz
#> │   │           ├── rappdirs_0.3.3.9000.tgz
#> │   │           ├── rcmdcheck_1.4.0.9000.tgz
#> │   │           ├── rematch2_2.1.2.9000.tgz
#> │   │           ├── remotes_2.4.2.tgz
#> │   │           ├── rex_1.2.1.9000.tgz
#> │   │           ├── rlang_1.0.2.9000.tgz
#> │   │           ├── roxygen2_7.2.0.9000.tgz
#> │   │           ├── roxygen2md_1.0.0.9001.tgz
#> │   │           ├── rprojroot_2.0.3.9000.tgz
#> │   │           ├── scales_1.2.0.9000.tgz
#> │   │           ├── sessioninfo_1.2.2.9000.tgz
#> │   │           ├── showimage_1.0.0.tgz
#> │   │           ├── sloop_1.0.1.9000.tgz
#> │   │           ├── styler_1.7.0.9001.tgz
#> │   │           ├── svglite_2.1.0.9000.tgz
#> │   │           ├── systemfonts_1.0.4.9000.tgz
#> │   │           ├── testthat_3.1.4.9000.tgz
#> │   │           ├── textshaping_0.3.6.9000.tgz
#> │   │           ├── tidyselect_1.1.2.9000.tgz
#> │   │           ├── tzdb_0.3.0.9000.tgz
#> │   │           ├── urlchecker_1.0.1.9000.tgz
#> │   │           ├── usethis_2.1.6.9000.tgz
#> │   │           ├── vctrs_0.4.1.9000.tgz
#> │   │           ├── vdiffr_1.0.4.9000.tgz
#> │   │           ├── waldo_0.4.0.9000.tgz
#> │   │           ├── webfakes_1.1.3.9000.tgz
#> │   │           ├── whoami_1.3.0.9000.tgz
#> │   │           ├── withr_2.5.0.9000.tgz
#> │   │           ├── xml2_1.3.3.9000.tgz
#> │   │           ├── xmlparsedata_1.0.5.9000.tgz
#> │   │           ├── xopen_1.0.0.tgz
#> │   │           ├── ymlthis_0.1.5.9000.tgz
#> │   │           ├── zeallot_0.1.0.9000.tgz
#> │   │           └── zip_2.2.0.9000.tgz
#> │   └── windows
#> │       └── contrib
#> │           └── 4.2
#> │               ├── PACKAGES
#> │               ├── PACKAGES.gz
#> │               ├── PACKAGES.json
#> │               ├── R6_2.5.1.9000.zip
#> │               ├── archive_1.1.4.9000.zip
#> │               ├── askpass_1.1.0.zip
#> │               ├── available_1.0.5.9000.zip
#> │               ├── backports_1.4.1-9000.zip
#> │               ├── bench_1.1.2.9000.zip
#> │               ├── brio_1.1.3.9000.zip
#> │               ├── cachem_1.0.6.9000.zip
#> │               ├── callr_3.7.0.9000.zip
#> │               ├── carrier_0.1.0.9000.zip
#> │               ├── cleancall_0.1.2.9000.zip
#> │               ├── cli_3.3.0.9000.zip
#> │               ├── cliapp_0.1.1.9000.zip
#> │               ├── clisymbols_1.2.0.zip
#> │               ├── clock_0.6.0.9000.zip
#> │               ├── commonmark_1.8.0.zip
#> │               ├── conflicted_1.1.0.9000.zip
#> │               ├── coro_1.0.2.9000.zip
#> │               ├── covr_3.5.1.9003.zip
#> │               ├── cpp11_0.4.2.9000.zip
#> │               ├── crayon_1.5.1.9000.zip
#> │               ├── credentials_1.3.2.zip
#> │               ├── debugme_1.1.0.9001.zip
#> │               ├── decor_1.0.1.9000.zip
#> │               ├── desc_1.4.1.9000.zip
#> │               ├── devoid_0.1.1.9000.zip
#> │               ├── devtools_2.4.3.9000.zip
#> │               ├── diffviewer_0.1.1.9000.zip
#> │               ├── downlit_0.4.0.9000.zip
#> │               ├── ellipsis_0.3.2.9000.zip
#> │               ├── evaluate_0.15.2.zip
#> │               ├── fastmap_1.1.0.9000.zip
#> │               ├── filelock_1.0.2.9000.zip
#> │               ├── fs_1.5.2.9000.zip
#> │               ├── gargle_1.2.0.9002.zip
#> │               ├── generics_0.1.2.9000.zip
#> │               ├── gert_1.6.0.9000.zip
#> │               ├── gh_1.3.0.9000.zip
#> │               ├── gitcreds_0.1.1.9000.zip
#> │               ├── gmailr_1.0.1.9000.zip
#> │               ├── gtable_0.3.0.9000.zip
#> │               ├── here_1.0.1.9000.zip
#> │               ├── httr2_0.2.1.9000.zip
#> │               ├── httr_1.4.3.9000.zip
#> │               ├── jose_1.2.0.zip
#> │               ├── keyring_1.3.0.9000.zip
#> │               ├── later_1.3.0.9000.zip
#> │               ├── lifecycle_1.0.1.9000.zip
#> │               ├── lintr_2.0.1.9000.zip
#> │               ├── liteq_1.1.0.zip
#> │               ├── lobstr_1.1.1.9000.zip
#> │               ├── meltr_1.0.0.9000.zip
#> │               ├── memoise_2.0.1.9000.zip
#> │               ├── mockery_0.4.3.9000.zip
#> │               ├── oskeyring_0.1.3.9000.zip
#> │               ├── pak_0.3.0.9000.zip
#> │               ├── pillar_1.7.0.9003.zip
#> │               ├── pingr_2.0.0.9000.zip
#> │               ├── pkgbuild_1.3.1.9000.zip
#> │               ├── pkgcache_2.0.1.9000.zip
#> │               ├── pkgconfig_2.0.3.zip
#> │               ├── pkgdepends_0.3.1.9000.zip
#> │               ├── pkgdown_2.0.3.9000.zip
#> │               ├── pkgload_1.2.4.9000.zip
#> │               ├── prettycode_1.1.0.9000.zip
#> │               ├── prettyunits_1.1.1.9000.zip
#> │               ├── processx_3.5.3.9000.zip
#> │               ├── progress_1.2.2.9000.zip
#> │               ├── ps_1.7.0.9000.zip
#> │               ├── ragg_1.2.2.9000.zip
#> │               ├── rappdirs_0.3.3.9000.zip
#> │               ├── rcmdcheck_1.4.0.9000.zip
#> │               ├── rematch2_2.1.2.9000.zip
#> │               ├── remotes_2.4.2.zip
#> │               ├── rex_1.2.1.9000.zip
#> │               ├── rlang_1.0.2.9000.zip
#> │               ├── roxygen2_7.2.0.9000.zip
#> │               ├── roxygen2md_1.0.0.9001.zip
#> │               ├── rprojroot_2.0.3.9000.zip
#> │               ├── scales_1.2.0.9000.zip
#> │               ├── sessioninfo_1.2.2.9000.zip
#> │               ├── showimage_1.0.0.zip
#> │               ├── sloop_1.0.1.9000.zip
#> │               ├── styler_1.7.0.9001.zip
#> │               ├── svglite_2.1.0.9000.zip
#> │               ├── systemfonts_1.0.4.9000.zip
#> │               ├── testthat_3.1.4.9000.zip
#> │               ├── textshaping_0.3.6.9000.zip
#> │               ├── tidyselect_1.1.2.9000.zip
#> │               ├── tzdb_0.3.0.9000.zip
#> │               ├── urlchecker_1.0.1.9000.zip
#> │               ├── usethis_2.1.6.9000.zip
#> │               ├── vctrs_0.4.1.9000.zip
#> │               ├── vdiffr_1.0.4.9000.zip
#> │               ├── waldo_0.4.0.9000.zip
#> │               ├── webfakes_1.1.3.9000.zip
#> │               ├── whoami_1.3.0.9000.zip
#> │               ├── withr_2.5.0.9000.zip
#> │               ├── xml2_1.3.3.9000.zip
#> │               ├── xmlparsedata_1.0.5.9000.zip
#> │               ├── xopen_1.0.0.zip
#> │               ├── ymlthis_0.1.5.9000.zip
#> │               ├── zeallot_0.1.0.9000.zip
#> │               └── zip_2.2.0.9000.zip
#> └── src
#>     └── contrib
#>         ├── PACKAGES
#>         ├── PACKAGES.gz
#>         ├── PACKAGES.json
#>         ├── R6_2.5.1.9000.tar.gz
#>         ├── archive_1.1.4.9000.tar.gz
#>         ├── askpass_1.1.0.tar.gz
#>         ├── available_1.0.5.9000.tar.gz
#>         ├── backports_1.4.1-9000.tar.gz
#>         ├── bench_1.1.2.9000.tar.gz
#>         ├── brio_1.1.3.9000.tar.gz
#>         ├── cachem_1.0.6.9000.tar.gz
#>         ├── callr_3.7.0.9000.tar.gz
#>         ├── carrier_0.1.0.9000.tar.gz
#>         ├── cleancall_0.1.2.9000.tar.gz
#>         ├── cli_3.3.0.9000.tar.gz
#>         ├── cliapp_0.1.1.9000.tar.gz
#>         ├── clisymbols_1.2.0.tar.gz
#>         ├── clock_0.6.0.9000.tar.gz
#>         ├── commonmark_1.8.0.tar.gz
#>         ├── conflicted_1.1.0.9000.tar.gz
#>         ├── coro_1.0.2.9000.tar.gz
#>         ├── covr_3.5.1.9003.tar.gz
#>         ├── cpp11_0.4.2.9000.tar.gz
#>         ├── crayon_1.5.1.9000.tar.gz
#>         ├── credentials_1.3.2.tar.gz
#>         ├── debugme_1.1.0.9001.tar.gz
#>         ├── decor_1.0.1.9000.tar.gz
#>         ├── desc_1.4.1.9000.tar.gz
#>         ├── devoid_0.1.1.9000.tar.gz
#>         ├── devtools_2.4.3.9000.tar.gz
#>         ├── diffviewer_0.1.1.9000.tar.gz
#>         ├── downlit_0.4.0.9000.tar.gz
#>         ├── ellipsis_0.3.2.9000.tar.gz
#>         ├── evaluate_0.15.2.tar.gz
#>         ├── fastmap_1.1.0.9000.tar.gz
#>         ├── filelock_1.0.2.9000.tar.gz
#>         ├── fs_1.5.2.9000.tar.gz
#>         ├── gargle_1.2.0.9002.tar.gz
#>         ├── generics_0.1.2.9000.tar.gz
#>         ├── gert_1.6.0.9000.tar.gz
#>         ├── gh_1.3.0.9000.tar.gz
#>         ├── gitcreds_0.1.1.9000.tar.gz
#>         ├── gmailr_1.0.1.9000.tar.gz
#>         ├── gtable_0.3.0.9000.tar.gz
#>         ├── here_1.0.1.9000.tar.gz
#>         ├── httr2_0.2.1.9000.tar.gz
#>         ├── httr_1.4.3.9000.tar.gz
#>         ├── jose_1.2.0.tar.gz
#>         ├── keyring_1.3.0.9000.tar.gz
#>         ├── later_1.3.0.9000.tar.gz
#>         ├── lifecycle_1.0.1.9000.tar.gz
#>         ├── lintr_2.0.1.9000.tar.gz
#>         ├── liteq_1.1.0.tar.gz
#>         ├── lobstr_1.1.1.9000.tar.gz
#>         ├── meltr_1.0.0.9000.tar.gz
#>         ├── memoise_2.0.1.9000.tar.gz
#>         ├── mockery_0.4.3.9000.tar.gz
#>         ├── oskeyring_0.1.3.9000.tar.gz
#>         ├── pak_0.3.0.9000.tar.gz
#>         ├── pillar_1.7.0.9003.tar.gz
#>         ├── pingr_2.0.0.9000.tar.gz
#>         ├── pkgbuild_1.3.1.9000.tar.gz
#>         ├── pkgcache_2.0.1.9000.tar.gz
#>         ├── pkgconfig_2.0.3.tar.gz
#>         ├── pkgdepends_0.3.1.9000.tar.gz
#>         ├── pkgdown_2.0.3.9000.tar.gz
#>         ├── pkgload_1.2.4.9000.tar.gz
#>         ├── prettycode_1.1.0.9000.tar.gz
#>         ├── prettyunits_1.1.1.9000.tar.gz
#>         ├── processx_3.5.3.9000.tar.gz
#>         ├── progress_1.2.2.9000.tar.gz
#>         ├── ps_1.7.0.9000.tar.gz
#>         ├── ragg_1.2.2.9000.tar.gz
#>         ├── rappdirs_0.3.3.9000.tar.gz
#>         ├── rcmdcheck_1.4.0.9000.tar.gz
#>         ├── rematch2_2.1.2.9000.tar.gz
#>         ├── remotes_2.4.2.tar.gz
#>         ├── rex_1.2.1.9000.tar.gz
#>         ├── rlang_1.0.2.9000.tar.gz
#>         ├── roxygen2_7.2.0.9000.tar.gz
#>         ├── roxygen2md_1.0.0.9001.tar.gz
#>         ├── rprojroot_2.0.3.9000.tar.gz
#>         ├── scales_1.2.0.9000.tar.gz
#>         ├── sessioninfo_1.2.2.9000.tar.gz
#>         ├── showimage_1.0.0.tar.gz
#>         ├── sloop_1.0.1.9000.tar.gz
#>         ├── styler_1.7.0.9001.tar.gz
#>         ├── svglite_2.1.0.9000.tar.gz
#>         ├── systemfonts_1.0.4.9000.tar.gz
#>         ├── testthat_3.1.4.9000.tar.gz
#>         ├── textshaping_0.3.6.9000.tar.gz
#>         ├── tidyselect_1.1.2.9000.tar.gz
#>         ├── tzdb_0.3.0.9000.tar.gz
#>         ├── urlchecker_1.0.1.9000.tar.gz
#>         ├── usethis_2.1.6.9000.tar.gz
#>         ├── vctrs_0.4.1.9000.tar.gz
#>         ├── vdiffr_1.0.4.9000.tar.gz
#>         ├── waldo_0.4.0.9000.tar.gz
#>         ├── webfakes_1.1.3.9000.tar.gz
#>         ├── whoami_1.3.0.9000.tar.gz
#>         ├── withr_2.5.0.9000.tar.gz
#>         ├── xml2_1.3.3.9000.tar.gz
#>         ├── xmlparsedata_1.0.5.9000.tar.gz
#>         ├── xopen_1.0.0.tar.gz
#>         ├── ymlthis_0.1.5.9000.tar.gz
#>         ├── zeallot_0.1.0.9000.tar.gz
#>         └── zip_2.2.0.9000.tar.gz
```
