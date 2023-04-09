library(shiny)
library(shinydashboard)
library(DT)
library(tibble)
library(dplyr)

# global ------------------------------------------------------------------

start_city <- lubridate::int_start(jpcity:::interval_city)
end_city <- lubridate::int_end(jpcity:::interval_city)

get_merger_data <- function(from, to, merge, only_changed) {
  from <- as.character(from)
  to <- as.character(to)
  city_from <- jpcity::get_city(from)
  if (merge) {
    city_from <- city_from |>
      jpcity::city_desig_merge() |>
      unique()
  }

  city_to <- jpcity::city_convert(city_from, from, to)
  out <- tibble(from = city_from,
         to = city_to) |>
    tidyr::unnest(to)
  if (merge) {
    out <- out |>
      mutate(to = to |>
               jpcity::city_desig_merge()) |>
      unique()
  }
  out |>
    mutate(from = from |>
             jpcity:::city_data() |>
             select(city_code, city_desig_name, city_name),
           to = to |>
             jpcity:::city_data() |>
             select(city_code, city_desig_name, city_name),
           .keep = "unused") |>
    tidyr::unpack(c(from, to),
                  names_sep = "_") |>
    mutate(multiple = n() > 1L,
           .by = from_city_code) |>
    filter(!only_changed | multiple | from_city_code != to_city_code)
}

get_city_data <- function(when, merge) {
  out <- jpcity::get_city(as.character(when))
  if (merge) {
    out <- out |>
      jpcity::city_desig_merge() |>
      unique()
  }
  jpcity:::city_data(out)
}

pref_data <- jpcity:::string_pref_name |>
  select(pref_code, pref_name)

city_desig_data <- jpcity:::city_desig_code |>
  distinct(city_code, city_desig_code)
