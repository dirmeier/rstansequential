#' @title Wine tasting data
#'
#' @description A wine tasting data set from a factorial experiment where
#'  different judges tasted wine and assessed its bitterness
#'
#' @format The data set has the following variables
#' \describe{
#'  \item{rating}{ordinal responmse variable of 5 levels. Scale ranges from
#'   least bitter to most bitter.}
#'  \item{temperature}{factorial variable describing temperature during crushing
#'   of the grapes}
#'  \item{contact}{factorial variable determining if there was contact of the
#'  juice with the skin when the grapes were crushed}
#'  \item{bottle}{factor that represents number of the bottle}
#'  \item{judge}{factor that represents the person who drank the wine}
#' }
#'
#' @usage
#'  data(wine)
#'
#' @source
#'  Randall, JH (1989), The Analysis of Sensory Data by
#'   Generalized Linear Model, \emph{Biometrical Journal, 31(7)}
#'
#' Tutz, G, and Hennevogl, W (1991), Random effects in ordinal regression
#'  models, \emph{Computational Statistics & Data Analysis, 22(5)}
#'
"wine"
