library(testthat)
library(readxl)
library(openxlsx)

test_that("ler_base_atual() reads an Excel file", {
  # Criar um arquivo temporário Excel para o teste
  temp_file <- tempfile(fileext = ".xlsx")
  write.xlsx(data.frame(a = 1:3, b = letters[1:3]), temp_file)

  result <- ler_base_atual(temp_file, sheet = 1)
  expect_true(is.data.frame(result))
  expect_equal(nrow(result), 3)
  expect_equal(ncol(result), 2)
  expect_equal(result$a, 1:3)
  expect_equal(result$b, letters[1:3])

  # Remover o arquivo temporário
  unlink(temp_file)
})

test_that("ler_base_atual() errors if file does not exist.", {
  expect_error(ler_base_atual("non_existent_file.xlsx", sheet = 1))
})

test_that("ler_base_atual() errors if sheet does not exist.", {
  temp_file <- tempfile(fileext = ".xlsx")
  write.xlsx(data.frame(a = 1:3, b = letters[1:3]), temp_file)

  expect_error(ler_base_atual(temp_file, sheet = 2))

  unlink(temp_file)
})
