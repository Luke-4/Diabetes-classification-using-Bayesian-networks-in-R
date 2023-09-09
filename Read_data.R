df <- read.csv(file = 'diabetes_binary_health_indicators_BRFSS2015.csv')

#outlier detection delete bmi over 65 because of error in calculations of bmi
df2 <- df[df$BMI <= 55, ]

breaks <- c(0, 18.5, 25, 30, 40, 50, 55)
labels <- c(1, 2, 3, 4, 5, 6)
# Discretize the bmi column using the custom labels
df2$BMI <- as.numeric(cut(df2$BMI, breaks = breaks, labels = labels, include.lowest = TRUE))

breaks <- c(0, 3, 7, 20, 30)
labels <- c(1, 2, 3, 4)
# Discretize the MentHlth column using the custom labels
df2$MentHlth <- as.numeric(cut(df2$MentHlth, breaks = breaks, labels = labels, include.lowest = TRUE))
# Discretize the PhysHlth column using the custom labels
df2$PhysHlth <- as.numeric(cut(df2$PhysHlth, breaks = breaks, labels = labels, include.lowest = TRUE))

write.csv(df2, file = "for_python.csv")