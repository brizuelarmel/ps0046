## code to prepare datasets goes here

# Create data directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}

# Read the Figures_1_1_and_6_1.xlsx file
file <- "data-raw/Figures_1_1_and_6_1.xlsx"

# Extract filename without path and extension
filename <- tools::file_path_sans_ext(basename(file))

# Read the xlsx file
Figures_1_1_and_6_1 <- readxl::read_excel(file)

# Add categorical binary variable (Group R: Rich economies, Group B: Not so rich economies)
group_r_countries <- c("Australia", "Belgium", "Canada", "Croatia", "Denmark", "Finland", "France",
                       "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Israel", "Italy",
                       "Japan", "Netherlands", "Norway", "Poland", "Portugal", "Spain", "Sweden",
                       "Switzerland", "United Kingdom", "United States")
Figures_1_1_and_6_1$Group <- ifelse(Figures_1_1_and_6_1$Country %in% group_r_countries, "R", "NSR")

# Save as dataset
save(data = Figures_1_1_and_6_1, file = "data/Figures_1_1_and_6_1.rda", compress = TRUE)

# Read the Latinobarometro_2023_Costa_Rica_Spss_esp_v1.sav file
file_spss <- "data-raw/Latinobarometro_2023_Costa_Rica_Spss_esp_v1.sav"

# Extract filename without path and extension
filename_spss <- tools::file_path_sans_ext(basename(file_spss))

# Read the SPSS file
Latinobarometro_2023_Costa_Rica_Spss_esp_v1 <- haven::read_spss(file_spss)

# Remove labels
Latinobarometro_2023_Costa_Rica_Spss_esp_v1 <- haven::zap_labels(Latinobarometro_2023_Costa_Rica_Spss_esp_v1)

# Save as dataset
save(Latinobarometro_2023_Costa_Rica_Spss_esp_v1, file = "data/Latinobarometro_2023_Costa_Rica_Spss_esp_v1.rda", compress = TRUE)

# Read the big5CR.csv file
file_big5 <- "data-raw/big5CR.csv"

# Extract filename without path and extension
filename_big5 <- tools::file_path_sans_ext(basename(file_big5))

# Read the csv file
big5CR <- readr::read_csv(file_big5)

big5CR <- mutate(big5CR, across(EXT1:OPN10_E, \(x) dplyr::na_if(x, "NULL")))

big5CR <- dplyr::mutate(big5CR, across(EXT1:OPN10_E, as.integer))

# Reverse-score inverse items (1=Disagree, 3=Neutral, 5=Agree)
# Reverse coding: 1->5, 2->4, 3->3, 4->2, 5->1
# Note: Data is read as character, so recode uses character values, then convert to numeric
# Values of 0 are treated as NA
big5CR <- dplyr::mutate(
  big5CR,
  across(
    c(EXT2, EXT4, EXT6, EXT8, EXT10, EST2, EST4, AGR1, AGR3, AGR5, AGR7, CSN2, CSN4, CSN6, CSN8, OPN2, OPN4, OPN6),
    \(x) dplyr::recode_values(x, 1 ~ 5, 2 ~ 4, 3 ~ 3, 4 ~ 2, 5 ~ 1, 0 ~ NA)))

big5CR <- tidyr::drop_na(big5CR, EXT1:OPN10_E)

# Save as dataset
save(big5CR, file = "data/big5CR.rda", compress = TRUE)
