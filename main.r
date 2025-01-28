# Load Required Libraries
library(forecast)
library(ggplot2)
library(dplyr)
library(lubridate)
library(patchwork)
library(tseries)

# Load and Preprocess Data
Emission_Data_residential <- read.csv('Data_Emission_residential.csv', stringsAsFactors = FALSE, na.strings = c("", "NA", "Not Available"))
Emission_Data_residential <- na.omit(Emission_Data_residential)

# Transform Data
myData <- Emission_Data_residential %>%
  mutate(
    year = substr(as.character(YYYYMM), 1, 4),
    month = substr(as.character(YYYYMM), 5, 6),
    value = as.numeric(Value),
    description = recode(
      Description,
      "Coal Residential Sector CO2 Emissions" = "coal",
      "Natural Gas, Excluding Supplemental Gaseous Fuels, Residential Sector CO2 Emissions" = "natural gas",
      "Distillate Fuel Oil Residential Sector CO2 Emissions" = "distillate fuel",
      "HGL Residential Sector CO2 Emissions" = "HGL",
      "Kerosene Residential Sector CO2 Emissions" = "kerosene",
      "Petroleum Residential Sector CO2 Emissions" = "petroleum",
      "Residential Share of Electric Power Sector CO2 Emissions" = "Res Elec",
      "Total Energy Residential Sector CO2 Emissions" = "total energy"
    )
  ) %>%
  filter(month != "13") %>%
  select(year, month, value, description)

# Create Time Series Objects
NG_res_ts <- ts(myData$value[myData$description == "natural gas"], start = c(1973, 1), frequency = 12)

# Plot Natural Gas Time Series
autoplot(NG_res_ts) + ggtitle("Natural Gas CO2 Emissions")

# Box-Cox Transformation
lambda_NG <- BoxCox.lambda(NG_res_ts)
NG_res_transform <- BoxCox(NG_res_ts, lambda = lambda_NG)

# Fit ARIMA Model
MODEL_NG <- auto.arima(NG_res_transform, seasonal = TRUE)
check_residuals(MODEL_NG)

# Forecast and Plot
forecast_NG <- forecast(MODEL_NG, h = 12)
autoplot(forecast_NG) + ggtitle("Forecast: Natural Gas CO2 Emissions")
