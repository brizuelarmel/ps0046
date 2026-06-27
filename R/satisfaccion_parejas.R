#' Diseno mixto: satisfaccion marital en parejas
#'
#' Dieciseis parejas casadas califican su satisfaccion marital (1-9).
#' \code{Gender} (esposo \code{"H"} o esposa \code{"M"}) varia
#' \emph{dentro} de la pareja, mientras que \code{MarriageLength}
#' (15 o 30 anos) y \code{Children} (\code{"No"} o \code{"Yes"}) varian
#' \emph{entre} parejas. Los datos ya estan en formato largo: cada
#' pareja aporta dos observaciones. Diseno mixto intra-entre, tipico
#' para introducir modelos multinivel.
#'
#' @format Un data frame con 32 filas y 5 columnas:
#' \describe{
#'   \item{Couple}{Identificador de la pareja (1-16).}
#'   \item{Gender}{Factor con dos niveles: \code{"H"} (esposo) y
#'     \code{"M"} (esposa).}
#'   \item{MarriageLength}{Antiguedad del matrimonio en anos (15 o 30).}
#'   \item{Children}{Factor con dos niveles: \code{"No"} (sin hijos) y
#'     \code{"Yes"} (con hijos).}
#'   \item{Satisfaction}{Puntaje de satisfaccion marital (1-9).}
#' }
#' @source Datos simulados con fines didacticos.
#' @keywords datasets
#' @name satisfaccion_parejas
NULL
