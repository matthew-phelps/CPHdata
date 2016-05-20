#' Hospital cholera admissions and release data in CPH, 1853
#' 
#' A dataset containing cholera admission dates and dates of either death or 
#' release from hospital from four hospitals within Copenhagen in 1853.
#' 
#' 
#' @format A data frame with 1735 rows and 5 variables: 
#' \describe{ 
#'   \item{\bold{case_num}}{Numeric value describing the order of admission at
#'   the hospital} \item{\bold{admission}}{Date of admission to hospital} 
#'   \item{\bold{release}}{Date of release from hospital if the patient
#'   survived. If patient died, value = "NA"}
#'   \item{\bold{death}}{Date of patient death. If patient survived, value =
#'   "NA"}
#'   \item{\bold{hospital}}{Character string of the name of the admitting
#'   hospital}
#'   }
#' @source {"Københavns Stadsarkiv, Den overordentlige sundhedskommission, Koleraepidemien 1853, Patienprotokol for kolerahospital"}
"cph_hosp_stay_data"