library(magrittr)

purrr::walk(list.files("code/lib/", full.names = TRUE), source)

path <- "data-raw/compras-coronavirus.xlsx"

df <- read(path) %>% 
        recode() %>% 
        enrich()

readr::write_excel_csv(df, "data/compras-coronavirus.csv")

writexl::write_xlsx(df, "data/compras-coronavirus.xlsx")
