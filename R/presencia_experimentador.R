#' Diseno cruzado: presencia del experimentador
#'
#' Ocho participantes resuelven una tarea en dos condiciones: con el
#' experimentador \code{"Absent"} y con el experimentador \code{"Present"}.
#' El factor \code{Experimenter} varia \emph{dentro} de cada participante
#' (medidas repetidas). Los datos ya estan en formato largo: cada
#' participante aporta dos observaciones. Sirve para ilustrar como
#' ignorar la no-independencia intra-sujeto distorsiona las pruebas
#' de hipotesis.
#'
#' @format Un data frame con 16 filas y 3 columnas:
#' \describe{
#'   \item{Subject}{Identificador del participante (1-8).}
#'   \item{Experimenter}{Factor con dos niveles: \code{"Absent"} y
#'     \code{"Present"}.}
#'   \item{Score}{Puntaje de desempeno en la tarea.}
#' }
#' @source Datos simulados con fines didacticos.
#' @keywords datasets
#' @name presencia_experimentador
NULL
