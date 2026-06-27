#' Predictores aleatorios (ejemplo de parsimonia)
#'
#' Matriz de 44 predictores aleatorios con distribucion N(0, 1) y 45
#' observaciones. Se usa para ilustrar que un modelo con tantos predictores
#' como observaciones ajusta perfectamente los datos (R^2 = 1) sin aportar
#' informacion real: cualquier asociacion con la respuesta es espuria.
#' El tamano muestral (n = 45) corresponde al numero de paises en
#' \code{\link{Figures_1_1_and_6_1}}.
#'
#' @format Un data frame con 45 filas y 44 columnas:
#' \describe{
#'   \item{V1, V2, ..., V44}{Cada columna es una variable aleatoria
#'     independiente con distribucion N(0, 1).}
#' }
#' @source Datos simulados con fines didacticos.
#' @keywords datasets
#' @name aleatorios
NULL
