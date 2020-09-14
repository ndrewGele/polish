#' Assemble UI content from files into Shiny Layout
#'
#' Compiles all Module UI files into the desired `layout.fun` using `do.call()`, keeping your `app.R` file tidy.
#' This can be run within `ui.R`, `shinyUI()`, or `renderUI()`, just like any other Shiny UI element.
#'
#' @param module.dir Path to the parent directory containing module directories
#' @param module.file Name of file within module directories containing UI code
#' @param numbered If `TRUE`, directories will be ordered by numeric prefix (e.g., `01_Index`, `02_About`)
#' @param layout.fun Any Shiny UI function that leverages `tabPanel()` elements (`navbarPage()`, `navlistPanel()`, `tabsetPanel()`, etc)
#' @param ... Additional arguments to be passed to the supplied `layout.fun`
#'
#' @return A Shiny UI object
#'
#' @export
renderModularUI <- function(module.dir, module.file, numbered = FALSE, layout.fun, ...) {

  res <- do.call(
    layout.fun,
    c(modularTabPanels(module.dir, module.file, numbered), list(...))
  )

  return(res)

}
