#' Automatically create a Polish App
#'
#' Creates needed files and directories so that you can quickly begin development of your Shiny App.
#'
#' @param app.dirname New directory that will be created and contain the shiny app files
#' @param example.modules If `TRUE`, two example modules will be created along with the app skeleton
#' @param helpful.comments If `TRUE`, comments will be included to help the user learn how Polish Apps work
#'
#' @export
create_polish_app <- function(app.dirname, example.modules = FALSE, helpful.comments = FALSE) {

  dir <- system.file("boilerplate", package = "polish", mustWork = TRUE)

  file_paths <- list.files(path = dir, full.names = T, recursive = T, include.dirs = T)
  file_names <- list.files(path = dir, full.names = F, recursive = T, include.dirs = T)


  if(!dir.exists(app.dirname)) {
    dir.create(app.dirname)
  }

  for(i in 1:length(file_paths)) {

    if(!example.modules & stringr::str_detect(file_paths[i], 'modules/')) next

    if(dir.exists(file_paths[i]) & !dir.exists(file.path(app.dirname, file_names[i]))) {
      dir.create(file.path(app.dirname, file_names[i]))
    }

    if(!dir.exists(file_paths[i])) {

      file.copy(
        from = file_paths[i],
        to = file.path(app.dirname, file_names[i])
      )

      file_content <- readr::read_lines(file = file.path(app.dirname, file_names[i]))

      if(helpful.comments) {
        file_content <- stringr::str_replace(string = file_content, pattern = 'HELP: ', replacement = '')
        file_content <- file_content[!stringr::str_detect(string = file_content, pattern = 'BASE:')]
      } else {
        file_content <- stringr::str_replace(string = file_content, pattern = 'BASE: ', replacement = '')
        file_content <- file_content[!stringr::str_detect(string = file_content, pattern = 'HELP:')]
      }

      readr::write_lines(
        x = file_content,
        path = file.path(app.dirname, file_names[i])
      )

    }

  }

  invisible(app.dirname)

}
