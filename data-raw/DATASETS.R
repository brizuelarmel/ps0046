## code to prepare datasets goes here

# Create data directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}

# Get all xlsx files in data-raw directory
xlsx_files <- list.files("data-raw", pattern = "\\.xlsx$", full.names = TRUE)

for (file in xlsx_files) {
  # Extract filename without path and extension
  filename <- tools::file_path_sans_ext(basename(file))
  
  # Clean name: replace spaces and special characters with underscores
  clean_name <- gsub("[^a-zA-Z0-9]", "_", filename)
  
  # Read the xlsx file
  data <- readxl::read_excel(file)

  # Add categorical binary variable (Group R: Rich economies, Group B: Not so rich economies)
  group_r_countries <- c("Australia", "Belgium", "Canada", "Croatia", "Denmark", "Finland", "France",
                         "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Israel", "Italy",
                         "Japan", "Netherlands", "Norway", "Poland", "Portugal", "Spain", "Sweden",
                         "Switzerland", "United Kingdom", "United States")
  data$Group <- ifelse(data$Country %in% group_r_countries, "R", "NSR")

  # Assign to clean name in environment
  assign(clean_name, data)
  
  # Save as dataset
  save(list = clean_name, file = file.path("data", paste0(clean_name, ".rda")), compress = TRUE)
}
