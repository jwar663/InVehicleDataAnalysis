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

#t-test driving errors
t.test(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data, paired=TRUE)
#t.test(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)

#t-test interaction errors
t.test(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data, paired=TRUE)
#t.test(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)

#display box plots for each different variable

#box plot reaction time
boxplot(REACTION_TIME ~ DASHBOARD_GESTURE, data=driving.data)

#box plot driving errors
boxplot(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)

#box plot interaction errors
boxplot(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)

#display histograms of each different variable to check if data is normally distributed
#if not normally distributed, some processing may be required for data

#histogram for reaction time
hist(driving.data$REACTION_TIME)

#histogram for driving errors
hist(driving.data$DRIVING_ERRORS)

#histogram for interaction errors
hist(driving.data$INTERACTION_ERRORS)

#one way ANOVA for each variable
#the larger the f-value the more likely the difference is not due to chance

#one way ANOVA for reaction time
one.way.reaction.time <- aov(REACTION_TIME ~ DASHBOARD_GESTURE, data=driving.data)
summary(one.way.reaction.time)

#one way ANOVA for driving errors
one.way.driving.errors <- aov(DRIVING_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)
summary(one.way.driving.errors)

#one way ANOVA for interaction errors
one.way.interaction.errors <- aov(INTERACTION_ERRORS ~ DASHBOARD_GESTURE, data=driving.data)
summary(one.way.interaction.errors)

#two way ANOVA for each variable now considering the impact of completing dashboard first or gesture first

#two way ANOVA for reaction time
two.way.reaction.time <- aov(REACTION_TIME ~ DASHBOARD_GESTURE + DASHBOARD_FIRST, data=driving.data)
summary(two.way.reaction.time)

#two way ANOVA for driving errors
two.way.driving.errors <- aov(DRIVING_ERRORS ~ DASHBOARD_GESTURE + DASHBOARD_FIRST, data=driving.data)
summary(two.way.driving.errors)

#two way ANOVA for interaction errors
two.way.interaction.errors <- aov(INTERACTION_ERRORS ~ DASHBOARD_GESTURE + DASHBOARD_FIRST, data=driving.data)
summary(two.way.interaction.errors)

#two way ANOVA for each variable now considering the interaction between the two independent variables
#low sum-of-squares and high p-value means not much variation because of interaction

#two way interaction ANOVA for reaction time
interaction.reaction.time <- aov(REACTION_TIME ~ DASHBOARD_GESTURE * DASHBOARD_FIRST, data=driving.data)
summary(interaction.reaction.time)

#two way interaction ANOVA for driving errors
interaction.driving.errors <- aov(DRIVING_ERRORS ~ DASHBOARD_GESTURE * DASHBOARD_FIRST, data=driving.data)
summary(interaction.driving.errors)

#two way interaction ANOVA for interaction errors
interaction.interaction.errors <- aov(INTERACTION_ERRORS ~ DASHBOARD_GESTURE * DASHBOARD_FIRST, data=driving.data)
summary(interaction.interaction.errors)

#find the best fitting model from the three that have been created for each variable
#the lowest AIC values indicates the best fit model

#best fit model for reaction time
model.set.reaction.time <- list(one.way.reaction.time, two.way.reaction.time, interaction.reaction.time)
model.names.reaction.time <- c("one.way.reaction.time", "two.way.reaction.time", "interaction.reaction.time")
aictab(model.set.reaction.time, modnames = model.names.reaction.time)

#best fit model for driving errors
model.set.driving.errors <- list(one.way.driving.errors, two.way.driving.errors, interaction.driving.errors)
model.names.driving.errors <- c("one.way.driving.errors", "two.way.driving.errors", "interaction.driving.errors")
aictab(model.set.driving.errors, modnames = model.names.driving.errors)

#best fit model for interaction errors
model.set.interaction.errors <- list(one.way.interaction.errors, two.way.interaction.errors, interaction.interaction.errors)
model.names.interaction.errors <- c("one.way.interaction.errors", "two.way.interaction.errors", "interaction.interaction.errors")
aictab(model.set.interaction.errors, modnames = model.names.interaction.errors)