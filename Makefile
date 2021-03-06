.PHONY: help munge check

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

munge: data/compras-coronavirus.csv ## Atualiza notificacoes-covid19-mg.csv

#====================================================================
# TARGETS

data/compras-coronavirus.csv: code/munge.R data-raw/compras-coronavirus.xlsx data-raw/compras-coronavirus-controle.csv code/lib/read.R code/lib/recode.R code/lib/enrich.R
	Rscript --verbose $< 2> logs/log.Rout

#====================================================================
# HELPERS TARGETS

check: ## Executa testes
	Rscript --verbose code/check.R 2> logs/log.Rout