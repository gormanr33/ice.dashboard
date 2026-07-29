# setup.R

# Packages -----

packages <- c(
  "tidyverse",
  "leaflet",
  "reactable",
  "DT",
  "glue",
  "htmltools"
)

installed <- rownames(installed.packages())

to_install <- setdiff(packages, installed)

if (length(to_install) > 0) {
  install.packages(to_install)
}

invisible(lapply(packages, library, character.only = TRUE))


# Load data ------

ice_df <- readr::read_csv("data/ICECBPdata.csv")
