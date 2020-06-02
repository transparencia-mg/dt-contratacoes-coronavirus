read <- function(path) {

  cols_spec <- c(
    NUMERO_PROCESSO_COMPRA = "text",
    PROCESSO_SEI = "text",
    INTEGRA_PROCESSO_SEI = "text",
    DATA_CADASTRAMENTO_PROCESSO = "date",
    OBJETO_PROCESSO = "text",
    DOCUMENTOS_PROCESSO = "text",
    PORTAL_TRANSPARENCIA = "text",
    CODIGO_ORGAO_DEMANDANTE = "numeric",
    ORGAO_DEMANDANTE = "text",
    SITUACAO_PROCESSO = "text",
    PROCEDIMENTO_CONTRATACAO = "text",
    NUMERO_CONTRATO = "numeric",
    INTEGRA_CONTRATO = "text",
    SITUACAO_CONTRATO = "text",
    CODIGO_ORGAO_CONTRATO = "numeric",
    ORGAO_CONTRATO = "text",
    DATA_PUBLICACAO = "date",
    INICIO_VIGENCIA = "date",
    FIM_VIGENCIA = "date",
    FIM_VIGENCIA_ATUALIZADA = "date",
    CNPJ_CPF_CONTRATADO = "text",
    CONTRATADO = "text",
    CODIGO_ITEM_MATERIAL_SERVICO = "numeric",
    ITEM_MATERIAL_SERVICO = "text",
    CODIGO_UNIDADE_ORCAMENTARIA = "numeric",
    UNIDADE_ORCAMENTARIA = "text",
    LINHA_FORNECIMENTO = "text",
    CIDADE_ENTREGA_ITEM = "text",
    QUANTIDADE_HOMOLOGADA = "numeric",
    VALOR_REFERENCIA_UNITARIO_ITEM = "numeric",
    VALOR_HOMOLOGADO_UNITARIO_ITEM = "numeric",
    VALOR_TOTAL_REFERENCIA = "numeric",
    VALOR_TOTAL_HOMOLOGADO = "numeric")
  
  
  return <- readxl::read_excel(path, 
                               col_names = names(cols_spec),
                               col_types = cols_spec,
                               skip = 1)
  
  return
}