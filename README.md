# ResidentialEmission_TimeSeries
Final Course Project: Time Series Modeling

# Time Series Modeling Final Project

This repository contains the code and analysis conducted as part of the **Time Series Modeling Course Final Project**. The project focuses on analyzing and forecasting residential CO₂ emissions from various energy sources using time series techniques.

## Overview

The project involves:
1. Data cleaning and preprocessing.
2. Time series creation and transformation.
3. Exploratory Data Analysis (EDA) through plots.
4. Time series modeling using ARIMA and seasonal decomposition.
5. Forecast validation and visualization.

### Key Libraries Used

- `forecast`
- `ggplot2`
- `dplyr`
- `lubridate`
- `tseries`
- `MASS`
- `patchwork`
- `astsa`

## Data

The dataset includes monthly residential CO₂ emissions from 1973 to 2021 for various energy sources such as coal, natural gas, and electricity. Data was sourced from a government database (file not included in the repository).

## Code Structure

### 1. Data Preprocessing
- Load and clean data.
- Handle missing values.
- Restructure data for time series analysis.

### 2. Time Series Analysis
- Create time series objects.
- Transform data (Box-Cox transformation).
- Perform ACF and PACF analysis.

### 3. Forecasting
- Fit ARIMA models to the data.
- Compare different ARIMA configurations.
- Validate forecasts with actual data.

### 4. Visualization
- Visualize time series and forecasts using `ggplot2`.
- Monthly patterns and decomposition plots.

## Visualization Highlights

Some key plots include:
- Monthly CO₂ emission trends.
- ACF and PACF analysis.
- Comparison of forecasted vs. actual data.

## How to Run

1. Install the required R libraries listed in the code.
2. Load the data into the specified file path.
3. Run the script in an R environment.

## License

This project is licensed under the MIT License.
