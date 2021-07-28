#' Theme to match the looks of r2dii packages
#'
#' "There is a possibility that it might cause problems if you’ve used custom
#' HTML, so you can force it to stay with v3 with version = 3." --
#' https://mastering-shiny.org/action-layout.html#getting-started
#'
#' @examples
#' theme_2dii()
#' @noRd
theme_2dii <- function() {
  dont_brake_side_panel <- 3
  bs_theme(bootswatch = "flatly", version = dont_brake_side_panel)
}
