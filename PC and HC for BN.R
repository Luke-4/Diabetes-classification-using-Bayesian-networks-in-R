#install.packages("bnlearn")
library(bnlearn)
library(pcalg)
df <- as.data.frame(lapply(df_over_under, factor))
trainIndex <- createDataPartition(df$Diabetes_binary, p = 0.8, list = FALSE)
trainData <- df[trainIndex, ]
testData <- df[-trainIndex, ]

# Create the Bayesian networks 
bn <- hc(df)
bn2 <- pc.stable(df)
plot(bn)
plot(bn2)
graphviz.plot(bn,shape = "rectangle", highlight = list(nodes = "Diabetes_binary", col = "blue", fill = "lightblue"))
graphviz.plot(bn2,shape = "rectangle", highlight = list(nodes = "Diabetes_binary", col = "blue", fill = "lightblue"))

#check correlations 
corr_matrix <- cor(df)

corr_col <- corr_matrix[, "Stroke"]
print(corr_col)

