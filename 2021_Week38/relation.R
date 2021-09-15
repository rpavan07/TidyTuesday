library(tidytuesdayR)
library(tidyverse)
library(patchwork)

tuesdata <- tidytuesdayR::tt_load(2021, week = 38)
features <- tuesdata$audio_features

p1 <- ggplot(features, aes(x=energy, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Energy", y="Spotify Track Popularity", title = "Relationship between Features and Popularity")

p2 <- ggplot(features, aes(x=danceability, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Danceability", y = "")

p3 <- ggplot(features, aes(x=loudness, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Loudness", y = "")

p4 <- ggplot(features, aes(x=speechiness, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Speechiness", y = "Spotify Track Popularity")

p5 <- ggplot(features, aes(x=acousticness, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Acousticness", y = "")

p6 <- ggplot(features, aes(x=instrumentalness, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Instrumentalness", y = "")

p7 <- ggplot(features, aes(x=liveness, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Liveness", y = "Spotify Track Popularity")

p8 <- ggplot(features, aes(x=valence, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Valence", y = "")

p9 <- ggplot(features, aes(x=tempo, y=spotify_track_popularity)) + 
  geom_point()+
  geom_smooth(method='lm')+
  labs(x="Tempo", y = "", caption = "by @thehopelesskiid // data via Data.World")

final <- p1 + p2 + p3 + p4 + p5 + p6 + p7 +p8 + p9 + plot_layout(ncol = 3, nrow = 3) &
  theme(panel.background = element_rect(fill = "#ebebeb", colour="#ebebeb"),
        plot.background = element_rect(fill = "#ebebeb", colour="#ebebeb"))
  

final