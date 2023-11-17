# import library

library(forecast)
library(dplyr)
library(ggplot2)
#library(scales)
library(glue)
library(plotly)
library(lubridate)
library(DT)
library(stringr)
library(tidyverse)
library(padr) # complete data frame
library(zoo) # Missing value imputation
library(ggfortify) # autoplot
library(tseries) # adf.test
#library(purrr)
library(Metrics)
library(randomForest)
options(scipen = 100)

library(shiny)
library(shinyWidgets)
library(shinydashboard)

library(shinyjs)
library(shinyBS)
library(shinycssloaders)

addResourcePath("aqi_images", "www")
addResourcePath("html", "html")

# read data
ispu_2020 <- rbind(
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-januari-tahun-2020.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-februari-tahun-2020.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-maret-tahun-2020.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-april-tahun-2020.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-mei-tahun-2020.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-juni-tahun-2020.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-juli-tahun-2020.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-agustus-tahun-2020.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-september-tahun-2020.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-oktober-tahun-2020.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-november-tahun-2020.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-desember-tahun-2020.csv")
)
ispu_2020<-ispu_2020 %>% mutate(pm25=0)

ispu_2021 <- rbind( 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-januari-tahun-2021.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-februari-tahun-2021.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-maret-tahun-2021.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-april-tahun-2021.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-mei-tahun-2021.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-juni-tahun-2021.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-juli-tahun-2021.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-agustus-tahun-2021.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-september-tahun-2021.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-oktober-tahun-2021.csv"), 
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-november-tahun-2021.csv"),
  read.csv("data_input/indeks-standar-pencemar-udara-di-spku-bulan-desember-tahun-2021.csv")
  
)
ispu <- rbind(
  ispu_2020,ispu_2021)


# cleansing data 

ispu <- ispu %>%
  mutate(pm10 = ifelse(pm10 == "---", NA, pm10),
         pm25 = ifelse(pm25 == "---", NA, pm25),
         so2 = ifelse(so2 == "---", NA, so2),
         co = ifelse(co == "---", NA, co),
         o3 = ifelse(o3 == "---", NA, o3),
         no2 = ifelse(no2 == "---", NA, no2)) %>%
  mutate(pm10 = ifelse(pm10 == "", NA, pm10),
         pm25 = ifelse(pm25 == "", NA, pm25),
         so2 = ifelse(so2 == "", NA, so2),
         co = ifelse(co == "", NA, co),
         o3 = ifelse(o3 == "", NA, o3),
         no2 = ifelse(no2 == "", NA, no2))

ispu<-ispu %>% 
  mutate(pm10 = na.fill(object = pm10, fill = "extend"),
         pm25 = na.fill(object = pm25, fill = "extend"),
         so2 = na.fill(object = so2, fill = "extend"),
         co = na.fill(object = co, fill = "extend"),
         o3 = na.fill(object = o3, fill = "extend"),
         no2 = na.fill(object = no2, fill = "extend"))

ispu <- ispu%>%
  mutate(tanggal = as.Date(tanggal, format = "%Y-%m-%d"),
         stasiun = as.factor(stasiun),
         pm10 = as.numeric(pm10),
         pm25 = as.numeric(pm25),
         so2 = as.numeric(so2),
         co = as.numeric(co),
         o3 = as.numeric(o3),
         no2 = as.numeric(no2),
         critical = as.factor(critical),
         categori = as.factor(categori)
  )

new_levels <- c( "Jakarta Pusat","Jakarta Utara","Jakarta Selatan","Jakarta Timur","Jakarta Barat")
levels(ispu$stasiun) <- new_levels
 
 

 