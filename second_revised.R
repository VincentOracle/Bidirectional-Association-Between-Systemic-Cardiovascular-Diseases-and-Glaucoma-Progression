############################################################
# relevance_effectiveness.R
# Master: RELEVANCE & EFFECTIVENESS analysis + outputs
# BMZ-Funded WASH & Climate Resilience Project (HFHK)
# ---------------------------------------------------------
# Inputs:
#   Relevance & Demographics: "C:/Users/Hp/Downloads/relevance_demographics.csv"
#   Effectiveness & Demographics: "C:/Users/Hp/Downloads/effectiveness_demographics.csv"
# Outputs (tables + charts + text summaries):
#   "C:/Users/Hp/Downloads/BMZ_OUTPUTS"
############################################################

# ----------------------------
############################################################
# relevance_effectiveness_partA.R
# Part A: Header, helpers, load data, derived flags, A) Overall Concerns
############################################################

# ----------------------------
# Libraries
# ----------------------------
suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(janitor)
  library(stringr)
  library(tidyr)
  library(ggplot2)
  library(glue)
  library(purrr)
  library(forcats)
})

# ----------------------------
# Paths (edit if needed)
# ----------------------------
out_dir <- "C:/Users/Hp/Downloads/BMZ_OUTPUTS"
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

data_path_rel <- "C:/Users/Hp/Downloads/relevance_demographics.csv"
data_path_eff <- "C:/Users/Hp/Downloads/effectiveness_demographics.csv"

# ----------------------------
# Helpers
# ----------------------------
log_msg <- function(...) cat(glue(...), "\n")

save_tbl <- function(tbl, fn){
  path <- file.path(out_dir, fn)
  readr::write_csv(tbl, path)
  invisible(path)
}

save_plot <- function(p, fn, w=9, h=6){
  path <- file.path(out_dir, fn)
  ggsave(filename = path, plot = p, width = w, height = h, dpi = 300, bg = "white")
  invisible(path)
}

# Save narrative paragraph(s) to text file
save_narrative <- function(text_lines, fn){
  path <- file.path(out_dir, fn)
  writeLines(text_lines, con = path)
  invisible(path)
}

# Print & save table as a short narrative summary (top rows)
print_and_save_tbl_narrative <- function(tbl, title, fn_table, fn_plot = NULL, fn_text = NULL, top_n = 6){
  # save table
  path_tbl <- save_tbl(tbl, fn_table)
  log_msg("Saved table: {path_tbl}")
  # print table head to console
  log_msg("---- {title} ----")
  print(head(tbl, n = top_n))
  # narrative summary
  if(nrow(tbl) == 0){
    narrative <- glue("{title}: No records found.")
  } else {
    # build a short narrative: top item(s)
    top <- tbl %>% arrange(desc(n)) %>% slice_head(n = 3)
    top_lines <- top %>% mutate(line = glue("{row_number()}. {ifelse(!is.na(value),value, as.character(.[[1]]))} — n={n} ({ifelse(!is.na(pct),paste0(pct,'%'), 'NA')})")) %>% pull(line)
    narrative <- c(glue("{title} (top {min(3,nrow(tbl))}):"), top_lines)
  }
  # print narrative
  message(paste(narrative, collapse = "\n"))
  # save narrative text if requested
  if(!is.null(fn_text)){
    save_narrative(narrative, fn_text)
    log_msg("Saved narrative text: {file.path(out_dir, fn_text)}")
  }
  # save plot path if passed (caller will generate plot and pass fn_plot)
  invisible(list(table = path_tbl, narrative = narrative))
}

# Safe `%||%`
`%||%` <- function(a, b) if(!is.null(a)) a else b

# Identify the first existing column name from candidates
first_existing_col <- function(df, candidates){
  hit <- candidates[candidates %in% names(df)][1]
  if(is.na(hit)) return(NULL)
  return(hit)
}

# Flag HFHK kiosk users by text match
is_hfhk_kiosk_source <- function(x){
  str_detect(str_to_lower(x %||% ""), "(kiosk|hfhk|hfhk kiosk|hfhk borehole|project kiosk|project borehole)")
}

clean_text_safe <- function(x) {
  s <- iconv(x, from = "", to = "UTF-8", sub = " ")   # drop invalid bytes
  s <- stringr::str_replace_all(s, "[[:space:]]+", " ") # normalize spaces
  s <- stringr::str_replace_all(s, "[–—]", "-")         # replace en/em dashes
  s
}

