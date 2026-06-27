#' Percentil escolar con 18 errores de captura
#'
#' Muestra simulada de 300 estudiantes con su percentil escolar y su
#' puntaje en la prueba verbal SAT. La relacion verdadera entre ambas
#' variables es positiva. Para ilustrar el impacto de los valores
#' atipicos, en 18 registros (los de los estudiantes con mayor SAT) se
#' introdujo un error de captura: el percentil se digito con un valor
#' de un solo digito (1-5). La columna \code{Percentilrev} guarda el
#' percentil alterado y \code{atipico} marca las observaciones afectadas.
#' Sirve para mostrar como un grupo pequeno de valores atipicos puede
#' invertir la pendiente de un modelo y como los indices de deteccion
#' (apalancamiento, residuos estudentizados, distancia de Cooks) se
#' dejan enganar por el enmascaramiento.
#'
#' @format Un data frame con 300 filas y 5 columnas:
#' \describe{
#'   \item{Estudiante}{Identificador del estudiante (1-300).}
#'   \item{Percentil}{Percentil escolar correcto (enteros entre 82 y 98).}
#'   \item{SAT}{Puntaje de la prueba verbal SAT (recortado a 20-80).}
#'   \item{Percentilrev}{Percentil con 18 valores mal capturados
#'     (enteros 1-5 en los registros de mayor SAT).}
#'   \item{atipico}{Indicador: \code{1} si el registro fue alterado,
#'     \code{0} en caso contrario.}
#' }
#' @source Datos simulados con fines didacticos.
#' @keywords datasets
#' @name sat_percentil
NULL
