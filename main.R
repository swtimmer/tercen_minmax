library(tercen)
library(dplyr)


min_max_norm <- function(x) {
    (x - min(x)) / (max(x) - min(x))
  }

#apply Min-Max normalization

(ctx = tercenCtx())  %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  summarise(minmax = min_max_norm(.y)) %>%
  ctx$addNamespace() %>%
  ctx$save()
