library(dplyr)

controle <- readr::read_csv2("data-raw/compras-coronavirus-controle.csv", col_types = c("ccncccccnc"), locale = readr::locale(decimal_mark = ",", grouping_mark = "."))

compras_coronavirus <- readr::read_csv("data/compras-coronavirus.csv")

diff_publicacao <- anti_join(controle, compras_coronavirus, by = "NUMERO_PROCESSO_COMPRA")

problemas_publicacao <- diff_publicacao %>% 
  filter(DIVULGAR == "sim") %>% 
  pull(NUMERO_PROCESSO_COMPRA)

if(length(problemas_publicacao) > 0) {
  stop(glue::glue("O processo {problemas_publicacao} não foi inserido no Armazém."))
}

diff_catalogacao <- anti_join(compras_coronavirus, controle, by = "NUMERO_PROCESSO_COMPRA")

diff_catalogacao %>% 
  pull(NUMERO_PROCESSO_COMPRA)
