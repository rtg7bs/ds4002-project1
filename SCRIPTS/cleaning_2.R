setwd("C:\\Users\\benvo\\OneDrive - University of Virginia\\Desktop\\DS 4002\\Project 1\\") # Change to your own filepath

library(tidyverse) # Load required package
set.seed(111402) # Set seed to ensure replicability

place <- "Portland" # Change text here for each city
filepath_l <- str_c("Raw Data\\",place ,"_listings.csv") # Must be changed to match your filepath
filepath_r <- str_c("Raw Data\\",place ,"_reviews.csv") # Must be changed to match your filepath

listings <- read.csv(filepath_l) # Read in listings
listings <- listings %>% select(listing_id = id, price, number_of_reviews) %>%
  filter(number_of_reviews > 10) # Filtering out listings with very few reviews

reviews <- read.csv(filepath_r) # Read in reviews
reviews <- reviews %>% select(listing_id, review_id = id, comments) # Subset and rename desired columns

joined <- inner_join(reviews, listings, by = "listing_id") # Join the two datasets
l_bound <- median(joined$number_of_reviews) - sd(joined$number_of_reviews) # Bounds for filtering # of reviews between -1 and 1 SD from the Median
u_bound <- median(joined$number_of_reviews) + sd(joined$number_of_reviews)
joined <- joined %>% 
  filter(price != "") %>%
  mutate(price = as.numeric(gsub("[^0-9.]", "", price)), city = place) %>% # Reformat price to be numeric
  filter(number_of_reviews < u_bound, number_of_reviews > l_bound) # Subset to filter reviews between -1 and 1 SD from median
sample_id <- joined %>% distinct(review_id) %>% sample_n(600) # Sample 600 distinct review IDs
sample <- joined %>% filter(review_id %in% sample_id$review_id) %>% 
  select(listing_id, review_id, comments, price, city, -number_of_reviews) # Subset data for those 600 random IDs

filepath_c <- str_c("Clean Data\\",place ,"_clean.csv")
write.csv(sample, filepath_c) # Save data as CSV

ggplot(joined, aes(x = price)) + geom_density() + 
  labs(title = place, x = "Price", y = "Density") + theme_minimal() +
  scale_x_continuous(breaks = seq(0, 1000, by = 100), limits = c(0, 1000)) +
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    plot.title = element_text(hjust = 0.5)) # Graph to demonstrate price distribution for each city

filepath_gg <- str_c("Clean Data\\",place ,"_plot.png") 
ggsave(filepath_gg, plot = last_plot(), width = 8, height = 6, dpi = 300) # Save the graph


### Run above for every city before continuing ###

folder_path <- "Clean Data\\"
csv_files <- list.files(folder_path, pattern = "*.csv", full.names = TRUE)
combined_clean_ben <- map_dfr(csv_files, read_csv)
write.csv(combined_clean_ben, "Clean Data\\combined_clean_ben.csv") # Combine all the cities into one master CSV
