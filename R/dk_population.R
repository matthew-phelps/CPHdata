#' Population at the town level for selected Danish towns
#'
#' A dataset containing the population of selected Danish towns during the
#' period they had cholera epidemics. Data for years ending in "0" or "5" come
#' from census data. any years inbetween were imputed assuming a linear trend
#' between the two census data points. Census data comes via
#' danishfamilysearch.com
#'
#'
#' @format A data frame with 10 rows and 3 variables:
#' \describe{
#'   \item{\bold{city}}{character vector of the name of the city/town.}
#'   \item{\bold{year}}{Integer vector of the year the population data is for.}
#'   \item{\bold{pop}}{Numeric vector of the census population or the estimated
#'   population.}
#'   }
#' @source {Danish census data via danishfamilysearch.com. Data entered by Mads Perner and Matthew Phelps}
"dk_population"
