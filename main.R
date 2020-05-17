library(dplyr)
library(tercen)

min_max_norm <- function(x) {
    (x - min(x)) / (max(x) - min(x))
  }

#apply Min-Max normalization

(ctx = tercenCtx())  %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  min_max_norm(.y) %>%
  ctx$addNamespace() %>%
  ctx$save()
