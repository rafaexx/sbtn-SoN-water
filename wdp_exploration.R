# which statistics is best to aggregate the water depletion data?

wdp_n <- exact_extract(wdp_n, h6, fun = c("mean", "median", "quantile", "majority", "coefficient_of_variation"), quantiles = 0.75,
                       append_cols = "HYBAS_ID", progress = TRUE)  

wdp_n <- wdp_n %>%
  mutate(
    wdp_mj = majority,
    wdp_me = mean,
    wdp_md = median,
    wdp_75 = q75,
    wdp_cov = coefficient_of_variation
  ) %>%
  dplyr::select(HYBAS_ID, wdp_mj:wdp_cov) %>%
  rowwise() %>%
  mutate(
    wdp_mj_md = wdp_mj - wdp_md,
    wdp_mj_75 = wdp_mj - wdp_75,
    wdp_75_md = wdp_75 - wdp_md,
    wdp_md_me = wdp_md - wdp_me
  ) %>%
  ungroup()

skim(wdp_n)

sf::sf_use_s2(FALSE) # due to issues in HydroBASINS geometries

h6 %>%
  left_join(wdp_n, by = "HYBAS_ID") %>%
  st_write(here("output", "wdp_n.shp"), layer_options = "ENCODING=UTF-8", delete_layer = TRUE)

# group agreed to use the median