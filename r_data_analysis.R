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
#data should be in form: ID, TOUCH_FIRST, TOUCH_GESTURE_CONTROL, BRAKE_TIME_AVE, LANE_TIME_AVE, SUM_AVE
driving.data <- read.csv(file_path, header=TRUE, colClasses=c("factor", "factor", "factor", "numeric", "numeric", "numeric"))

#summary of driving data set
summary(driving.data)

#t-test because only two groups, paired t-test because results are from a single population, one-tailed t-test because direction of difference matters
#p-value should be < 0.05 to reject null hypothesis

#t-test average brake time
t.test(BRAKE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data, paired=TRUE)
#t.test(BRAKE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)

#t-test average lane change time
t.test(LANE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data, paired=TRUE)
#t.test(LANE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)

#t-test summed average
t.test(SUM_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data, paired=TRUE)
#t.test(SUM_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)

#display box plots for each different variable

#box plot average brake time
boxplot(BRAKE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)

#box plot average lane change time
boxplot(LANE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)

#box plot summed average
boxplot(SUM_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)

#display histograms of each different variable to check if data is normally distributed
#if not normally distributed, some processing may be required for data

#histogram for average brake time
hist(driving.data$BRAKE_TIME_AVE)

#histogram for average lane change time
hist(driving.data$LANE_TIME_AVE)

#histogram for summed average
hist(driving.data$SUM_AVE)

#one way ANOVA for each variable
#the larger the f-value the more likely the difference is not due to chance

#one way ANOVA for average brake time
one.way.brake.time <- aov(BRAKE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)
summary(one.way.brake.time)

#one way ANOVA for average lane change time
one.way.lane.time <- aov(LANE_TIME_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)
summary(one.way.lane.time)

#one way ANOVA for summed average
one.way.sum.ave <- aov(SUM_AVE ~ TOUCH_GESTURE_CONTROL, data=driving.data)
summary(one.way.sum.ave)

#two way ANOVA for each variable now considering the impact of completing dashboard first or gesture first

#two way ANOVA for average brake time
two.way.brake.time <- aov(BRAKE_TIME_AVE ~ TOUCH_GESTURE_CONTROL + TOUCH_FIRST, data=driving.data)
summary(two.way.brake.time)

#two way ANOVA for average lane change time
two.way.lane.time <- aov(LANE_TIME_AVE ~ TOUCH_GESTURE_CONTROL + TOUCH_FIRST, data=driving.data)
summary(two.way.lane.time)

#two way ANOVA for summed average
two.way.sum.ave <- aov(SUM_AVE ~ TOUCH_GESTURE_CONTROL + TOUCH_FIRST, data=driving.data)
summary(two.way.sum.ave)

#two way ANOVA for each variable now considering the interaction between the two independent variables
#low sum-of-squares and high p-value means not much variation because of interaction

#two way interaction ANOVA for average brake time
interaction.brake.time <- aov(BRAKE_TIME_AVE ~ TOUCH_GESTURE_CONTROL * TOUCH_FIRST, data=driving.data)
summary(interaction.brake.time)

#two way interaction ANOVA for average lane change time
interaction.lane.time <- aov(LANE_TIME_AVE ~ TOUCH_GESTURE_CONTROL * TOUCH_FIRST, data=driving.data)
summary(interaction.lane.time)

#two way interaction ANOVA for summed average
interaction.sum.ave <- aov(SUM_AVE ~ TOUCH_GESTURE_CONTROL * TOUCH_FIRST, data=driving.data)
summary(interaction.sum.ave)

#find the best fitting model from the three that have been created for each variable
#the lowest AIC values indicates the best fit model

#best fit model for average brake time
model.set.brake.time <- list(one.way.brake.time, two.way.brake.time, interaction.brake.time)
model.names.brake.time <- c("one.way.brake.time", "two.way.brake.time", "interaction.brake.time")
aictab(model.set.brake.time, modnames = model.names.brake.time)

#best fit model for average lane change time
model.set.lane.time <- list(one.way.lane.time, two.way.lane.time, interaction.lane.time)
model.names.lane.time <- c("one.way.lane.time", "two.way.lane.time", "interaction.lane.time")
aictab(model.set.lane.time, modnames = model.names.lane.time)

#best fit model for summed average
model.set.sum.ave <- list(one.way.sum.ave, two.way.sum.ave, interaction.sum.ave)
model.names.sum.ave <- c("one.way.sum.ave", "two.way.sum.ave", "interaction.sum.ave")
aictab(model.set.sum.ave, modnames = model.names.sum.ave)