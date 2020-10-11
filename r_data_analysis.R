#Install packages (do once)
#install.packages(c("ggplot2", "ggpubr", "tidyverse", "broom", "AICcmodavg"))
#Load packages (do every time you open R)
#library(ggplot2)
#library(ggpubr)
#library(tidyverse)
#library(broom)
#library(AICcmodavg)
#Import data set from driving simulator
#change file path to the absolute path on your machine ('\\' in all occurrences of '\')
file_path <- "D:\\Documents\\University\\SE702\\Data_Analysis\\final_dataset.csv" 
driving.data <- read.csv(file_path, header=TRUE, colClasses=c("numeric", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
summary(driving.data)