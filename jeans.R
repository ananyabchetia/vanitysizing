library(ggplot2)
library(dplyr)

# Read the CSV file; check.names = FALSE keeps the original column names
jeans_df <- read.csv("/Users/ananya/columbia/somapython/data_studio/vanitysizing/jeans.csv")

# Increase spacing between range bars by multiplying y positions by 3
jeans_df <- jeans_df %>% 
  mutate(y = as.numeric(as.factor(Brands)) * 3)

new_thickness <- 0.50

ggplot(jeans_df, aes(xmin = Hip.min., xmax = Hip.max.,
                     ymin = y - new_thickness/2, ymax = y + new_thickness/2)) +
  geom_rect(fill = "darkorchid4") +
  coord_cartesian(ylim = c(min(jeans_df$y) - new_thickness, max(jeans_df$y) + new_thickness)) +
  theme_minimal() +
  labs(x = NULL, y = "Brands", 
       title = "") +
  scale_y_continuous(breaks = unique(jeans_df$y), labels = unique(jeans_df$Brands)) +
  theme(panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        plot.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "#FFFCF5", color = NA),
        plot.background = element_rect(fill = "#FFFCF5", color = NA),
        axis.text.y = element_text(size = 12, face = "bold", color = "black")) # Make y-axis labels visible

