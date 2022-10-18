# import file
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# import Deliverable 2 file
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

library(jsonlite)
library(tidyverse)

MechaCar_mpg

#create linear model
lm(mpg ~ vehicle_weight,MechaCar_mpg)

#summarize linear model
summary(lm(mpg~vehicle_weight,MechaCar_mpg)) 

#create linear model
model <- lm(mpg~vehicle_weight,MechaCar_mpg) 

#calculate correlation coefficient
cor(MechaCar_mpg$vehicle_weight,MechaCar_mpg$mpg) 

#determine y-axis values from linear model
yvals <- model$coefficients['vehicle_weight']*MechaCar_mpg$vehicle_weight +
  model$coefficients['(Intercept)']

#import dataset into ggplot2
plt <- ggplot(MechaCar_mpg,aes(x=vehicle_weight,y=mpg)) 
#plot scatter and linear model
plt + geom_point() + geom_line(aes(y=yvals), color = "red") 

#generate multiple linear regression model
lm(vehicle_length ~ mpg + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)

#generate summary statistics
summary(lm(vehicle_length ~ mpg + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)) 

#Deliverable 2: Create Visualizations for the Trip Analysis 
head(Suspension_Coil)


total_summary <- Suspension_Coil %>% rownames_to_column("model")
total_summary <- total_summary %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
total_summary

lot_summary <- Suspension_Coil %>% rownames_to_column("model")
lot_summary <- lot_summary %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
lot_summary

#Deliverable 3: T-Tests on Suspension Coils 

#t_test population means
t.test(Suspension_Coil$PSI,mu=mean(Suspension_Coil$PSI)) 


#subset on the lots
t.test(Suspension_Coil$PSI,mu=mean(Suspension_Coil$PSI),subset = Manufacturing_lot == "Lot1")

t.test(Suspension_Coil$PSI,mu=mean(Suspension_Coil$PSI),subset = Manufacturing_lot == "Lot2")

t.test(Suspension_Coil$PSI,mu=mean(Suspension_Coil$PSI),subset = Manufacturing_lot == "Lot3")