# Convert time descriptors to minutes (for categories <30, 30-60, >1 hour)
convert_time_to_minutes <- function(x) {
  s <- clean_text_safe(as.character(x)) %>% str_to_lower()
  case_when(
    str_detect(s, "<30|min|less than 30") ~ 15,
    str_detect(s, "30[-–]60|30 to 60|30 60|30 - 60|30–60") ~ 45,
    str_detect(s, ">1|> 1|more than 60|1 hour|>1 hour|> 60") ~ 90,
    suppressWarnings(!is.na(as.numeric(s))) ~ as.numeric(s),
    TRUE ~ NA_real_
  )
}

# ----------------------------
# Load Data
# ----------------------------
rel <- readr::read_csv(data_path_rel, show_col_types = FALSE) %>% clean_names()
eff <- readr::read_csv(data_path_eff, show_col_types = FALSE) %>% clean_names()

log_msg("Loaded relevance data: {nrow(rel)} rows, {ncol(rel)} columns.")
log_msg("Loaded effectiveness data: {nrow(eff)} rows, {ncol(eff)} columns.")

# ----------------------------
# Derived flags & canonical fields
# ----------------------------

# Attempt to find distance column candidates
dist_candidates <- c("distance_to_kiosk_m","distance_to_water_source_m","distance_m","distance_hfhk_kiosk_m","distance_in_meters")
dist_col_rel <- first_existing_col(rel, dist_candidates)
dist_col_eff <- first_existing_col(eff, dist_candidates)
dist_col <- dist_col_rel %||% dist_col_eff  # use first available

# Attempt to find kiosk price/amount column candidates
price_candidates <- c("kiosk_price_per_20l","pay_amount_kiosk","amount_paid_20l","amount_paid","kiosk_cost_kes","pay_frequency_20l")
price_col_rel <- first_existing_col(rel, price_candidates)
price_col_eff <- first_existing_col(eff, price_candidates)
price_col <- price_col_rel %||% price_col_eff

rel <- rel %>%
  mutate(
    village = village,
    gender = gender_hh,
    aware_hfhk_flag = str_to_lower(aware_hfhk) %in% c("yes","y","1", "aware","true"),
    primary_source = primary_water_source,
    hfhk_water_user = is_hfhk_kiosk_source(primary_water_source),
    pay_for_water_flag = str_to_lower(pay_for_water) %in% c("yes","y","1","true"),
    water_year_flag = str_to_lower(water_year_round) %in% c("yes","y","1","true"),
    hfhk_latrine_user = str_detect(str_to_lower(latrine_type), "hfhk|flood"),
    pay_frequency_20l = pay_frequency_20l
  )

eff <- eff %>%
  mutate(
    village = village,
    gender = gender_hh,
    kiosk_use_frequency = kiosk_use_frequency,
    time_before_min = convert_time_to_minutes(time_fetch_before),
    time_now_min    = convert_time_to_minutes(time_fetch_now),
    time_change = time_change,
    borehole_functional = borehole_functional,
    borehole_breakdowns = borehole_breakdowns,
    breakdown_frequency = breakdown_frequency,
    place_to_wash_hands = place_to_wash_hands,
    water_available_at_hws = water_available_at_hws,
    soap_available_today = soap_available_today,
    hfkh_latrine_use = hfkh_latrine_use,
    latrine_functional_during_flood = latrine_functional_during_flood,
    girls_comfortable_night = girls_comfortable_using_latrine_night,
    women_safe_night_floods = women_latrine_use_night_and_floods,
    home_affected_by_flood = home_affected_by_flood_last_year,
    before_eating_handwash_often = before_eating_handwash_often
  )


# ----------------------------
# Additional Analysis: Water Source and Distance
# ----------------------------

# a) Plots for those using HFHK Water Source against distance
hfhk_sources <- c("HFHK Solar Borehole/Kiosk", "Piped HFHK Water")
hfhk_users <- rel %>%
  filter(primary_water_source %in% hfhk_sources)

p_hfhk_distance <- ggplot(hfhk_users, aes(x = distance_in_meters, fill = primary_water_source)) +
  geom_histogram(alpha = 0.7, position = "identity", bins = 20) +
  labs(title = "Distance Distribution for HFHK Water Source Users",
       x = "Distance (meters)", y = "Count", fill = "Water Source") +
  theme_minimal() +
  theme(legend.position = "bottom")

save_plot(p_hfhk_distance, "additional_a_hfhk_users_distance.png", w = 10, h = 6)
save_tbl(hfhk_users %>% select(village, gender, primary_water_source, distance_in_meters), 
         "additional_a_hfhk_users_distance_data.csv")

