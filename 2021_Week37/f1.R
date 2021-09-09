library(waffle)
library(tidyverse)

dfc <- read_csv("F:/Others/F1/champions.csv")
dfc$fill <- 1 
dfc$Champions <- str_trim(dfc$Champions)
dfc$Champions <- factor(dfc$Champions, levels=levels(fct_infreq(dfc$Champions)))

theme_max <- function () {
  theme_minimal(base_size = 9, base_family = "Consolas")%+replace%
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major = element_blank(),
      plot.background = element_rect(fill = "cornsilk", colour = 'cornsilk')
    )
}

ggplot(data = dfc, aes(fill=Champions, values=fill))+
  geom_waffle(color = "cornsilk", size=.25, n_rows=9)+
  facet_wrap(~Champions, nrow = 3, strip.position = "bottom", labeller = label_wrap_gen(6))+
  theme_max()+
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand= c(0,0)) +
  theme(legend.position =  "none",
        axis.title.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        panel.spacing = unit(2, 'lines'),
        plot.title = element_text(face = "bold", size = 19, hjust = .5),
        plot.subtitle = element_text(size = 11, hjust = .5),
        plot.margin = margin(10,10,15,10))+
  labs(fill = "",
       x = "",
       y = "",
       title = "F1 Championships",
       subtitle = "Each block represents one championship (from 1950 till 2020)",
       caption = "by @thehopelesskiid // data via Ergast API")
  

