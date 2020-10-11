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
#data should be in form: ID, DASHBOARD_FIRST, DASHBOARD_GESTURE, REACTION_TIME, DRIVING_ERRORS, INTERACTION_ERRORS
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

#display histograms of each different variable to check if data is normally distributed
#if not normally distributed, some processing may be required for data
hist(driving.data$REACTION_TIME)
hist(driving.data$DRIVING_ERRORS)
hist(driving.data$INTERACTION_ERRORS)

#one way ANOVA for each variable
#the larger the f-value the more likely the difference is not due to chance
one.way.reaction.time <- aov(REACTION_TIME ~ DASHBOARD_GESTURE, data=driving.data)
one.way.driving.errors <- aov(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)
one.way.interaction.errors <- aov(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)
summary(one.way.reaction.time)
summary(one.way.driving.errors)
summary(one.way.interaction.errors)

#two way ANOVA for each variable now considering the impact of completing dashboard first or gesture first
two.way.reaction.time <- aov(REACTION_TIME ~ DASHBOARD_GESTURE + DASHBOARD_FIRST, data=driving.data)
two.way.driving.errors <- aov(DRIVING_ERRORS ~ DASHBOARD_GESTURE + DASHBOARD_FIRST, data=driving.data)
two.way.interaction.errors <- aov(INTERACTION_ERRORS ~ DASHBOARD_GESTURE + DASHBOARD_FIRST, data=driving.data)
summary(two.way.reaction.time)
summary(two.way.driving.errors)
summary(two.way.interaction.errors)

#two way ANOVA for each variable now considering the interaction between the two independent variables
#low sum-of-squares and high p-value means not much variation because of interaction
interaction.reaction.time <- aov(REACTION_TIME ~ DASHBOARD_GESTURE * DASHBOARD_FIRST, data=driving.data)
interaction.driving.errors <- aov(DRIVING_ERRORS ~ DASHBOARD_GESTURE * DASHBOARD_FIRST, data=driving.data)
interaction.interaction.errors <- aov(INTERACTION_ERRORS ~ DASHBOARD_GESTURE * DASHBOARD_FIRST, data=driving.data)
summary(interaction.reaction.time)
summary(interaction.driving.errors)
summary(interaction.interaction.errors)