library(tidyverse)
library(spotifyr)
library(compmus)
library(dplyr)
library(tidytext)


bzt <- 
  get_tidy_audio_analysis('5ZLkc5RY1NM4FtGWEd6HOE') %>% 
  compmus_align(bars, segments) %>% 
  select(bars) %>% unnest(bars) %>% 
  mutate(
    pitches = 
      map(segments, 
          compmus_summarise, pitches, 
          method = 'rms', norm = 'euclidean')) %>% 
  mutate(
    timbre = 
      map(segments, 
          compmus_summarise, timbre, 
          method = 'mean'))

