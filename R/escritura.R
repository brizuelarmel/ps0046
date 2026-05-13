#' Datos de escritura en secundaria
#'
#' Datos simulados de un estudio sobre factores asociados a las habilidades
#' de escritura en estudiantes de secundaria. Setenta y cuatro estudiantes
#' participaron en un programa de escritura de un semestre. A cada estudiante
#' se le asigno una de tres condiciones de retroalimentacion sobre sus textos.
#' Al finalizar el semestre, todos realizaron una prueba estandarizada de
#' escritura (puntuacion de 0 a 100). Tambien se registro el grado escolar de
#' cada estudiante.
#'
#' @format Un data frame con 74 filas y 3 columnas:
#' \describe{
#'   \item{escritura}{Puntuacion en la prueba estandarizada de escritura (0-100).}
#'   \item{retroalimentacion}{Factor con tres niveles: \code{"Sin_retro"} (los
#'     estudiantes escriben sin recibir retroalimentacion externa),
#'     \code{"Profesor"} (reciben comentarios escritos del profesor sobre un
#'     borrador) y \code{"Pares"} (intercambian borradores con companeros y
#'     reciben retroalimentacion estructurada mediante una rubrica).}
#'   \item{nivel}{Factor ordenado con tres niveles: \code{"9"}, \code{"10"} y
#'     \code{"11"}, que indican el grado escolar del estudiante.}
#' }
#' @source Datos simulados con fines didacticos.
#' @keywords datasets
#' @name escritura
NULL
