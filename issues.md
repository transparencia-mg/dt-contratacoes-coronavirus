# Issues

## aspectos divulgação

* [x] Remover linha inicial `compras_contratos_orgao_dispensa_novo_layout.xlsx`

* [ ] Considerar divulgação dos arquivos em formato excel e csv

* [ ] Alterar script para exportar arquivo csv com separador de virgula

* [ ] Criar release das colunas que: foram inseridas; foram excluídas; tiveram nomes alterados; tiveram conteúdo alterado (OBJETO_PROCESSO)
    * explicar raciocinio de harmonização com a nova consulta do Portal

* [ ] Adicionar ANO, SIGLA_ORGAO_ENTIDADE, e PORTAL_TRANSPARENCIA consulta armazém e ao dicionário de dados

## aspectos qualidades

* [ ] Investigar motivos de ausenência dos processos "2311076 000134/2020" e "0500005 000054/2020"
    * já adicionei a consulta no armazém

* [ ] Solicitar definições das variáveis do armazém de informações

* [ ] Solicitar mapa de carga do luiz do portal da transparência

* [ ] Confirmar preenchimento manual da variável `Ano Publicação Contrato`, `Código Órgão/Entidade Contratante` e `Sigla Órgão/Entidade Contratante`

* [ ] Investigar processo de compra SEPLAG que não possui processo SEI

* [ ] Confirmar número processo de compra dos processos SEI 2300.01.0048942/2020-33 e 2300.01.0053745/2020-41

* [ ] Adicionar coluna FONTE ao arquivo `evidencias.csv` com referência ao email

* [ ] Verificar links distintos portal da transparência para mesmo processo de compra 1371056 000003/2020
        * http://www.transparencia.mg.gov.br/compras-e-patrimonio/compras-e-contratos/comprasecontratos-procedimento/0/2020/01-01-2020/06-04-2020/1831058/15/0/0/80/79/621/7930/21585/79300596/170097/1669486/320876/1371056000003-2020
        * http://www.transparencia.mg.gov.br/compras-e-patrimonio/compras-e-contratos/comprasecontratos-procedimento/3/2020/01-01-2020/18-05-2020/1831058/0/0/23776/0/0/0/0/21585/79300596/170097/1669486/320876/1371056000003-2020

* [ ] Confirmar número SEI do processo de compra 0250073 000009/2020

* [ ] Adequar nomes variáveis no armazém e dicionário de dados
        * script está desconsiderando os valores atuais

## decisões

* harmonização entre consultas a ponto de possibilitar pelo menos empilhamento
    * de,da,do

* remover ano publicação tendo em vista que não existe na consulta portal da transparência e possui valores incompleto e pode ser derivada
* processo sei e integra processo sei são primeiras colunas tendo em vista que não existem no portal da transparência e são inicio do processo
* todas as colunas links passam a ter o prefixo URL_
* link para detalhamento do processo de compra vem depois da coluna numero do processo de compra para simular link embedado do portal
* remocao SITUACAO_CONTRATO tendo em vista pouco valor informativo e nao estar presenta no portal da transparencia
* remocao sufixo _ITEM nas colunas CIDADE_ENTREGA_ITEM, VALOR_REFERENCIA_UNITARIO_ITEM, VALOR_HOMOLOGADO_UNITARIO_ITEM para harmonizacao com portal da transparencia e desnecessario
* remocao adjetivo TOTAL nas colunas VALOR_TOTAL_REFERENCIA, VALOR_TOTAL_HOMOLOGADO para harmonizacao portal da transparência

## Alterações deliberadas


* Formatar e publicar DE_PARA com as mudanças no recurso `contratacoescoronavirus.csv` publicado atualmente

* ?harmonização nome consulta CPF_CNPJ_CONTRATADO?

* Excluir sigla para manter consistência com formato de publicação     


## notepad.R

```
library(dplyr); library(readr); library(janitor)

evidencias <- readr::read_csv2("data-raw/compras-coronavirus-controle.csv", col_types = c("ccncccccnc"), locale = readr::locale(decimal_mark = ",", grouping_mark = "."))

compras_coronavirus <- read_csv("data/compras-coronavirus.csv")
contratacoes_coronavirus <- read_csv2("data-raw/contratacaocoronavirus.csv")


compras_programa_covid <- read_csv2("data-raw/_Compras - Programa de enfrentamento COVID-19.csv")
names(compras_programa_covid) <- compras_programa_covid %>% 
                                    names() %>% 
                                    stringr::str_remove_all(" do | da | de ") %>% 
                                    make_clean_names() %>% 
                                    toupper()

#======================================================================

diff_publicacao <- anti_join(evidencias, compras_coronavirus, by = "NUMERO_PROCESSO_COMPRA")

diff_publicacao %>% 
  filter(DIVULGAR == "sim") %>% 
  pull(NUMERO_PROCESSO_COMPRA)

anti_join(compras_coronavirus, evidencias, by = "NUMERO_PROCESSO_COMPRA")
anti_join(contratacoes_coronavirus, compras_coronavirus, by = c("PROCESSO_COMPRA" = "NUMERO_PROCESSO_COMPRA"))
anti_join(compras_coronavirus, contratacoes_coronavirus, by = c("NUMERO_PROCESSO_COMPRA" = "PROCESSO_COMPRA"))



# processos emergenciais fora do programa 26
anti_join(compras_coronavirus, compras_programa_covid, by = "NUMERO_PROCESSO_COMPRA") %>% 
  pull(NUMERO_PROCESSO_COMPRA) %>% 
  unique()

```