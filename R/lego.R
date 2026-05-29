#' Impact of LEGO training on mental rotation in children
#'
#' Data from the BLOCS study (McDougal et al., 2024), which assessed the causal
#' impact of LEGO construction training on spatial and mathematical skills in
#' 7-9-year-old children. The study used a pretest-posttest design with random
#' assignment to three between-participants conditions: physical LEGO, digital
#' LEGO, and an active control (crafts). Training consisted of 12 thirty-minute
#' sessions over 6 weeks (2 sessions per week). Mental rotation was measured
#' with a task adapted from Gilligan et al. (2019), in which each participant
#' identified which of two mirror-image animals matched a target image rotated
#' by a fixed number of degrees (45, 90, 120, 150, or 180).
#'
#' @format A data frame with 272 rows and 6 columns:
#' \describe{
#'   \item{ID}{Participant identifier code.}
#'   \item{Condition}{Training condition: \code{"Physical Lego"},
#'     \code{"Digital Lego"}, or \code{"Control"}.}
#'   \item{Sessions_Attended}{Number of training sessions completed (maximum
#'     12). Analyses exclude participants who completed fewer than 9 sessions
#'     (\code{Sessions_Attended > 8}).}
#'   \item{Age}{Participant age in years.}
#'   \item{X1_Mental_Rotation}{Pretest: raw score on the Mental Rotation task
#'     (0-40). Covariate in the ANCOVA.}
#'   \item{X2_Mental_Rotation}{Posttest: raw score on the Mental Rotation task
#'     (0-40). Dependent variable in the ANCOVA.}
#' }
#' @source McDougal, E., Silverstein, P., Treleaven, O., Jerrom, L.,
#'   Gilligan-Lee, K., Gilmore, C., & Farran, E. K. (2024). Assessing the
#'   impact of LEGO\eqn{^\circledR} construction training on spatial and
#'   mathematical skills. \emph{Developmental Science}, \emph{27}, e13432.
#'   \doi{10.1111/desc.13432}
#' @keywords datasets
#' @name lego
NULL
