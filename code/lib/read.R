read <- function(path) {

  infer_spec <- names(readxl::read_excel(path, n_max = 1, .name_repair = janitor::make_clean_names))
  
  expected_cols <- c("processo_sei", "url_processo_sei", "numero_processo_formatado", "url_portal_transparencia", "data_criacao_processo", "objeto_processo", 
                     "url_documentos_processo", "codigo_orgao_entidade_pedido", 
                     "sigla_orgao_entidade_pedido", "nome_orgao_entidade_pedido", 
                     "situacao_processo", "procedimento_contratacao_detalhamento_1", 
                     "numero_contrato", "contrato_termo_aditivo_arquivos",
                     "codigo_orgao_entidade_contratante", "sigla_orgao_entidade_contratante", 
                     "nome_orgao_entidade_contratante", "data_publicacao_contrato", 
                     "data_inicio_vigencia_contrato", "data_limite_vigencia_contrato", 
                     "data_termino_vigencia_contrato", "cnpj_cpf_fornecedor_formatado", 
                     "nome_empresarial_nome_fornecedor", "codigo_item_material_servico_numerico", 
                     "item_material_servico", "codigo_unidade_orcamentaria", "sigla_unidade_orcamentaria", 
                     "nome_unidade_orcamentaria", "descricao_linha_fornecimento", 
                     "cidade_entrega_item", "quantidade_homologada", "valor_unitario_referencia_item_processo", 
                     "valor_unitario_homologado_item_processo", "valor_total_referencia_item_processo", 
                     "valor_total_homologado")
  
  stopifnot(all(infer_spec == expected_cols))
  
  
  cols_spec <- c(
    PROCESSO_SEI = "text",
    URL_PROCESSO_SEI = "text",
    NUMERO_PROCESSO_COMPRA = "text",
    URL_PORTAL_TRANSPARENCIA = "text",
    DATA_CADASTRAMENTO_PROCESSO = "date",
    OBJETO_PROCESSO = "text",
    URL_DOCUMENTOS_PROCESSO = "text",
    CODIGO_ORGAO_DEMANDANTE = "numeric",
    SIGLA_ORGAO_DEMANDANTE = "text",
    ORGAO_DEMANDANTE = "text",
    SITUACAO_PROCESSO = "text",
    PROCEDIMENTO_CONTRATACAO = "text",
    NUMERO_CONTRATO = "numeric",
    URL_INTEGRA_CONTRATO = "text",
    CODIGO_ORGAO_CONTRATO = "numeric",
    SIGLA_ORGAO_CONTRATO = "text",
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
    SIGLA_UNIDADE_ORCAMENTARIA = "text",
    UNIDADE_ORCAMENTARIA = "text",
    LINHA_FORNECIMENTO = "text",
    CIDADE_ENTREGA = "text",
    QUANTIDADE_HOMOLOGADA = "numeric",
    VALOR_REFERENCIA_UNITARIO = "numeric",
    VALOR_HOMOLOGADO_UNITARIO = "numeric",
    VALOR_REFERENCIA = "numeric",
    VALOR_HOMOLOGADO = "numeric")
  
  
  return <- readxl::read_excel(path, 
                               col_names = names(cols_spec),
                               col_types = cols_spec,
                               skip = 1)
  
  return
}