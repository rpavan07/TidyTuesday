library(tidytuesdayR)
library(tidyverse)
library(dplyr)
library(gghighlight)
library(extrafont)

#loading the data
tuesdata <- tidytuesdayR::tt_load(2021, week = 39)
nominees <- tuesdata$nominees

#to get just the nominations
nomination <- subset(nominees, nominees$type == "Nominee")

#ordering the years from 1957 - 2021
nomination <- nomination[order(nomination$year), ] 

#calculating the total number of nominations received by each distributors
df_new <- nomination %>%
  group_by(distributor) %>%
  mutate(total = cumsum(type == "Nominee"))

#custom theme
theme_light <- function () {
  theme_minimal(base_size = 11, base_family = "SOFIA PRO MEDIUM FONT")%+replace%
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major = element_blank(),
      plot.background = element_rect(fill = "#ffe8e8", colour = '#f0f0f0')
    )
}

#plotting the graphic
ggplot(df_new, aes(x = year, y = total))+
  geom_line(aes(group = distributor, color = distributor))+ 
  gghighlight(max(total), max_highlight = 5L)+ #to get that top 5 nominations
  theme_light()+
  theme(panel.spacing = unit(2, 'lines'),
        plot.title = element_text(face = "bold", size = 19),
        plot.subtitle = element_text(size = 11),
        plot.margin = margin(10,10,15,10))+
  labs(fill = "",
       x = "",
       y = "total number of nominations",
       title = "Nominations in Emmys over the years",
       subtitle = "In 2013, Netflix bagged their first nomination courtesy House of Cards and Arrested Development.\nFast forward 8 years, they've already overtaken most of their competitors.\nThis year, Netflix equalled the record set by CBS in 1974 for the most number of Emmy awards (44).",
       caption = "Note: HBO doesn't include HBO Max shows\nby @thehopelesskiid // data via emmys.com")
  
