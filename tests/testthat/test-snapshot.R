test_that("snapshot_package_repository() works", {
  destdir <- withr::local_tempdir()
  snapshot_package_repository("https://maelle.r-universe.dev", destdir = destdir)
  r_version <- sanitize_version(rversions::r_release()[["version"]])
  expect_true(dir.exists(file.path(destdir, "src")))
  expect_true(dir.exists(file.path(destdir, "bin", "macosx", "contrib", r_version)))
  expect_true(dir.exists(file.path(destdir, "bin", "windows", "contrib", r_version)))
})

test_that("snapshot_package_repository() when there is no package", {
  expect_snapshot_error(
    snapshot_package_repository("https://_blop_.r-universe.dev", type = "source")
  )

  expect_snapshot(
    snapshot_package_repository(
      "https://jeroen.r-universe.dev",
      type = "win.binary",
      r_version = "1.1"
    )
  )
})
