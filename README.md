# sbtn-SoN-water

This repo (work in progress) contains the code to generate the two ready-to-use unified layers of State of Nature (SoN) for water -- one for water availability and one for water pollution -- in line with the [SBTN Technical Guidance for steps 1 and 2 (Draft for Public Comment)](https://sciencebasedtargetsnetwork.org/wp-content/uploads/2022/09/Technical-Guidance-for-Step-1-Assess-and-Step-2-Prioritize.pdf). These unified layers will enable companies to effectively implement a common approach and will lead to more aligned and comparable results between different companies.

This work is a collaboration between WWF, WRI, and SBTN. The approach is described [here](https://docs.google.com/document/d/1DC2GnyD7GUu1HJ0U-29O18xEef99Z__i/edit).

Draft results can be visualized [here](https://panda.maps.arcgis.com/apps/mapviewer/index.html?webmap=d8c32cc0097247af9fad709dcde1217b). Inputs and temporary outputs are stored [here](https://drive.google.com/drive/folders/1jefGy2rMhoXQJxg5xFB4fsgjKAxgS7QG).

------------------------------------------------------------------------

Read the columns of the output `sbnt_son_water.shp` as follow:

|            |                                                                                   |
|-------------|-----------------------------------------------------------|
| HYBAS_ID   | id from the HydroBASINS level 6 (h6)                                              |
| WMOBB_id   | id from the WMO Basins and Sub-Basins                                             |
| WMOBB_name | Name of the basins in which the h6 is within                                      |
| region     | Name of the region in which the h6 is within                                      |
| bws_raw    | Raw value of Baseline Water Stress (as in the original dataset)                   |
| bws_n      | Normalized value of Baseline Water Stress                                         |
| bws_label  | Label of Baseline Water Stress (based on the original dataset)                    |
| wdp_raw    | Median of Water Depletion pixel values within h6, that were previously normalized |
| wdp_n      | Variable wdp_raw rounded to integer value                                         |
| wdp_label  | Label of Water Depletion (based on the original dataset)                          |
| wsb_raw    | Median of Blue Water Scarcity pixel values within h6                              |
| wsb_n      | Variable wsb_raw normalized                                                       |
| wsb_label  | Label of Blue Water Scarcity (based on the original dataset)                      |
| wa_min     | Minimum value between bws_n, wdp_n, wsb_n                                         |
| wa_avg     | Mean value between bws_n, wdp_n, wsb_n                                            |
| wa_med     | Median value between bws_n, wdp_n, wsb_n                                          |
| wa_75q     | 75th quantile value between bws_n, wdp_n, wsb_n                                   |
| wa_max     | Maximum value between bws_n, wdp_n, wsb_n                                         |
| wa_diff    | Maximum difference in value between bws_n, wdp_n, wsb_n                           |
| wa_n\_nas  | Number of NAs between bws_n, wdp_n, wsb_n                                         |
| wa_max_lyr | Layer(s) from which the value wa_max comes                                        |
| wa_min_lyr | Layer(s) from which the value wa_min comes                                        |
