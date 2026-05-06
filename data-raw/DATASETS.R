## code to prepare datasets goes here

# Create data directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}

# Figures_1_1_and_6_1

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

# Latinobarómetro

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

# Big 5

# Read the big5CR.csv file
file_big5 <- "data-raw/big5CR.csv"

# Extract filename without path and extension
filename_big5 <- tools::file_path_sans_ext(basename(file_big5))

# Read the csv file
big5CR <- readr::read_csv(file_big5)

big5CR <- dplyr::mutate(big5CR, across(EXT1:OPN10_E, \(x) dplyr::na_if(x, "NULL")))

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

equalize_mean_median <- function(Yi, tol = 1e-6, min_n = 50) {
  indices  <- seq_along(Yi)
  removed  <- integer(0)
  
  repeat {
    y   <- Yi[indices]
    gap <- abs(mean(y) - median(y))
    
    cat("n =", length(indices), "| gap =", round(gap, 8), "\n")
    
    if (gap <= tol || length(indices) <= min_n) break
    
    gaps <- sapply(seq_along(indices), function(j) {
      trial <- Yi[indices[-j]]
      abs(mean(trial) - median(trial))
    })
    
    worst   <- which.min(gaps)
    removed <- c(removed, indices[worst])
    indices <- indices[-worst]
  }
  
  list(
    selected = indices,
    removed  = removed,
    Yi_sym   = Yi[indices]
  )
}

big5CR <- dplyr::mutate(
  big5CR,
  Yi = rowSums(dplyr::across(EXT1:EXT10))
)

result  <- equalize_mean_median(big5CR$Yi, tol = 1e-6, min_n = 50)

Yi_sym  <- result$Yi_sym
selected <- result$selected
removed  <- result$removed

big5CR <- big5CR[selected, ]

big5CR$Yi <- NULL

# Save as dataset
save(big5CR, file = "data/big5CR.rda", compress = TRUE)

# GAD 7 mexican medical studenst

gad7 <- read.csv("data-raw/mexican_medical_students_mental_health_data.csv") |>
  dplyr::select(id, gad1:gad7)

gad7 <- gad7[complete.cases(gad7),]

save(gad7, file = "data/gad7.rda", compress = TRUE)

# Education conspiracy beliefs and misinformation

conspiracy <- read.csv("data-raw/Education_Conspiracy.csv", header = TRUE)

colnames(conspiracy)[colnames(conspiracy) == "DEMO1"] <- "Age"
colnames(conspiracy)[colnames(conspiracy) == "DEMO2"] <- "Gender"
colnames(conspiracy)[colnames(conspiracy) == "DEMO3"] <- "Ethnicity"
colnames(conspiracy)[colnames(conspiracy) == "DEMO4"] <- "Education"

{
  conspiracy$Education[conspiracy$Education == 7] <- 8
  conspiracy$Education[conspiracy$Education == 6] <- 7
  conspiracy$Education[conspiracy$Education == 5] <- 6
  conspiracy$Education[conspiracy$Education == 8] <- 5
  conspiracy$Education[conspiracy$Education == 5] <- 4
  conspiracy$Education[conspiracy$Education == 6] <- 5
  conspiracy$Education[conspiracy$Education == 7] <- 6
  conspiracy$Education[conspiracy$Education == 1] <- 2
  conspiracy$Education[conspiracy$Education == 6] <- 5
  conspiracy$Education <- conspiracy$Education - 1
}

conspiracy$Education <- as.factor(conspiracy$Education)

conspiracy$EducationText <- factor(
  ifelse(
    conspiracy$Education == 1, "High School or Less",
    ifelse(
      conspiracy$Education == 2, "Certificate/Diploma",
      ifelse(
        conspiracy$Education == 3, "Bachelors",
        ifelse(conspiracy$Education == 4, "Masters/PhD", NA)
      )
    )
  ),
  levels = c("High School or Less", "Certificate/Diploma", "Bachelors", "Masters/PhD") # Specify the order
)

conspiracy$Grandiose_Narcissism <- ifelse(conspiracy$Grandiose_Narcissism > 3.3, 3.3, conspiracy$Grandiose_Narcissism)

conspiracy <- conspiracy |>
  dplyr::select(
    # Demographics
    Age,               # DEMO1
    Gender,            # DEMO2
    Ethnicity,         # DEMO3
    Education,         # DEMO4 (factor, 1–4)
    EducationText,     # labelled version of Education
    Income,            # DEMO5 equivalent (numeric)
    PoliticalOrientation, PolLeftRight, PolLeftMiddleRight,
    
    # Outcome / predictor total scores
    CMQtotal,
    GCBStotal,
    NeedForUniqueness,
    SECStotal,
    DichotomousThinking,
    NeedtoBelong,
    SDOtotal,
    CFItotal,
    SAILtotal,
    LOCint, LOCext,
    CRTmean,
    
    # FFNI total and subscales
    Total_FFNI,
    Grandiose_Narcissism,   # already Winsorized at ±3.3 SD per script
    Vulnerable_Narcissism,
    Acclaim_Seeking, Arrogance, Authoritativeness, Distrust,
    Entitlement, Exhibitionism, Exploitativeness, Grandiose_Fantasies,
    Indifference, Lack_of_Empathy, Manipulativeness, Need_for_Admiration,
    Reactive_Anger, Shame, Thrill_Seeking
  )

save(conspiracy, file = "data/conspiracy.rda", compress = TRUE)

# Runners data

runners <- readxl::read_excel("data-raw/Figure 8.1.xlsx")

save(runners, file = "data/runners.rda", compress = TRUE)
