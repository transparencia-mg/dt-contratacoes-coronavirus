library(readxl); library(readr)

dicionario <- read_excel("data-raw/dicionario-dados.xlsx")

write_excel_csv(dicionario, "data-raw/dicionario-dados.csv")
