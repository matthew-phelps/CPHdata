#' Daily cholera data at the city-level in Copenhagen, 1853.
#'
#' A dataset of the daily cholera cases and deaths in Copenhagen in 1853. It is likely that the dataset contains data from outside the city walls at the time (i.e. Noerrebro, Vesterbro and other). It also likely includes data from hospitals, but there is a possibility that some records were doubly recorded at both the street on which the patient resides, and the hospital in which they were admitted. The author of the original report indicated that he tried to remove duplicates, but that the recording process was messy.
#'
#'
#' @format A data frame with 112 rows and 5 variables:
#' \describe{
#'   \item{\code{\bold{month}}}{Month as a numeric value}
#'   \item{\code{\bold{day}}}{Numeric value for the day of the month for the record}
#'   \item{\code{\bold{day.index}}}{The day number, as indexed from the beginig
#'   of the epidemic}
#'   \item{\code{\bold{cholera.cases}}}{Number of people recorded with cholera}
#'   \item{\code{\bold{cholera.deaths}}}{Of those that were sick from cholera,
#'   this is the number that died}
#' }
#' @source {"Beretning om Cholera-Epidemien I Kjobenhavn"}
"cph_citywide_data"
