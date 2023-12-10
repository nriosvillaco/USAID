#install.packages("RSocrata")

library(RSocrata)
library(here)

df <- read.socrata(
  "https://data.usaid.gov/resource/azij-hu6e.json?$limit=25", #limit to first 25 rows
  app_token = "YOURAPPTOKENHERE",
)

#save data

filepath <- here("data/raw")

save(df, file = paste0(filepath, "/", "raw_data.RData"))
write.csv(df, file = paste0(filepath, "/", "raw_data.csv"), row.names = FALSE)