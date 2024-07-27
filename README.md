# Point Count data from the Ottawa Bird Count

## Ottawa Bird Count

The Ottawa Bird Count (OBC) is a designed survey of the birds in the urban and suburban areas of Ottawa. The OBC includes a point count program that includes over 900 survey points located across the city in a stratified random design. There is one survey point within each cell of a 1km x 1km grid, located at a randomly chosen publicly accessible location (most are adjacent to roads or public pathways). These points are grouped into approximately 100 survey routes, and an observer visits the points in each survey route in a predetermined order on one morning during the peak breeding season for the Ottawa region (May 24 - July 7). At each of the survey points along the route, the observer conducts a 10-minute point count survey. The observation protocol involves recording each bird seen or heard during the 10-minute count, and the observations are recorded within two distance bins (0 - 75 m from the point, and \>75 m from the point) and 5 two-minute time-of-detection bins (i.e., 0-2 minutes, 2-4 minutes, 4-6 minutes, etc.). Only the first observation of each individual bird is recorded, so subsequent observations of birds in later time-of-detection bins or distance bins are ignored. This protocol allows the data to be anlaysed using both time-of-detection (often referred to as "removal") models to estimate the availability of birds and detection-distance models to estimate the variation in perceptibility of birds with increasing distance [@sólymos2013][@amundson2014]. The routes are only surveyed during suitable weather (low or no wind and no precipitation) and each route survey-event begins 30-minutes before local sunrise (beginning of the first point count on the route) and subsequent point counts are visited in quick succession in the predetermined order.

Additional data on the number of vehicles passing the observer (e.g., background noise), weather, time-of-day, and survey date are recorded that may also provide useful covariates of perceptibility and availability.

## Years with data

The Ottawa Bird Count started in 2007, and most surveys were conducted during the years 2007 - 2013. There were a few surveys conducted during the years 2013-2018, and then the field program has been suspended since 2019. The program will re-start in the field season of 2027, when all of the original point count locations will be re-surveyed with the intention of estimating 20-year changes in the city's bird populations.

## Data column descriptions

The point count data archived in this repository are and output from the main sql database, stored in an R-list object saved as a .rds file. The list has 9 components, each of which is a dataframe. There are 5 primary dataframes that contain the point count observations and each of these 5 dataframes include the following columns of information:

-   route - file containing information for each route (collection of point counts surveyed by a given observer in a single morning)

    -   route_id = unique ID for each route (collection of 6-12 point count locations)

    -   name = text name of route

-   route_observation - information for each route survey event

    -   route_observation_id = unique ID for the route survey event (i.e., the surveys conducted on a given route, on a given morning, by a given observer)

    -   route_id = unique ID for each route

    -   volunteer_id = unique ID for each observer (anonymous)

    -   precipitation_id = numerical code for precitation conditions during that morning

    -   start_wind_id = numerical code for wind conditions at the beginning of the survey (start of first point count)

    -   end_wind_id = numerical code for the wind conditions at the end of the survey (start of last point count)

    -   start_sky = numerical code to describe sky condition at the beginning of the survey (e.g., cloud cover)

    -   end_sky = numerical code to describe sky condition at the end of the survey

    -   start_time = local time of beginning of route survey

    -   end_time = local time at end of route survey

    -   start_temperature = local temperature (Celsius) at the beginning of route survey

    -   end_temperature = local temperature (Celsius) at the end of route survey

    -   comments = text comments related to survey event

    -   year = year survey was conducted

    -   month = month survey was conducted

    -   day = day of month that survey was conducted

-   route_point - information for each point count location

    -   route_point_id = unique ID for each point count location

    -   route_id = unique ID for each route

    -   utm_eas = UTM easting coordinate of point count location

    -   utm_north = UTM northing coordinate of point count location

    -   ext_point_id = external point count number within each route (indicates the order in which each point count location is surveyed within the route)

