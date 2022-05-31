# snapshot_package_repository() when there is no package

    x Can't find any package source for repository `https://_blop_.r-universe.dev`.

---

    Code
      snapshot_package_repository("https://jeroen.r-universe.dev", type = "win.binary",
        r_version = "1.1")
    Warning <rlang_warning>
      x Can't find any package win.binary for repository `https://jeroen.r-universe.dev/bin/windows/contrib/1.1`.
      i Maybe try another R version?

