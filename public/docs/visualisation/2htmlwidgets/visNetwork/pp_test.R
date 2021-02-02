library("tidyverse")
library("visNetwork")

pp_data <- readxl::read_xls("predator_prey/carpinteria.xls")

pp_nodes <- pp_data %>%
  mutate(id = row_number(),
         class = ...1,
         label = ...2) %>%
  select(id, class, label)

pp_edges <- tibble(from = NA, to = NA)
for (i in 1:118) {
  for (j in 1:118) {
    if(pp_data[i+2,j+2] == 4) {
      pp_edges = rbind(pp_edges, c(i,j))
    }
  }
}
pp_edges <- pp_edges[-1,]

visNetwork(nodes = pp_nodes,
           edges = pp_edges) %>%
  visEdges(arrows = "to")



chain_data <- readxl::read_xls("predator_prey/Coweeta1.xls")

chain_nodes <- chain_data %>%
  mutate(id = row_number(),
         label = ...1) %>%
  select(id, label)

chain_edges <- tibble(from = NA, to = NA)
for (i in 1:nrow(chain_data)) {
  for (j in 1:nrow(chain_data)) {
    if(chain_data[i,j+1] == "1") {
      chain_edges = rbind(chain_edges, c(i,j))
    }
  }
}
chain_edges <- chain_edges[-1,]

new_chain_nodes <- rbind(chain_nodes, c(100, "A"))
new_chain_nodes <- rbind(new_chain_nodes, c(101, "B"))
new_chain_nodes <- rbind(new_chain_nodes, c(102, "C"))

new_chain_edges = rbind(chain_edges, c(100,101))
new_chain_edges = rbind(new_chain_edges, c(101,102))
new_chain_edges = rbind(new_chain_edges, c(102,100))

visNetwork(nodes = new_chain_nodes,
           edges = new_chain_edges) %>%
  visEdges(arrows = "to")


###########

# col is a character
isPrey <- function(colno) {
  ret = "Predator"
  if (sum(chain_data[colno]) == 0) {
    ret = "Prey"
  }
  return(ret)
}

chain_data <- chain_data %>%
  mutate(Class = "NA")

for (i in 1:58) {
  chain_data$Class[i] = isPrey(i+1)
}