-   route_point_observation

    -   route_point_observation_id = unique ID for each survey event at a given point count location (i.e., observations at a given point count on a given morning by a given observer)

    -   route_point_id = unique ID for each point count location

    -   route_observations_id = unique ID for the route survey event (i.e., the surveys conducted on a given route, on a given morning, by a given observer)

    -   noise_0 = indicator of high noise conditions - during the first 2-minutes- that obscure the ability to observer birds (possible values: "Y" = TRUE = enough noise that observer indicated their ability to observer birds was obscured, "N" = FALSE)

    -   noise_2 = indicator of high noise conditions - during the period between 2 and 4 minutes of the 10-minute point count

    -   noise_4 = indicator of high noise conditions - during the period between 4 and 6 minutes of the 10-minute point count

    -   noise_6 = indicator of high noise conditions - during the period between 6 and 8 minutes of the 10-minute point count

    -   noise_8 = indicator of high noise conditions - during the period between 8 and 10 minutes of the 10-minute point count

    -   start_Time = local start time of the 10-minute point count

    -   comments = text comment field for that point count survey

    -   num_vehicles_id = unique ID for the categories of number of vehicles passing the observer during the 10-minute survey

    -   noise_time = approximate percent of the 10-minute survey period when loud noise obscured the observer's ability to perceive birds. Alternate way of recording potentially obscuring noise, complementary to the 5 noise_X columns.

-   species_point_observation_count - observations for each species observed during a given point count survey. One row for each species observed during each point count survey event.

    -   species_id = unique ID for each species

    -   route_point_observation = unique ID for each survey event at a given point count location (i.e., observations at a given point count on a given morning by a given observer)

    -   count_0 = number of individual birds observed within 75 m of the observer, during the first 2-minutes of the 10-minute point count

    -   count_2 = number of individual birds observed within 75 m of the observer, during the period between 2 and 4 minutes of the 10-minute point count

    -   count_4 = number of individual birds observed within 75 m of the observer, during the period between 4 and 6 minutes of the 10-minute point count

    -   count_6 = number of individual birds observed within 75 m of the observer, during the period between 6 and 8 minutes of the 10-minute point count

    -   count_8 = number of individual birds observed within 75 m of the observer, during the period between 8 and 10 minutes of the 10-minute point count

    -   count_75 = \[alternative to following 5 columns, if missing value, then use counts in the following 5 columns, if not missing (0 or positive integer) then ignore values in following 5 columns\] total number of individual birds observed at a distance \> 75 m from the observer during the entire 10-minute point count. Birds observed outside of 75 m were recorded separately from birds inside and without the time-bins during the first few years of the program. In subsequent years, birds outside of the 75m radius were recorded in time-bins, similar to the birds inside of the 75 m radius.

    -   count_75_0 = number of individual birds observed at distances greater than 75 m from the observer, during the first 2-minutes of the 10-minute point count

    -   count_75_2 = number of individual birds observed at distances greater than 75 m from the observer, during the period between 2 and 4 minutes of the 10-minute point count

    -   count_75_4 = number of individual birds observed at distances greater than 75 m from the observer, during the period between 4 and 6 minutes of the 10-minute point count

    -   count_75_6 = number of individual birds observed at distances greater than 75 m from the observer, during the period between 6 and 8 minutes of the 10-minute point count

    -   count_75_8 = number of individual birds observed at distances greater than 75 m from the observer, during the period between 8 and 10 minutes of the 10-minute point count

There are an additional 4 dataframes that provide information on the codes used to record the number of vehicles, precipitation, wind, and species names.

-   species - species list

    -   species_id = unique ID for each species

    -   name_en = english name of species \[ in some cases shortened\]

    -   name_fr = french name of species

    -   full_name_fr = english common name of species

    -   n_atlas_squares = number of Ontario Breeding Bird Atlas squares in the Ottawa region where species was observed breeding during the 2nd Ontario Atlas (2000 - 2005).

    -   highest_rank_be = highest breeding evidence rank recorded during the second Ontario Breeding Bird Atlas

    -   aou_species_order = approximate taxonomic ordering of species based on AOU checklist version 2005.

    -   letter_code = four-letter english species code

-   wind

    -   wind_id = numerical code for wind conditions at the beginning of the survey (start of first point count) - joins with both start_wind_id and end_wind_id. No surveys are conducted if wind is outside of these values (\> 19km/h).

    -   name = text description of the wind conditions

-   precipitation - categories of very light precipitation insufficient to disrupt point count surveys (no surveys are conducted with precipitation other than in these categories)

    -   precipitation_id = numerical code for precipitation conditions during that morning

    -   name = text describing the precipitation conditions

-   num_vehicles - categories describing the number of vehicles passing an observer during a point count survey

    -   num_vehicles_id = unique ID for the categories of number of vehicles passing the observer during the 10-minute survey

    -   name = count-categories indicating the number of vehicles observed.

