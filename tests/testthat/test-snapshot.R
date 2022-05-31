test_that("snapshot_package_repository() when there is no package", {
  expect_snapshot_error(
    snapshot_package_repository("https://_blop_.r-universe.dev", type = "source")
  )

  expect_snapshot_warning(
    snapshot_package_repository(
      "https://jeroen.r-universe.dev",
      type = "win.binary",
      r_version = "1.1"
    )
  )
})
