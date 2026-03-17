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
data <- readxl::read_excel(file)

# Add categorical binary variable (Group R: Rich economies, Group B: Not so rich economies)
group_r_countries <- c("Australia", "Belgium", "Canada", "Croatia", "Denmark", "Finland", "France",
                       "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Israel", "Italy",
                       "Japan", "Netherlands", "Norway", "Poland", "Portugal", "Spain", "Sweden",
                       "Switzerland", "United Kingdom", "United States")
data$Group <- ifelse(data$Country %in% group_r_countries, "R", "NSR")

# Save as dataset
save(Figures_1_1_and_6_1 = data, file = "data/Figures_1_1_and_6_1.rda", compress = TRUE)

# Read the Latinobarometro_2023_Costa_Rica_Spss_esp_v1.sav file
file_spss <- "data-raw/Latinobarometro_2023_Costa_Rica_Spss_esp_v1.sav"

# Extract filename without path and extension
filename_spss <- tools::file_path_sans_ext(basename(file_spss))

# Read the SPSS file
Latinobarometro_2023_Costa_Rica_Spss_esp_v1 <- haven::read_spss(file_spss)

# Save as dataset
save(Latinobarometro_2023_Costa_Rica_Spss_esp_v1, file = "data/Latinobarometro_2023_Costa_Rica_Spss_esp_v1.rda", compress = TRUE)
