#' Daily incidence of cholera, 19th century Denmark.
#'
#' Data from all known sources that record daily morbidity and mortality due to
#' cholera from 19th century Denmark. Cholera epidemics occurred in three years
#' in Denmark, 1850, 1853 and 1857. Both 1850 and 1857 were isolated outbreaks
#' in one location. In 1853 cholera was widespread in towns across the nation.
#' For all locations daily morbidity and mortality counts were recorded.
#'
#'
#' @format A data frame with 273 rows and 11 variables:
#' \describe{
#'   \item{{\bold{date}}}{Vector of date values}
#'   \item{{\bold{day_index}}}{Integer vector of the day number, as indexed
#'   from the beginig of the epidemic}
#'   \item{{\bold{cases}}}{Integer vector of Number of people recorded with
#'   cholera}
#'   \item{{\bold{deaths}}}{Integer vector recording, of those that were
#'   sick from cholera, this is the number that died}

#'   \item{{\bold{city}}}{Name of town or city}
#'   \item{{\bold{cases_norm}}}{Numeric vector of the normalized case
#'   incidence rate, per 10,000 people}
#'   \item{{\bold{deaths_norm}}}{Numeric vector of the normalized death
#'   rate due to cholera, per 10,000 people}
#'   \item{{\bold{day_norm}}}{Numeric vector of the day index number,
#'   normalized over the total length of the epidemic in that locaiton. This
#'   number shows what percentage of total time of the epidemic has already
#'   passed}
#'
#' }
#' @source {Various}
"cholera_daily_data"
