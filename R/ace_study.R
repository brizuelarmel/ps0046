#' Experiencias adversas en la infancia y depresion adulta (Felitti et al., 1998)
#'
#' Subconjunto de datos del Adverse Childhood Experiences (ACE) Study
#' reportado por Felitti, Anda, Nordenberg, Edwards, Koss, Marks y
#' colaboradores (1998). El estudio original recluto mas de 17 000 adultos y
#' midio cuantas experiencias adversas sufrieron antes de los 18 anos
#' (abuso, negligencia, disfuncion familiar) usando el ACE score (0-10).
#' Los autores encontraron una relacion dosis-respuesta pronunciada entre el
#' ACE score y problemas de salud mental en la adultez, incluyendo
#' depresion. Los datos de esta clase simulan esa misma relacion
#' dosis-respuesta con un tamano muestral reducido para fines didacticos.
#'
#' @format Un data frame con 500 filas y 3 columnas:
#' \describe{
#'   \item{participante}{Identificador numerico del participante (1-500).}
#'   \item{ace}{Puntaje de experiencias adversas en la infancia (0-10).}
#'   \item{depresion}{Variable respuesta binaria: \code{0} = no presenta
#'     depresion, \code{1} = si presenta depresion.}
#' }
#' @source Felitti, V. J., Anda, R. F., Nordenberg, D., Edwards, V., Koss,
#'   M. P., Marks, J. S., ... & Williamson, D. F. (1998). Relationship of
#'   childhood abuse and household dysfunction to many of the leading causes
#'   of death in adults: The Adverse Childhood Experiences (ACE) Study.
#'   \emph{American Journal of Preventive Medicine}, \emph{14}(4), 245-258.
#'   \doi{10.1016/S0749-3797(98)00017-8}
#' @keywords datasets
#' @name ace_study
NULL
