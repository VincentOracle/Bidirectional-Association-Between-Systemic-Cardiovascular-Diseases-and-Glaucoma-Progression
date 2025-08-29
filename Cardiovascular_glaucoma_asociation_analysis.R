# 1. R Environment Setup and Data Ingestion

# Load required libraries
# install.packages("tidyverse")
# install.packages("ggplot2")
# install.packages("plotly")

library(tidyverse)
library(ggplot2)
library(plotly)

# Set working directory to the location of the CSV file
# This line is optional if the R project is already configured
# setwd("C:\Users\Hp\Downloads\Cardiovascular_diseases.csv")

# Read the CSV file into a data frame
# The file name is 'Cardiovascular_diseases.csv'
cardio_data <- read_csv("C:/Users/Hp/Downloads/Cardiovascular_diseases.csv", show_col_types = FALSE)

# Initial inspection of the data structure and dimensions
cat("Initial data dimensions:\n")
print(dim(cardio_data))

cat("\nInitial column names and data types:\n")
print(str(cardio_data))

cat("\nFirst 6 observations:\n")
print(head(cardio_data))

# 2. Data Cleaning and Preprocessing

# Convert non-numeric 'Data_Value' to NA and create a new column for footnotes
cardio_data_cleaned <- cardio_data %>%
  mutate(
    Data_Value_Note = ifelse(Data_Value == "-2", `Data_Value_Footnote`, NA_character_),
    Data_Value = as.numeric(Data_Value)
  )

# Remove redundant or non-informative columns
cardio_data_cleaned <- cardio_data_cleaned %>%
  select(-Data_Value_Alt, -Data_Value_Footnote_Symbol, -PriorityArea1, -PriorityArea2, -PriorityArea3, -PriorityArea4)

# Re-inspect the cleaned data
cat("Cleaned data dimensions:\n")
print(dim(cardio_data_cleaned))

cat("\nCleaned column names and data types:\n")
print(str(cardio_data_cleaned))

# 3. Variable Transformation and Categorization

# Convert key character variables to factors for analysis
cardio_data_final <- cardio_data_cleaned %>%
  mutate(
    across(c(LocationAbbr, LocationDesc, Category, Topic, Indicator, Data_Value_Type, Break_Out_Category, Break_Out), as.factor)
  )

# Re-inspect the final, prepared data
cat("Final data dimensions:\n")
print(dim(cardio_data_final))

cat("\nFinal column names and data types:\n")
print(str(cardio_data_final))

# Display the unique topics for verification
cat("\nUnique Topics:\n")
print(levels(cardio_data_final$Topic))


# 3.1 Visualizing Overall Trends

# Generate a line plot of overall prevalence for major topics over time
overall_trends <- cardio_data_final %>%
  filter(Break_Out_Category == "Overall", LocationDesc == "United States",!is.na(Data_Value)) %>%
  group_by(Year, Topic) %>%
  summarise(
    Mean_Value = mean(Data_Value),
    Lower_CI = mean(LowConfidenceLimit, na.rm = TRUE),
    Upper_CI = mean(HighConfidenceLimit, na.rm = TRUE),
    .groups = 'drop'
  )

ggplot(overall_trends, aes(x = Year, y = Mean_Value, color = Topic, group = Topic)) +
  geom_line(size = 1.2) +
  geom_ribbon(aes(ymin = Lower_CI, ymax = Upper_CI), alpha = 0.2, linetype = "dotted") +
  labs(
    title = "Temporal Trends of Cardiovascular Disease Prevalence in the U.S.",
    x = "Year",
    y = "Mean Prevalence (%)",
    color = "Disease Topic"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    legend.position = "bottom"
  )


# 3.2 Initial Descriptive Statistics

# Generate key descriptive statistics
descriptive_stats <- cardio_data_final %>%
  group_by(Indicator) %>%
  summarise(
    `Mean Data Value` = mean(Data_Value, na.rm = TRUE),
    `SD Data Value` = sd(Data_Value, na.rm = TRUE),
    n = sum(!is.na(Data_Value)),
    n_unstable = sum(is.na(Data_Value)),
    .groups = 'drop'
  )

# Display the table
print(descriptive_stats)

# 4. Analysis of Temporal Trends

# Prepare data for trend analysis for 'Overall' U.S.
overall_usa_trends <- cardio_data_final %>%
  filter(LocationDesc == "United States", Break_Out == "Overall",!is.na(Data_Value)) %>%
  select(Year, Topic, Data_Value, LowConfidenceLimit, HighConfidenceLimit) %>%
  arrange(Year, Topic)

# Print the data used for the table
print(overall_usa_trends)

# 5.3 Geographical Disparities: A State-Level Analysis

# Prepare data for demographic and geographical analysis
demographic_analysis <- cardio_data_final %>%
  filter(!is.na(Data_Value)) %>%
  group_by(Topic, Break_Out_Category, Break_Out) %>%
  summarise(
    `Mean Data Value` = mean(Data_Value, na.rm = TRUE),
    LowConfidenceLimit = mean(LowConfidenceLimit, na.rm = TRUE),
    HighConfidenceLimit = mean(HighConfidenceLimit, na.rm = TRUE),
    .groups = 'drop'
  ) %>%
  filter(Break_Out_Category %in% c("Gender", "Race"), Topic %in% c("Major Cardiovascular Disease", "Diseases of the Heart (Heart Disease)"))

