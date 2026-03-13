#' Proportional Reduction in Error (PRE)
#'
#' Calculates the Proportional Reduction in Error (PRE) between two models.
#' PRE measures the improvement in fit of model A compared to model C.
#'
#' @param modelo_c A fitted model object (e.g., from \code{lm}) representing the baseline model.
#' @param modelo_a A fitted model object (e.g., from \code{lm}) representing the alternative model.
#' @return A numeric value representing the PRE statistic.
#' @details PRE is calculated as (ERROR_C - ERROR_A) / ERROR_C, where ERROR_C and ERROR_A
#' are the sum of squared residuals for models C and A, respectively.
#' A positive PRE indicates that model A fits better than model C.
#' @examples
#' # Example usage with linear models
#' # model_c <- lm(y ~ 1, data = mydata)
#' # model_a <- lm(y ~ x, data = mydata)
#' # PRE(model_c, model_a)
#' @export
PRE <- function(modelo_c, modelo_a) {
  if (any(is.na(modelo_c$coefficients))) {
    stop("modelo_c contains aliased (NA) coefficients")
  }
  if (any(is.na(modelo_a$coefficients))) {
    stop("modelo_a contains aliased (NA) coefficients")
  }
  ERROR_C <- sum((modelo_c$residuals)^2)
  ERROR_A <- sum((modelo_a$residuals)^2)
  PRE_value <- (ERROR_C - ERROR_A) / ERROR_C
  return(PRE_value)
}
