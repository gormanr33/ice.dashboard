# setup.R

# Packages -----

packages <- c(
  "knitr",
  "rmarkdown",
  "tidyverse",
  "leaflet",
  "reactable",
  "DT"
)

installed <- rownames(installed.packages())

to_install <- setdiff(packages, installed)

if (length(to_install) > 0) {
  install.packages(to_install)
}

invisible(lapply(packages, library, character.only = TRUE))


# Load data ------

analysis_data <- readr::read_csv("D:/Github/ice.dashboard/data/ICE_CBP Shootings+Detention Center Deaths_2026.csv")