# Load the required packages
library(dplyr)
library(tidyr)
library(ggplot2)

# check for null values
colSums(is.na(df2))

# Compute the correlation of each feature with the target variable
corr_df <- df2 %>% 
  select(-Diabetes_binary) %>% 
  cor(df2$Diabetes_binary)
corr_df <- as.data.frame(corr_df)
corr_df$feature <- rownames(corr_df)

corr_df_long <- corr_df %>% pivot_longer(cols = -feature, names_to = "target", values_to = "correlation")

# Plot the correlation values using ggplot2
ggplot(corr_df_long, aes(x = feature, y = correlation, fill = correlation > 0)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("orange", "green")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Correlation with Diabetes_binary", x = "Feature", y = "Correlation")
