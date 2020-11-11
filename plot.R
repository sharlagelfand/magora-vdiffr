library(magora)
library(vdiffr)
library(dplyr)

p <- phenotypes %>%
  filter(mouse_line != "5XFAD") %>%
  filter(
    .data$phenotype %in% "Microglia #",
    .data$mouse_line %in% c("5XFAD", "C57BL6J"),
    .data$tissue %in% "Cortex"
  ) %>%
  expand_mouse_line_factor_from_selection(c("C57BL6J", "5XFAD")) %>%
  magora_boxplot()

vdiffr::write_svg(plot = p, "plot.svg")
