# 30DayMapChallenge 2022, Day 16: Minimal
# Source: US Census via {tigris} R package

# Libraries
library(tidyverse)
library(tigris)
library(sf)
library(showtext)
showtext_opts(dpi = 300)
showtext_auto(enable = TRUE)

# Fonts
font_add_google("Sora")
f1 = "Sora"
font_add_google("Roboto")
f2 = "Roboto"

# Data
ne_states = states(cb=TRUE, year=2021) %>% filter(STUSPS %in% usmap::.northeast_region)
primary = primary_roads(year=2022)
primary_ne = st_intersection(primary, ne_states)

# Map
ggplot() +
  geom_sf(data=ne_states, fill="#1A3C40", color="#193140") +
  geom_sf(data=primary_ne, color="white", size=.4) +
  coord_sf(expand=FALSE) +
  theme_void() +
  theme(plot.margin=margin(.1,1,.3,1,unit="cm"),
        plot.background=element_rect(fill="#193140", color=NA),
        plot.title=element_text(family=f1, color="white", face="bold",vjust=-4.5, size=13),
        plot.caption = element_text(color="grey90", hjust=0, size=8.5,family=f2, margin=margin(t=15))
  ) +
  labs(title="Primary roads in the Northeast census region",
       caption="#30DayMapChallange Day 16: Minimal | Source: US Census via {tigris} R package") 

ggsave("16_Minimal.png", height=7, width=8)

