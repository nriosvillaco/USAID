#install.packages("RSocrata")

library(RSocrata)
library(here)

#timestamp before data loading
start_time <- Sys.time()
paste0("data loading started at:", start_time)

df <- read.socrata(
  "https://data.usaid.gov/resource/azij-hu6e.json", #to limit data: ?$limit=5000
  app_token = "PASSWORD",
)

#timestamp after data loading
data_loaded_time <- Sys.time()
paste0("data loading complete at:", data_loaded_time)

#save data

filepath <- here("data/raw")

save(df, file = paste0(filepath, "/", "raw_data.RData"))
write.csv(df, file = paste0(filepath, "/", "raw_data.csv"), row.names = FALSE)