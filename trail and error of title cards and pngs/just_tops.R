library(ggplot2)
library(ggbeeswarm)
library(ggimage)
library(magick)
library(plotly)

# Read the CSV file
tops_df <- read.csv("/Users/ananya/columbia/somapython/data_studio/clothing sizes/tops.csv")
head(tops_df)

# Subset for XL sizes
top_df_XL <- subset(tops_df, Letter.Sizing == "XL")

p <- ggplot(top_df_XL, aes(x = Bust, y = Letter.Sizing,
                           text = paste("Brand:", Brands, "<br>Bust:", Bust))) +
  geom_beeswarm(color = "darkorchid4", size = 5.5, dodge.width = 0.8) +
  scale_x_continuous(breaks = seq(floor(min(top_df_XL$Bust)),
                                  ceiling(max(top_df_XL$Bust)),
                                  by = 1)) +
  theme_minimal() +
  labs(
    x = "Bust measurement in inches", 
    y = "Size",
    title = "Forever 21 and Ralph Lauren disagree on what counts as XL",
    subtitle = "Hoover over each point to view what clothing brands identify for bust size in XL.",
    caption = "Source: Scrapped several brands and merged with existing sizecharts.com"
  ) +
  theme(
    axis.text.x = element_text(angle = 0, hjust = 2),
    plot.title  = element_text(face = "bold")
  )

p_interactive <- ggplotly(p, tooltip = "text") %>%
  layout(
    title = list(
      text = paste0(
        "<b>", p$labels$title, "</b><br>",
        "<span style='font-size:14px;'>", p$labels$subtitle, "</span>"
      )
    ),
    annotations = list(
      list(
        x = 1, y = -0.2,  # Adjust y value to bring caption into view
        xref = "paper", yref = "paper",
        text = p$labels$caption,
        showarrow = FALSE,
        font = list(size = 10)
      )
    ),
    margin = list(b = 100)  
    
  )

p_interactive

