# Prepare SCP report from trapping data

#libraries
library(tidyverse)
library(here)
library(lubridate)

#Load trap data
trap.dat <- read.csv(here("data", "TrappingData.1.31.21.csv"), header = T)

#Load site table
site.dat <- read.csv(here("data", "SiteTable.csv"), header = T)

#Tibble-ify
trap.dat <- as_tibble(trap.dat)

# Lubridate Dates
trap.dat$SetTime <- mdy_hm(trap.dat$SetTime)
trap.dat$EndTime <- mdy_hm(trap.dat$EndTime)

#Filter By Date
dat.20 <- trap.dat %>% 
  filter(SetTime >= "2020-01-01", SetTime <= "2020-12-31")
