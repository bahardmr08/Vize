library(testthat)
#ön hazırlık
test_that("Çalışma alanındaki tüm değişkenleri sil", {
  rm(list = ls())
  expect_equal(length(ls()), 0)
})

test_that("Eğer mevcutsa veri setini sil", {
  if ("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files()) {
    file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
  }
  expect_equal("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files(), FALSE)
})

#2.1
current_dir <- getwd()
print(current_dir)
relative_path <- file.path(current_dir, "LABEX_Q1_210401031_bahar_demir.R")

source(relative_path)
