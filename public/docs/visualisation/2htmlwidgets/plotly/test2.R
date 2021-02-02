library("plotly")

load("tidy_ABARES_data/farm_data.rdata")

variables = c("Total.factor.productivity",
              "Climate.effect",
              "Climate.adjusted.TFP")

plot1 <- function(var1) {
  farm_data %>%
    plot_ly() %>%
    add_trace(type = "scatter",
              x = ~year,
              y = as.formula(paste0("~", var1)),
              mode = "lines") %>%
    layout(xaxis = list(title = "Year"),
           yaxis = list(title = "Index"),
           showlegend = FALSE)
}

plots <- lapply(variables, plot1)

subplot(plots,
        shareX = TRUE,
        nrows = length(plots),
        titleY = TRUE)


