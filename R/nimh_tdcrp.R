#' Remision en depresion mayor segun tratamiento (Elkin et al., 1989)
#'
#' Subconjunto de datos del estudio multicentrico NIMH Treatment of Depression
#' Collaborative Research Program (TDCRP) reportado por Elkin, Shea, Watkins,
#' Imber, Sotsky, Collins y colaboradores (1989). El estudio comparo cuatro
#' condiciones de tratamiento (terapia cognitivo-conductual, terapia
#' interpersonal, imipramina y placebo) en pacientes con depression mayor. La
#' variable de respuesta clave fue si el paciente alcanzo la remision al final
#' del tratamiento. Para esta clase se trabaja solo con dos condiciones
#' (CBT y placebo) y con tasas de remision cercanas a las reportadas en el
#' estudio original.
#'
#' @format Un data frame con 200 filas y 3 columnas:
#' \describe{
#'   \item{paciente}{Identificador numerico del paciente (1-200).}
#'   \item{tratamiento}{Factor con dos niveles: \code{"Placebo"} (control) y
#'     \code{"CBT"} (terapia cognitivo-conductual).}
#'   \item{remitio}{Variable respuesta binaria: \code{0} = no alcanzo la
#'     remision, \code{1} = si alcanzo la remision.}
#' }
#' @source Elkin, I., Shea, M. T., Watkins, J. T., Imber, S. D., Sotsky, S. M.,
#'   Collins, J. F., ... & Parloff, M. B. (1989). National Institute of Mental
#'   Health Treatment of Depression Collaborative Research Program: General
#'   effectiveness of treatments. \emph{Archives of General Psychiatry},
#'   \emph{46}(11), 971-982. \doi{10.1001/archpsyc.1989.01810110013002}
#' @keywords datasets
#' @name nimh_tdcrp
NULL
