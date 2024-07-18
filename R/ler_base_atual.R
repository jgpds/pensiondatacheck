#' Ler base atual
#'
#' @param path O caminho para o arquivo Excel.
#' @param sheet A planilha a ser lida.
#' @inheritParams readxl::read_excel
#'
#' @return Um tibble com a base atual.
#' @export
#'
#' @examples
#' base_atual <- ler_base_atual("Aderncia_-_Exemplo.xlsx", sheet = 1)
ler_base_atual <- function(path, sheet = 1) {
  readxl::read_excel(path, sheet = sheet)
}
