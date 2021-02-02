library("tidyverse")
library("readxl")

# Reading only 2013-2014 data

s12 <- read_xls("raw_EnvAcc_data/Accounts2016.xls",
                sheet = "Table_12",
                range = "A6:G14") %>%
  select(1,7)
colnames(s12) <- c("State", "DistributedReuseSupply(GL)")
  

s13 <- read_xls("raw_EnvAcc_data/Accounts2016.xls",
                sheet = "Table_13",
                range = "A6:G14") %>%
  select(1,7)
colnames(s13) <- c("State", "Consumption(GL)")


s14 <- read_xls("raw_EnvAcc_data/Accounts2016.xls",
                sheet = "Table_14",
                range = "A6:G14") %>%
  select(1,7)
colnames(s14) <- c("State", "Expenditure($m)")


s15 <- read_xls("raw_EnvAcc_data/Accounts2016.xls",
                sheet = "Table_15",
                range = "A6:M14") %>%
  select(1,12,13)
colnames(s15) <- c("State", "HouseholdPhysical(GL)", "HouseholdMonetary($m)")


s16 <- read_xls("raw_EnvAcc_data/Accounts2016.xls",
                sheet = "Table_16",
                range = "A6:G14") %>%
  select(1,7)
colnames(s16) <- c("State", "HouseholdPrice($/KL)")

water_data <- s12 %>%
  merge(s13, by = "State") %>%
  merge(s14, by = "State") %>%
  merge(s15, by = "State") %>%
  merge(s16, by = "State")

save(water_data, file = "tidy_EnvAcc_data/water_data.rdata")
