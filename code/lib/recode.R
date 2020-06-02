recode <- function(df) {
  
  return <- df %>% 
    dplyr::mutate_if(lubridate::is.POSIXt, lubridate::as_date)
  
  return
  
}