# setup.R

# Packages -----

packages <- c(
  "tidyverse",
  "leaflet",
  "reactable",
  "DT",
  "glue",
  "htmltools",
  "dplyr"
  
)

installed <- rownames(installed.packages())

to_install <- setdiff(packages, installed)

if (length(to_install) > 0) {
  install.packages(to_install)
}

invisible(lapply(packages, library, character.only = TRUE))


# Load data ------

ice_df <- readr::read_csv("data/ICECBPdata.csv")


### check names for coding
bad_encoding <- sapply(
  ice_df,
  function(x) {
    if (is.character(x)) {
      any(!is.na(x) & is.na(iconv(x, from = "", to = "UTF-8")))
    } else {
      FALSE
    }
  }
)

bad_encoding

bad_rows <- which(
  !is.na(ice_df$Name) &
    is.na(iconv(
      ice_df$Name,
      from = "",
      to = "UTF-8"
    ))
)

bad_rows

ice_df$Name[bad_rows]