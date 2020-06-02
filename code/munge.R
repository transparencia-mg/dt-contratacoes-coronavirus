library(magrittr)

purrr::walk(list.files("code/lib/", full.names = TRUE), source)

df <- read("data-raw/compras-coronavirus.xlsx") %>% 
        recode() %>% 
        enrich()

# nao é possível gerar tabela atual
# df %>% 
#   dplyr::group_by(# inserir ano
#                   CODIGO_ORGAO_DEMANDANTE, 
#                   ORGAO_DEMANDANTE, # substituir por sigla
#                   CNPJ_CPF_CONTRATADO, 
#                   CONTRATADO,
#                   OBJETO_PROCESSO, # checar valor publicado atualmente
#                   INICIO_VIGENCIA,
#                   FIM_VIGENCIA_ATUALIZADA, # checar valor publicado atualmente
#                   PROCESSO_SEI,
#                   INTEGRA_PROCESSO_SEI,
#                   NUMERO_PROCESSO_COMPRA,
#                   DOCUMENTOS_PROCESSO,
#                   NUMERO_CONTRATO,
#                   INTEGRA_CONTRATO,
#                   PORTAL_TRANSPARENCIA) %>% 
#   dplyr::summarize(VALOR = sum(VALOR_TOTAL_HOMOLOGADO))


readr::write_excel_csv2(df, "data/compras-coronavirus.csv")