# b) Plots for those NOT using HFHK Water Source against distance
non_hfhk_sources <- c("Open wells in homesteads", "Protected public wells", 
                      "Rainwater Harvesting", "Others, specify")
non_hfhk_users <- rel %>%
  filter(primary_water_source %in% non_hfhk_sources | 
           str_detect(primary_water_other, "Open wells from the neighbourhood|From my Sons homestead"))

p_non_hfhk_distance <- ggplot(non_hfhk_users, aes(x = distance_in_meters, fill = primary_water_source)) +
  geom_histogram(alpha = 0.7, position = "identity", bins = 20) +
  labs(title = "Distance Distribution for Non-HFHK Water Source Users",
       x = "Distance (meters)", y = "Count", fill = "Water Source") +
  theme_minimal() +
  theme(legend.position = "bottom")

save_plot(p_non_hfhk_distance, "additional_b_non_hfhk_users_distance.png", w = 10, h = 6)
save_tbl(non_hfhk_users %>% select(village, gender, primary_water_source, primary_water_other, distance_in_meters), 
         "additional_b_non_hfhk_users_distance_data.csv")

# c) Distance to HFHK Water Source Endline per the Six villages - Stacked Bar Chart
distance_categories <- rel %>%
  mutate(distance_category = case_when(
    distance_in_meters < 500 ~ "<500m",
    distance_in_meters >= 500 & distance_in_meters <= 1000 ~ "500m-1km",
    distance_in_meters > 1000 ~ ">1km",
    TRUE ~ "Unknown"
  )) %>%
  filter(!is.na(distance_category) & distance_category != "Unknown")

distance_by_village <- distance_categories %>%
  group_by(village, distance_category) %>%
  summarise(n = n(), .groups = "drop_last") %>%
  mutate(pct = round(100 * n / sum(n), 1)) %>%
  ungroup()

p_distance_stacked <- ggplot(distance_by_village, 
                             aes(x = village, y = pct, fill = distance_category)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(title = "Distance to Water Source by Village",
       x = "Village", y = "Percentage", fill = "Distance Category") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

save_plot(p_distance_stacked, "additional_c_distance_by_village_stacked.png", w = 10, h = 6)
save_tbl(distance_by_village, "additional_c_distance_by_village_data.csv")

# d) Primary water source per village - multiple visualizations
water_source_by_village <- rel %>%
  group_by(village, primary_water_source) %>%
  summarise(n = n(), .groups = "drop_last") %>%
  mutate(pct = round(100 * n / sum(n), 1)) %>%
  ungroup()

# Table output
save_tbl(water_source_by_village, "additional_d_water_source_by_village_table.csv")

# Text file output
water_source_text <- c("Primary Water Source by Village Analysis",
                       "=========================================",
                       "",
                       "Summary of water source distribution across villages:",
                       "")

for(v in unique(water_source_by_village$village)) {
  village_data <- water_source_by_village %>% filter(village == v)
  water_source_text <- c(water_source_text, 
                         paste0("Village: ", v),
                         paste0("Total households: ", sum(village_data$n)),
                         "")
  
  for(i in 1:nrow(village_data)) {
    water_source_text <- c(water_source_text,
                           paste0("  - ", village_data$primary_water_source[i], 
                                  ": ", village_data$n[i], " (", village_data$pct[i], "%)"))
  }
  water_source_text <- c(water_source_text, "")
}

save_narrative(water_source_text, "additional_d_water_source_by_village_summary.txt")

# Stacked bar chart
p_water_source_stacked <- ggplot(water_source_by_village, 
                                 aes(x = village, y = pct, fill = primary_water_source)) +
  geom_col(position = "stack") +
  labs(title = "Water Source Distribution by Village",
       x = "Village", y = "Percentage", fill = "Water Source") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom")

save_plot(p_water_source_stacked, "additional_d_water_source_by_village_stacked.png", w = 12, h = 8)

# Creative visualization: Proportional pie charts per village
p_water_source_pie <- ggplot(water_source_by_village, 
                             aes(x = "", y = pct, fill = primary_water_source)) +
  geom_col(width = 1, position = "fill") +
  coord_polar("y") +
  facet_wrap(~ village) +
  labs(title = "Water Source Distribution by Village",
       fill = "Water Source") +
  theme_void() +
  theme(legend.position = "bottom")

save_plot(p_water_source_pie, "additional_d_water_source_by_village_pie.png", w = 12, h = 10)

log_msg("Additional analysis complete: water source and distance plots saved to {out_dir}")