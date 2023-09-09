df_over1 <- read.csv(file = 'df_oversampled.csv')
df_over_under1<- read.csv(file = 'df_over_under_sampled.csv')

#drop unwanted variables
df_over <- subset(df_over1, select = -c(AnyHealthcare, Fruits, NoDocbcCost, Sex, DiffWalk, Veggies, HvyAlcoholConsump, Smoker, MentHlth, PhysHlth, CholCheck, Education, Income))
df_over_under <- subset(df_over_under1, select = -c(AnyHealthcare, Fruits, DiffWalk, NoDocbcCost, Sex, Veggies, HvyAlcoholConsump, Smoker, MentHlth, PhysHlth, CholCheck, Education, Income))