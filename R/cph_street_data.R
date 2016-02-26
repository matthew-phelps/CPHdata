#' Cholera cases by week by street - Copenhagen 1853.
#'
#' A dataset of the weekly record of new cholera cases on each street
#' in Copenhagen in the 1853 epidemic. Dataset also includs hospitals
#' and streets from outside the city walls (i.e. Noerrebro). Danish letters
#' have been turned into Engilsh letters: oe, ae, aa. Data was manually entered
#' by author from source report. Please contact author with any errors or typos
#'
#'
#' @format A data frame with 3456 rows and 9 variables:
#' \describe{
#'   \item{street}{Street name according to source report.
#'   Hospitals are given their own street name, not the name of the street
#'   that the hospital is physically located on}
#'   \item{quarter}{Name of the quarter (known in American english as
#'   "neigborhood"), that street is located in. Hospitals are given their own
#'    quarter name, not the name of the quarter that the hospital is
#'    physically located in}
#'   \item{Census.name}{Name of street according to  1855 census documents}
#'   \item{male.sick}{Number of males recorded with cholera}
#'   \item{female.sick}{Number of females recorded with cholera}
#'   \item{male.dead}{Of those men who were sick, this is the number that died
#'   due to cholera}
#'   \item{female.dead}{Of those women who were sick, this is the number that
#'   died due to cholera}
#'   \item{start.date}{Date of the beginig of the week that the row pertains to}
#'   \item{startday.index}{The day number, as indexed fromt he beginig of the
#'   epidemic, of the week that the row pertains to}
#' }
#' @source {"Beretning om Cholera-Epidemien I Kjobenhavn"}
"cph_street_data"