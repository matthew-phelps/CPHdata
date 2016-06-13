#' Cholera case records Denmark, 1853.
#'
#' A dataset of cholera cases from two small Danish towns of Nykoebing and
#' Frederikshavn in 1853
#'
#'
#' @format A data frame with 254 rows and 8 variables:
#' \describe{
#'   \item{\code{\bold{admission_order}}}{Vector of integer values describing
#'   the order in which cases were recorded - but does not seemingly correspond
#'   to any real-life value}
#'   \item{\code{\bold{date_admission}}}{Vector of date values recording the
#'   date that the patient was diagnosed}
#'   \item{\code{\bold{age}}}{Numeric vector of age of cases}
#'   \item{\code{\bold{dicharge_date}}}{Vector of dates of discharge from the
#'   hospital, presumably recovered. NA values mean either patient died or date
#'   was not recorded}
#'   \item{\code{\bold{death_date}}}{Vector of dates of death of patient, if
#'   applicable. NA values mean either patient was discharged or date was not
#'   recorded}
#'   \item{\code{\bold{outcome}}}{Integer vector of possible patient outcomes.
#'    1 = death & 0 = discharged}
#'   \item{\code{\bold{event}}}{Vector of dates on which the outcome occured.
#'     I.e., the date the patient either died or was discharged}
#'   \item{\code{\bold{location}}}{Location of hospital - usually the town
#'      name}
#' }
#' @source {Various handwritten archival records from local doctors}
"case_records"
