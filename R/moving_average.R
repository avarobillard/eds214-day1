#' Title: Moving Average
#'
#' @param focal_date Date to start with 
#' @param dates Vector (length n) of dates 
#' @param conc Vector (length n) of nutrient concentrations 
#' @param win_size_wks Window size in weeks
#'
#' @returns Mean nutrient concentration for the specified date and window size
#' @export
#'
#' @examples moving_average(focal_date = as.Date("1989-01-01"), dates = (df$dates), conc = (df$calcium), win_size_wks = 9)
moving_average <- function(focal_date, dates, conc, win_size_wks) {
  # Which dates are in the window?
  is_in_window <- (dates > focal_date - (win_size_wks / 2) * 7) &
    (dates < focal_date + (win_size_wks / 2) * 7)
  # Find the associated concentrations
  window_conc <- conc[is_in_window]
  # Calculate the mean
  result <- mean(window_conc, na.rm = TRUE)
  
  
  return(result)
}
