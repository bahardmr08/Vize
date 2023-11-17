library(testthat)
#C6n hazD1rlD1k
test_that("CalD1Ema alanD1ndaki tC<m deDiEkenleri sil", {
  rm(list = ls())
  expect_equal(length(ls()), 0)
})

test_that("EDer mevcutsa veri setini sil", {
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
#2.4

test_that("Dosya varl??k testi", {
  # Dosyan??n var olup olmad??????n?? kontrol etme
  file_exist <- file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv")
  expect_true(file_exist, info = "Dosyan??n bulundu??unu kontrol etme")
})
#2.5
test_that("Test : maps adl?? de??i??ken Global Workspace???de mevcuttur.", {
  expect_true(exists("maps", envir = .GlobalEnv), info = "maps adl?? de??i??ken mevcut de??il.")
})
#2.6
test_that("maps de??i??keninin data.frame olup olmad??????n?? kontrol et", {
  
  
  expect_true(is.data.frame(maps), info = "maps de??i??keninin bir data.frame oldu??unu kontrol etme")
})
#2.7
test_that("maps data.frame'inin ilk s??tununun ad??n?? kontrol et", {
  
  
  expect_equal(names(maps)[1], "City", info = "maps data.frame'inin ilk s??tununun ad??n?? kontrol etme")
})
#2.8
test_that("maps data.frame'inin 5. s??tununun ad??n?? kontrol et", {
  
  expect_false("Title" %in% names(maps), 
               info = "maps data.frame'inin 5. s??tununun ad??nda 'Title' kelimesi ge??miyor mu?")
})
#2.9
test_that("Latitude s??tunu numeric de??erlerden olu??mal??d??r", {
  
  expect_true(all(suppressWarnings(!is.na(as.numeric(maps$Latitude)))),
              info = "Latitude s??tunu numeric de??erlerden olu??mal??d??r")
})
#2.10
test_that("Longitude s??tunu numeric de??erlerden olu??mal??d??r", {
  
  expect_true(all(suppressWarnings(!is.na(as.numeric(maps$Longitude)))),
              info = "Longitude s??tunu numeric de??erlerden olu??mal??d??r")
})
#2.11 
test_that("idx nesnesi Global Workspace'de mevcut olmal??d??r", {
  
  expect_true(exists("idx", envir = globalenv()), 
              info = "idx nesnesinin var oldu??unu kontrol etme")
})
#2.12
test_that("idx nesnesinin tipi integer'dir", {
  
  expect_identical(class(idx), "integer", 
                   info = "idx nesnesinin tipinin integer oldu??unu kontrol etme")
})

#2.13
test_that("Year s??tunu numeric de??erlerden olu??mal??d??r", {
  
  expect_true(all(suppressWarnings(!is.na(as.numeric(maps$Year)))),
              info = "Year s??tunu numeric de??erlerden olu??mal??d??r")
})