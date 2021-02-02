library("tidyverse")
library("DT")
load("tidy_EnvAcc_data/consumption.rdata")

consumption %>%
  datatable(rownames = FALSE,
            extensions = c("Responsive", "Buttons"),
            options = list(pageLength = 5,
                           buttons = I("colvis"),
                           dom = "pprp"))
