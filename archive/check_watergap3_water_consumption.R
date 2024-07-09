library(readr)
library(dplyr)
library(sf)
library(here)
library(skimr)
library(stringr)
library(tmap)

wdp_basin <- read_sf(here("inputs", "water_depletion", "WaterGap3Shape", "WaterGap3_AllBasins.shp"))

wg3_consumption <- read_csv(
  here("inputs", "water_depletion", "SectorConsumption_m3_annual.csv"),
  col_names = c("subBas_ID", "domestic", "manufacturing", "electric", "irrigation", "livestock")
)

wg3_consumption |> 
  group_by(subBas_ID) |> 
  filter(n() > 1) |> # identify duplicates
  nrow()

skim(wg3_consumption)

joined <- wdp_basin |> 
  select(ContUID) |> 
  inner_join(wg3_consumption, by = c("ContUID" = "subBas_ID"))

qtm(joined, fill = "irrigation", borders = NULL)


# Check basins that didn't join
tmap_options(check.and.fix = TRUE)

wdp_basin |> 
  filter(!ContUID %in% pull(joined, ContUID)) |> 
  qtm(fill = "red", borders = NULL)
