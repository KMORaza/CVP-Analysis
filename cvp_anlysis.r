library(ggplot2)
data("ChickWeight")
head(ChickWeight)
fixed_costs <- 1000
variable_costs_per_unit <- 0.5
ChickWeight$total_costs <- fixed_costs + variable_costs_per_unit * ChickWeight$weight
ChickWeight$total_revenue <- ChickWeight$weight * ChickWeight$Time
ChickWeight$total_profit <- ChickWeight$total_revenue - ChickWeight$total_costs
ggplot(data = ChickWeight, aes(x = Time, y = total_profit)) +
  geom_line() +
  labs(x = "Time", y = "Total Profit", title = "CVP Analysis") +
  theme_minimal()
breakeven_point <- fixed_costs / variable_costs_per_unit
cat("Breakeven Point:", breakeven_point, "\n")
activity_levels <- seq(500, 2000, by = 100)
profit_at_activity <- ChickWeight$total_revenue - (fixed_costs + variable_costs_per_unit * activity_levels)
profit_data <- data.frame(Activity = activity_levels, Profit = profit_at_activity)
ggplot(data = profit_data, aes(x = Activity, y = Profit)) +
  geom_line() +
  labs(x = "Activity", y = "Profit", title = "Profit at Different Levels of Activity") +
  theme_minimal()
