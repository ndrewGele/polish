#' Load server code into Shiny App from files
#'
#' Loops through modules, loading server code into Shiny via `source()` if files exist.
#'
#' @param module.dir Path to the parent directory containing module directories
#' @param module.file Name of file within module directories containing server code
#' @param environment `environment()` to be passed to `source()` (must be provided when function is called)
#'
#' @export
#' @examples
#' # Load server.R files into the server environment
#' \dontrun{
#' server <- function(input, output, session) {
#'   modularServer(
#'     module.dir = file.path('.', 'modules'),
#'     module.file = 'server.R',
#'     environment = environment()
#'   )
#' }
#' }
modularServer <- function(module.dir, module.file, environment) {

  # list.dirs() returns parent directory, so filter it out
  subdirs <- list.dirs(module.dir)
  subdirs <- subdirs[subdirs != module.dir]

  # Loop through modules, running code in server environment
  for (subdir in subdirs) {

    if(file.exists(file.path(subdir, module.file))) {
      source(file.path(subdir, module.file), environment)$value
    }

  }

}
