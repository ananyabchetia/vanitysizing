library(ggplot2)
library(ggbeeswarm)

# Read the CSV file
tops_df <- read.csv("/Users/ananya/columbia/somapython/data_studio/clothing sizes/tops.csv")
head(tops_df)  

# Filter for only XL sizes
top_df_XL <- subset(tops_df, Letter.Sizing == "XL")

# Create the beeswarm plot for XL only
p <- ggplot(top_df_XL, aes(x = Letter.Sizing, y = Bust, color = Letter.Sizing,
                           text = paste("Brand:", Brands, "<br>Bust:", Bust, "<br>Size:", Letter.Sizing))) +
  geom_beeswarm(cex = 3, dodge.width = 0.8) +  
  scale_color_brewer(palette = "Set2") +  # Unique color for XL
  scale_y_continuous(breaks = seq(floor(min(top_df_XL$Bust)), 
                                  ceiling(max(top_df_XL$Bust)), 
                                  by = 1)) +  # Display only whole numbers on y-axis
  theme_minimal() +
  labs(x = "Size", y = "Bust Measurement", color = "Size") +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5)) 
