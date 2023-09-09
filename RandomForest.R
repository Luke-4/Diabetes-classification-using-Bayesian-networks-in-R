library(randomForest)
df <- as.data.frame(lapply(df_over_under1, factor))
trainIndex <- createDataPartition(df$Diabetes_binary, p = 0.8, list = FALSE)
trainData <- df[trainIndex, ]
testData <- df[-trainIndex, ]

rf <- randomForest(Diabetes_binary~., data=trainData)
p1 <- predict(rf, testData)

confusion_matrixrf <- confusionMatrix(p1, mode = "everything", testData$Diabetes_binary)
confusion_matrixrf

variableimp <- varImp(rf)
variableimp