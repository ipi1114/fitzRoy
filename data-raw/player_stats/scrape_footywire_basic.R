# Script to get data from footywire - adapted from Rob's earlier one
library(fitzRoy)

# Run function on range of id's ----
# I've got a list of ID's that I scraped in a file called id_data.rda
player_stats <- update_footywire_stats(check_existing = TRUE)

# Write data using devtools
devtools::use_data(player_stats, overwrite = TRUE)
save(player_stats, file = here::here("data-raw", "player_stats", "player_stats.rda"))
