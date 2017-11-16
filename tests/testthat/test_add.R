library(pkgname)

context("add function")

test_that("basic add functionality", {
    expect_equal(1 + 2, add(1, 2))
})
