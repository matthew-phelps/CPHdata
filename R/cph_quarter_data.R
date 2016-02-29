#' Cholera cases by week by quarter - Copenhagen 1853.
#'
#' A dataset of the weekly record of new cholera cases in each quarter (also
#' called neighborhoods) in Copenhagen in the 1853 epidemic. Dataset also
#' includs hospitals and quarters from outside the city walls (i.e. Noerrebro).
#' Danish letters have been turned into Engilsh letters: oe, ae, aa.
#' Data was manually entered by author from source report. Please contact
#' author with any errors or typos
#'
#'
#' @format A data frame with 416 rows and 17 variables:
#' \describe{
#'   \item{quarter}{Name of the quarter (known in American english as
#'   "neigborhood"), that street is located in. Hospitals are given their own
#'    quarter name, not the name of the quarter that the hospital is
#'    physically located in.}
#'   \item{start.date}{Date of the beginig of the week that the row pertains to.}
#'   \item{startday.index}{The day number, as indexed fromt he beginig of the
#'   epidemic, of the week that the row pertains to.}
#'   \item{mensick.week}{Number of males recorded with cholera in the quarter
#'   during the specified week.}
#'   \item{mendead.week}{Of those men who were sick, this is the number that died
#'   due to cholera during the specified week.}
#'   \item{womensick.week}{Number of females recorded with cholera in the quarter
#'   during the specified week.}
#'   \item{womendead.week}{Of those women who were sick, this is the number that died
#'   due to cholera during the specified week.}
#'   \item{sick.total.week}{Total number of people recorded with cholera in the quarter
#'   during the specified week.}
#'   \item{dead.total.week}{Total number of people who died due to cholera in the quarter
#'   during the specified week.}
#'   \item{est.pop.1853}{Estimated population for the quarter. Estimate made by
#'   estimating yearly population change between 1850 and 1855 and adding 3 years
#'   of this to the 1850 census data for the quarter}
#'   \item{normal.incidence}{Weekly incidence rate per 1000 people for each quarter normalized using
#'  est.pop.1853}
#'   \item{normal.mortality}{Weekly mortality rate per 1000 people for each
#'  quarter normalized using est.pop.1853 population data}
#'   \item{week.id}{Number of weeks since the begening of the epidemics in
#'   Copenhagen}
#'   \item{quarterID}{Numeric ID assigned to each quarter}
#'   \item{cum.sick}{Number of cumulative infections, inclusive of the
#'   current week}
#'   \item{S}{Total number of people susceptible at that week. Equals cum.sick -
#'   recovered}
#'   \item{R}{Cumulative number of recovered people at that week. All persons
#'   are assumed to recover in the time-steps following their infection. They only
#'   stay in the infectious category for 1 time-step.}



#' }
#' @source {"Beretning om Cholera-Epidemien I Kjobenhavn"}
"cph_quarter_data"
