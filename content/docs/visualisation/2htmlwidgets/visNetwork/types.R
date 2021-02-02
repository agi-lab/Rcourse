library("tidyverse")
library("visNetwork")

types <- read_csv("Pokemon/chart.csv")

type_nodes <- types %>%
  mutate(id = row_number(),
         label = Attacking) %>%
  select(id, label)

type_edges <- tibble(from = NA, to = NA)
for (i in 1:18) {
  for (j in 1:18) {
    if(types[i,j+1] == 2) {
      type_edges = rbind(type_edges, c(i,j))
    }
  }
}
type_edges <- type_edges[-1,]

visNetwork(nodes = type_nodes,
           edges = type_edges) %>%
  visEdges(arrows = "to")

