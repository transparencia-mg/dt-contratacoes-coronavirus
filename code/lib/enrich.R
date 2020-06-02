enrich <- function(df) {
  
  return <- df %>% 
    dplyr::mutate(
        DOCUMENTOS_PROCESSO = create_documentos_processo(NUMERO_PROCESSO_COMPRA),
        PORTAL_TRANSPARENCIA = lookup_link_portal_transparencia(NUMERO_PROCESSO_COMPRA),
        PROCESSO_SEI = lookup_processo_sei(NUMERO_PROCESSO_COMPRA),
        INTEGRA_PROCESSO_SEI = lookup_link_sei(NUMERO_PROCESSO_COMPRA)
      )

  return
}


create_documentos_processo <- function(x) {
  
  url <- "https://www1.compras.mg.gov.br/processocompra/processo/consultaProcessoCompra.html?metodo=pesquisar&codigoUnidadeCompra={unidade}&numero={numero}&ano={ano}"
  
  unidade <- stringr::str_sub(x, 1, 7)
  numero <- stringr::str_sub(x, 9, 14) %>% as.numeric()
  ano <- stringr::str_sub(x, 16, 19)
  
  glue::glue(url)
}

lookup_link_portal_transparencia <- function(x) {
  table <- readr::read_csv2("data-raw/evidencias.csv", col_types = c("ccncccccnc"))
  
  lookup <- table$LINK_PORTAL_TRANSPARENCIA
  names(lookup) <- table$PROCESSO_COMPRA
  
  lookup[x] %>% unname()
}

lookup_processo_sei <- function(x) {
  table <- readr::read_csv2("data-raw/evidencias.csv", col_types = c("ccncccccnc"))
  
  lookup <- table$PROCESSO_SEI
  names(lookup) <- table$PROCESSO_COMPRA
  
  lookup[x] %>% unname()
}

lookup_link_sei <- function(x) {
  table <- readr::read_csv2("data-raw/evidencias.csv", col_types = c("ccncccccnc"))
  
  lookup <- table$LINK_SEI
  names(lookup) <- table$PROCESSO_COMPRA
  
  lookup[x] %>% unname()
}

