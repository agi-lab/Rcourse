library("tidyverse")
library("visNetwork")
library("readxl")

pokemon <- read_csv("Pokemon/pokemon.csv")


# Function to obtain list of other pokemon we are supereffective against
# p1 and p2 are numbers, referring to Pokemon in a specific row of the table

# We have columns telling us the type modifier on that Pokemon

# Tests is p1 is super on p2
# p1 is super on p2 if: p1's primary type modifier or p1's secondary type modifier on p2 is above 1
isSuperEffective <- function(p1, p2) {
  mod = 1
  
  # Get p1's first type
  p1t1 = pokemon$type1[p1]
  
  if (p1t1 == "fighting") {
    p1t1 = "fight"
  }
  
  # Get p2's modifier for that type
  mod1 = eval(parse(text = paste0("pokemon$against_", p1t1, "[", p2, "]")))
  
  # If p1 has another type, we do the same
  mod2 = 0
  if(!is.na(pokemon$type2[p1])) {
    p1t2 = pokemon$type2[p1]
    
    if (p1t2 == "fighting") {
      p1t2 = "fight"
    }
    
    mod2 = eval(parse(text = paste0("pokemon$against_", p1t2, "[", p2, "]")))
  }
  
  return (mod1 > 1 | mod2 > 1)
}

# Sampling
set.seed(1)
poke_vector <- sample(1:150, 50, replace = FALSE)


# Make pokemon into nodes
poke_nodes <- pokemon %>%
  select(id = pokedex_number,
         label = name) %>%
  filter(id %in% poke_vector)

# Edge building process
poke_edges <- tibble(from = NA, to = NA)
for(i in poke_vector) {
  for(j in poke_vector) {
    if (isSuperEffective(i, j) == TRUE) {
      poke_edges <- rbind(poke_edges, c(i,j))
    }
  }
}
poke_edges <- poke_edges[-1,]

# Create network
visNetwork(nodes = poke_nodes,
           edges = poke_edges) %>%
  visEdges(arrows = "to")



