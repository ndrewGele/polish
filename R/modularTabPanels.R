modularTabPanels <- function(module.dir, module.file) {

  subdirs <- list.dirs(module.dir)
  subdirs <- subdirs[subdirs != module.dir]

  res <- purrr::map(
    .x = subdirs,
    .f = function(x) {

      module_name <- gsub('[./]*[a-z]*[./]|_', '', x)

      cleanTitle <- gsub('[./]*[a-z]*[./]', '', x)
      cleanTitle <- gsub('[^[:alnum:]]', ' ', cleanTitle)
      cleanTitle <- stringr::str_to_title(cleanTitle)

      tabPanel(
        cleanTitle,
        source(file.path(x, module.file))$value
      )

    }
  )

  res

}
