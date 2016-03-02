#' Datasets on cholera outbreaks in 19th century Denmark.
#'
#' This package contains two datasets:
#' \itemize{
#' \item \code{\link{cph_street_data}} - Daily cholera morbidity and mortality
#' \item \code{\link{cph_quarter_data}} - Weekly morbidity & mortality counts
#' at the quarter (neighborhood) level
#' }
#' The data come from a Danish report compiled in 1854 by a local doctor. The
#' Danish library listing for the report, along with a link to an online version
#' is available online at
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
#'   hospital (i.e duplicated). For example, it is unkown if a sick person living on
#'   Gothersgade and is subsequently sent to a hospital is recorded as a case for
#'   both the hospital and Gothersgade. For this reason I have excluded all
#'   hospital data from the aggregations to the quarter-level dataset.
#'
#' @section Datasets:
#' \itemize{
#' \item \code{\link{cph_street_data}}
#' \item \code{\link{cph_quarter_data}}
#' }
#'
#' @docType package
#' @name CholeraDataDK
NULL
#> NULL