library(tidyverse)
library(readxl)

sheet_names = c("route",
                "route_observation",
                "route_point",
                "route_point_observation",
                "species_point_observation_count",
                "species",
                "wind",
                "precipitation",
                "num_vehicles")

obc_point_count <- vector("list",length(sheet_names))
names(obc_point_count) <- sheet_names
for(i in sheet_names){
  tmp <- read_xlsx("database/obbc.xlsx",
                   sheet = i,
                   na = c("","n/a","N/A","NA"))
  tmp <- tmp %>% 
    rename_with(.,.fn = ~tolower(.x))
  if( i == "route_observation"){
    tmp <- tmp %>% 
      mutate(date = lubridate::ymd(date),
             year = year(date),
             month = month(date),
             day = day(date),
             month = ifelse(month == 1,6,month)) %>% 
      select(-date)
    
  }
  if(i == "species_point_observation_count"){
    tmp <- tmp %>% 
      select(-rank)
  }
  
  obc_point_count[[i]] <- as.data.frame(tmp)
}

saveRDS(obc_point_count,
        "OBC_point_count_data.rds")
