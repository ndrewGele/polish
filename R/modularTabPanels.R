#' Load UI code into Shiny App from files
#'
#' Maps over modules, converting Shiny UI code into `tabPanel()` objects.
#'
#' This function can be used on its own if desired, but modularUI() can be used to pass the tabPanels to a UI function more succinctly.
#'
#' @param module.dir Path to directory that contains modules (child directories)
#' @param module.file Name of file found within module directories that contains UI code
#' @param numbered If `TRUE`, directories will be ordered by numeric prefix (e.g., `01_Index`, `02_About`)
#'
#' @return A list of Shiny `tabPanel()` objects
#'
#' @export
#' @examples
#' # Create a list of tabPanels from ui.R files
#' \dontrun{
#' server <- function(input, output, session) {
#'   tabPanels <- modularTabPanels(
#'     module.dir = file.path('.', 'modules'),
#'     module.file = 'ui.R',
#'     numbered = TRUE
#'   )
#' }
#' }
modularTabPanels <- function(module.dir, module.file, numbered = FALSE) {

  # list.dirs() returns parent directory, so filter it out
  subdirs <- list.dirs(module.dir)
  subdirs <- subdirs[subdirs != module.dir]

  # Map over child directories, cleaning names, then return a list of Shiny tabPanels
  res <- purrr::map(
    .x = subdirs,
    .f = function(x) {

      cleanTitle <- stringr::str_extract(x, '[A-z 0-9]*$')

      if(numbered) {
        cleanTitle <- stringr::str_replace_all(cleanTitle, '^[0-9]*_', '')
      }

      cleanTitle <- stringr::str_replace_all(cleanTitle, '_', ' ')
      cleanTitle <- stringr::str_to_title(cleanTitle)

      shiny::tabPanel(
        cleanTitle,
        source(file.path(x, module.file))$value
      )

    }
  )

  return(res)

}
