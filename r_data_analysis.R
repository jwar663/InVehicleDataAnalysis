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
driving.data <- read.csv(file_path, header=TRUE, colClasses=c("factor", "factor", "factor", "numeric", "numeric", "numeric"))

#summary of driving data set
summary(driving.data)

#t-test because only two groups, paired t-test because results are from a single population, one-tailed t-test because direction of difference matters
#p-value should be < 0.05 to reject null hypothesis
#t-test reaction time
t.test(REACTION_TIME ~ DASHBOARD_GESTURE, data=driving.data, paired=TRUE)
#t.test(REACTION_TIME ~ DASHBOARD_GESTURE, data=driving.data)

#t-test because only two groups, paired t-test because results are from a single population, one-tailed t-test because direction of difference matters
#p-value should be < 0.05 to reject null hypothesis
#t-test reaction time
t.test(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data, paired=TRUE)
#t.test(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)

#t-test because only two groups, paired t-test because results are from a single population, one-tailed t-test because direction of difference matters
#p-value should be < 0.05 to reject null hypothesis
#t-test reaction time
t.test(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data, paired=TRUE)
#t.test(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)

#display box plots for each different variable
boxplot(REACTION_TIME ~ DASHBOARD_GESTURE, data=driving.data)
boxplot(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)
boxplot(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)