## Example data extraction

Note, here I'll load the tidyverse package, which is entirely optional but I like to use for data manipulation.

The point count data can be read into an R session using `readRDS()`.

```{r}

library(tidyverse)

all_data <- readRDS("OBC_point_count_data.rds")

names(all_data)
```

The various dataframes can be joined using the common column names with the "_id" suffixes. 

For example, if we wanted to select all of the point count surveys conducted during the field season of 2008.

```{r}

surveys_08 <- all_data[["route_observation"]] %>% 
  filter(year == 2008)
names(surveys_08)
```
This extracts all of the survey event information for point count routes surveyed during the 2008 field season. There are `r nrow(surveys_08)` rows in the `surveys_08` dataframe and therefore `r nrow(surveys_08)` routes surveyed that year. The values in the column `route_observation_id` are used to link these route survey events to the point count locations in the `route_point` dataframe, the point-level observation conditions in the `route_point_observation` dataframe, and the bird observations collected during these surveys in the `species_point_observation_count` dataframe. 

First, I'll join the route survey information from 2008 to the point count location information. 

```{r}

point_counts_08 <- surveys_08 %>% 
  left_join(.,all_data[["route_point"]],
             multiple = "all",
            by = "route_id")


```

In 2008, there were a total of `r nrow(point_counts_08)` point count locations on the routes that were surveyed. It is possible (probable) that some of these locations were not actually surveyed due to safety, logistical, or changing weather conditions. We will now compare these point count locations to the route_point_observation data.

First, we select all of the route_point_observation data associated with the survey events on the routes surveyed in 2008, and filter out those with a missing data on start-time (indicating they were not actually surveyed).

```{r}
points_counts_surveyed_2008 <- all_data[["route_point_observation"]] %>% 
  filter(route_observation_id %in% point_counts_08$route_observation_id,
         !is.na(start_time))

```

There were `r nrow(point_counts_08) - nrow(point_counts_surveyed_2008)` point counts on the routes surveyed in 2008, that for some reason could not be surveyed that year.

Now, we collect the bird observations from those point count surveys. We will join the point_count_surveyed_2008 dataframe to the bird observations in a way that ensures all of the appropriate zeroes are added to the database (zero-counts of species not observed at all during a particular point count).

To do that, first we get the full set of bird observations from 2008. 

```{r}

birds_observed_2008 <- all_data[["species_point_observation_count"]] %>% 
  filter(route_point_observation_id %in% points_counts_surveyed_2008$route_point_observation_id) 

```

Then we combine the full list of species observed with the full list of point counts surveyed to generate a full dataframe with a unique row for each species and each point count survey. 

```{r}
species_list_2008 <- birds_observed_2008 %>% 
  select(species_id) %>% 
  distinct()

route_point_obs_2008 <- birds_observed_2008 %>% 
  select(route_point_observation_id) %>% 
  distinct()

full_species_point_dataframe <- expand_grid(route_point_obs_2008,species_list_2008)

```

Then we join the bird observation information to this full dataframe and replace the missing counts with 0 values.

```{r}


observations_w_zeroes <- full_species_point_dataframe %>% 
  left_join(.,birds_observed_2008,
            by = c("species_id","route_point_observation_id"))%>% 
  left_join(.,all_data[["species"]],
            by = "species_id") %>% 
  mutate(true_zeros = ifelse(is.na(count_0),TRUE,FALSE),
         count_0 = ifelse(true_zeros,
                          0,count_0),
         count_2 = ifelse(true_zeros,
                          0,count_2),
         count_4 = ifelse(true_zeros,
                          0,count_4),
         count_6 = ifelse(true_zeros,
                          0,count_6),
         count_8 = ifelse(true_zeros,
                          0,count_8),
         count_75 = ifelse(true_zeros & !is.na(count_75),
                          0,count_75),
         count_75_0 = ifelse(true_zeros,
                          0,count_75_0),
         count_75_2 = ifelse(true_zeros,
                          0,count_75_2),
         count_75_4 = ifelse(true_zeros,
                          0,count_75_4),
         count_75_6 = ifelse(true_zeros,
                          0,count_75_6),
         count_75_8 = ifelse(true_zeros,
                          0,count_75_8))

```


This `observations_w_zeroes` dataframe now includes all bird observations, with the appropriate zero values for species that were absent during a given point count. 