# Print the demographic table
print(demographic_analysis)

# Part 2: Exploratory Data Analysis and Visualization

# Filter for 'Overall' U.S. data for temporal trend plot
overall_trends <- cardio_data_final %>%
  filter(LocationDesc == "United States", Break_Out == "Overall", grepl("Prevalence", Indicator),!is.na(Data_Value)) %>%
  group_by(Year, Topic) %>%
  summarise(
    Mean_Value = mean(Data_Value),
    Lower_CI = mean(LowConfidenceLimit, na.rm = TRUE),
    Upper_CI = mean(HighConfidenceLimit, na.rm = TRUE),
    .groups = 'drop'
  )

# Create the temporal trend plot
p1 <- ggplot(overall_trends, aes(x = Year, y = Mean_Value, color = Topic, group = Topic)) +
  geom_line(size = 1.2) +
  geom_ribbon(aes(ymin = Lower_CI, ymax = Upper_CI), alpha = 0.2, linetype = "dotted") +
  labs(
    title = "Temporal Trends of CVD Prevalence in the U.S. (Overall)",
    x = "Year",
    y = "Mean Prevalence (%)",
    color = "Disease Topic"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"), legend.position = "bottom")

# Display the plot
print(p1)

# Generate key descriptive statistics for Table 1
descriptive_stats <- cardio_data_final %>%
  group_by(Indicator) %>%
  summarise(
    `Mean Data Value` = mean(Data_Value, na.rm = TRUE),
    `SD Data Value` = sd(Data_Value, na.rm = TRUE),
    n = sum(!is.na(Data_Value)),
    n_unstable = sum(is.na(Data_Value)),
    .groups = 'drop'
  )

# Print the descriptive statistics table
print(descriptive_stats)


# Part 3: Trend and Disparity Analysis

# Filter data for demographic and geographical analysis for Table 3
demographic_analysis <- cardio_data_final %>%
  filter(!is.na(Data_Value)) %>%
  group_by(Topic, Break_Out_Category, Break_Out) %>%
  summarise(
    `Mean Data Value` = mean(Data_Value, na.rm = TRUE),
    LowConfidenceLimit = mean(LowConfidenceLimit, na.rm = TRUE),
    HighConfidenceLimit = mean(HighConfidenceLimit, na.rm = TRUE),
   .groups = 'drop'
  ) %>%
  filter(Break_Out_Category %in% c("Gender", "Race"), Topic %in% c("Major Cardiovascular Disease", "Diseases of the Heart (Heart Disease)"))

# Print the demographic table
print(demographic_analysis)

# Create a grouped bar chart for gender disparities
gender_plot <- cardio_data_final %>%
  filter(Break_Out_Category == "Gender",!is.na(Data_Value)) %>%
  group_by(Topic, Break_Out) %>%
  summarise(
    Mean_Value = mean(Data_Value, na.rm = TRUE),
    Lower_CI = mean(LowConfidenceLimit, na.rm = TRUE),
    Upper_CI = mean(HighConfidenceLimit, na.rm = TRUE),
   .groups = 'drop'
  ) %>%
  ggplot(aes(x = Break_Out, y = Mean_Value, fill = Break_Out)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_errorbar(aes(ymin = Lower_CI, ymax = Upper_CI), width = 0.2, position = position_dodge(0.9)) +
  facet_wrap(~ Topic, scales = "free_y") +
  labs(
    title = "CVD Prevalence/Rates by Gender",
    x = "Gender",
    y = "Mean Prevalence/Rate",
    fill = "Gender"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Display the gender plot
print(gender_plot)


# Part 4: Statistical Modeling

# Filter data for Heart Failure rates and prepare for linear model
hf_data_lm <- cardio_data_final %>%
  filter(Topic == "Heart Failure", grepl("Rate per 1,000", Indicator), Break_Out_Category!= "Overall",!is.na(Data_Value)) %>%
  mutate(Break_Out_Var = as.factor(paste(Break_Out_Category, Break_Out, sep = ": "))) %>%
  # Drop unused factor levels that may have resulted from the filter
  droplevels()

# Dynamically create the model formula to avoid errors with single-level factors
model_formula_vars <- c("Year") # Start with Year as a base variable
if (length(levels(hf_data_lm$Break_Out_Var)) > 1) {
  model_formula_vars <- c(model_formula_vars, "Break_Out_Var")
}
if (length(levels(hf_data_lm$LocationAbbr)) > 1) {
  model_formula_vars <- c(model_formula_vars, "LocationAbbr")
}

# If enough variables exist, build and fit the model
if (length(model_formula_vars) > 1) {
  model_formula <- as.formula(paste("Data_Value ~", paste(model_formula_vars, collapse = " + ")))
  hf_model <- lm(model_formula, data = hf_data_lm)
  cat("\nModel Summary for Heart Failure Rates:\n")
  print(summary(hf_model))
} else {
  cat("\nNote: Insufficient data to build a multivariable linear model with the specified variables.\n")
  cat("The filtered dataset contains only one level for Break_Out_Var or LocationAbbr.\n")
  cat("Please adjust the filters to include a wider range of data for analysis.\n")
}
