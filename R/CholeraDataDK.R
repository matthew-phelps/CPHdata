#' Datasets on cholera outbreaks in 19th century Denmark.
#'
#' This package contains three datasets:
#' \itemize{
#'  \item \code{\link{cph_citywide_data}} {Daily cholera morbidity and mortality}
#'  \item \code{\link{cph_street_data}} {Weekly morbidity & mortality counts
#'  at the street level}
#'  \item \code{\link{cph_quarter_data}} {Weekly morbidity & mortality counts
#'  aggregated to the quarter (neighborhood) level.}
#'  \item \code{\link{korsoer_age_gender}} {Morbiditiy and mortality from
#'  cholera in Korsoer in 1857 broken down by age and gender.
#'  aggregated to the quarter (neighborhood) level.}
#'  \item \code{\link{korsoer_age_gender}} {Morbiditiy and mortality from
#'  cholera in Korsoer in 1857 broken down by age and gender}
#'  \item \code{\link{korsoer_age_gender_pop}} {Population of Korsoer broken
#'  down by age and gender}
#' }
#' Two datasets, \code{cph_citywide_data} and \code{cph_street_data} are found
#' in Danish report compiled in 1854 by a local doctor. The
#' \code{cph_quarter_data} dataset is derived from the \code{cph_street_data}
#' dataset by aggregation. The Danish library listing for the report, along with
#' a link to an online version is available online at
#' \url{https://books.google.dk/books?id=zxA1AAAAIAAJ&redir_esc=y} . The data
#' were digitized by the author. There were a couple records that were
#' unreadable due to the way the online version was scanned, but the data should
#' be available in the original hard copy.
#'
#'
#' @section A note about hospital records: Cholera patients where recorded at
#'   the street where they reside by groups of doctors that moved around the
#'   town looking for cholera patients. Doctors would then send people with
#'   cholera symptoms to one of the hospitals around the city. At the hospital
#'   the patients were recorded, and their street address was recorded. It is
#'   unknown patients like these were recorded at both the street and the
#'   hospital (i.e duplicated). For example, it is unkown if a sick person
#'   living on Gothersgade and is subsequently sent to a hospital is recorded as
#'   a case for both the hospital and Gothersgade. For this reason I have
#'   excluded all hospital data from the aggregations to the quarter-level
#'   dataset, but they are inlcuded in the citywide daily data.
#'
#' @section Datasets:
#' \itemize{
#' \item \code{\link{cph_citywide_data}}
#' \item \code{\link{cph_street_data}}
#' \item \code{\link{cph_quarter_data}}
#' }
#'
#' @docType package
#' @name CholeraDataDK
NULL
#> NULL
