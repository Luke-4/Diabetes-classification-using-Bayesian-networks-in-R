library(bnlearn)
library(caret)

df <- as.data.frame(lapply(df_over_under, factor))
trainIndex <- createDataPartition(df$Diabetes_binary, p = 0.8, list = FALSE)
trainData <- df[trainIndex, ]
testData <- df[-trainIndex, ]

dag <- empty.graph(nodes = colnames(df))
dag
dag <- set.arc(dag, from = "Diabetes_binary", to = "HighBP")
dag <- set.arc(dag, from = "Diabetes_binary", to = "HighChol")
dag <- set.arc(dag, from = "Diabetes_binary", to = "Stroke")
dag <- set.arc(dag, from = "Diabetes_binary", to = "HeartDiseaseorAttack")
dag <- set.arc(dag, from = "Age", to = "HighBP")
dag <- set.arc(dag, from = "Age", to = "HighChol")
dag <- set.arc(dag, from = "Age", to = "Diabetes_binary")
dag <- set.arc(dag, from = "HighChol", to = "Stroke")
dag <- set.arc(dag, from = "HighChol", to = "HeartDiseaseorAttack")
dag <- set.arc(dag, from = "HighBP", to = "Stroke")
dag <- set.arc(dag, from = "HighBP", to = "HeartDiseaseorAttack")
dag <- set.arc(dag, from = "PhysActivity", to = "BMI")
dag <- set.arc(dag, from = "BMI", to = "HighBP")
dag <- set.arc(dag, from = "BMI", to = "HighChol")
dag <- set.arc(dag, from = "BMI", to = "Diabetes_binary")
dag <- set.arc(dag, from = "GenHlth", to = "Diabetes_binary")
dag

bn <- hc(df)

dag2 <- empty.graph(nodes = colnames(df))
dag2
dag2 <- set.arc(dag2, from = "HighBP", to = "Diabetes_binary")
dag2 <- set.arc(dag2, from = "HighChol", to = "Diabetes_binary")
dag2 <- set.arc(dag2, from = "Stroke", to = "Diabetes_binary")
dag2 <- set.arc(dag2, from = "HeartDiseaseorAttack", to = "Diabetes_binary")
dag2 <- set.arc(dag2, from = "Age", to = "HighBP")
dag2 <- set.arc(dag2, from = "Age", to = "HighChol")
dag2 <- set.arc(dag2, from = "Age", to = "Diabetes_binary")
dag2 <- set.arc(dag2, from = "HighChol", to = "Stroke")
dag2 <- set.arc(dag2, from = "HighChol", to = "HeartDiseaseorAttack")
dag2 <- set.arc(dag2, from = "HighBP", to = "Stroke")
dag2 <- set.arc(dag2, from = "HighBP", to = "HeartDiseaseorAttack")
dag2 <- set.arc(dag2, from = "PhysActivity", to = "BMI")
dag2 <- set.arc(dag2, from = "BMI", to = "HighBP")
dag2 <- set.arc(dag2, from = "BMI", to = "HighChol")
dag2 <- set.arc(dag2, from = "BMI", to = "Diabetes_binary")
dag2 <- set.arc(dag2, from = "GenHlth", to = "Diabetes_binary")
dag2

plot(bn)
plot(dag)
plot(dag2)

graphviz.plot(bn,shape = "rectangle", highlight = list(nodes = "Diabetes_binary", col = "blue", fill = "lightblue"))
graphviz.plot(dag,shape = "rectangle", highlight = list(nodes = "Diabetes_binary", col = "blue", fill = "lightblue"))
graphviz.plot(dag2,shape = "rectangle", highlight = list(nodes = "Diabetes_binary", col = "blue", fill = "lightblue"))

fittedbn <- bn.fit(dag, data = trainData, method = "bayes")
fittedbn
fittedbn2 <- bn.fit(bn, data = trainData, method = "bayes")
fittedbn2
fittedbn3 <- bn.fit(dag2, data = trainData, method = "bayes")
fittedbn3

# Bayes-lw uses all available nodes and not just the parents
pred = predict(fittedbn, node = "Diabetes_binary", data = testData, method = "bayes-lw")
predhc = predict(fittedbn2, node = "Diabetes_binary", data = testData, method = "bayes-lw")
pred2 = predict(fittedbn3, node = "Diabetes_binary", data = testData, method = "bayes-lw")


# confusion_matrix
confusion_matrix <- confusionMatrix(pred, mode = "everything", testData$Diabetes_binary)
confusion_matrix
confusion_matrixhc <- confusionMatrix(predhc, mode = "everything", testData$Diabetes_binary)
confusion_matrixhc
confusion_matrix2 <- confusionMatrix(pred2, mode = "everything", testData$Diabetes_binary)
confusion_matrix2