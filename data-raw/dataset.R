# Source: https://www.transitionmonitor.com/pacta-for-banks-2020/methodology-and-supporting-materials/

library(fs)
library(tidyverse, warn.conflicts = FALSE)

files <- dir_ls(here::here("data-raw/"), regexp = "[.]csv")

# Edition 2 fails because of "C0 control character, see `?unhandled_ctl`
readr::with_edition(1, {
  scenarios <- map(files, ~read_csv(.x, col_types = list()))
})

emission_factor <- scenarios %>%
  keep(hasName, "emission_factor") %>%
  reduce(bind_rows) %>%
  pivot_longer(emission_factor, names_to = "variable") %>%
  rename(unit = emission_factor_unit) %>%
  mutate(technology = NA_character_)

tmsr_smsp <- scenarios %>%
  keep(hasName, "tmsr") %>%
  reduce(bind_rows) %>%
  pivot_longer(cols = c(tmsr, smsp), names_to = "variable") %>%
  mutate(unit = NA_character_)

scenarios <- bind_rows(emission_factor, tmsr_smsp)
usethis::use_data(scenarios, overwrite = TRUE)
