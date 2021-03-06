#' Assemble UI content from files into Shiny Layout
#'
#' Compiles all Module UI files into the desired `layout.fun` using `do.call()`, keeping your `app.R` file tidy.
#' This can be run within `ui.R`, `shinyUI()`, or `renderUI()`, just like any other Shiny UI element.
#'
#' @inheritParams modularTabPanels
#' @param layout.fun Any Shiny UI function that leverages `tabPanel()` elements (`navbarPage()`, `navlistPanel()`, `tabsetPanel()`, etc)
#' @param ... Additional arguments to be passed to the supplied `layout.fun`
#'
#' @return A Shiny UI object
#'
#' @export
#' @examples
#' # app.R
#' # Create a UI object and render it
#' \dontrun{
#' server <- function(input, output, session) {
#'   output$appUI <- renderUI({
#'     modularUI(
#'       module.dir = file.path('.', 'modules'),
#'       module.file = 'ui.R',
#'       layout.fun = navbarPage,
#'       title = 'My Modular App'
#'     )
#'   })
#' }
#' ui <- uiOutput('appUI')
#' shinyApp(ui, server)
#' }
modularUI <- function(module.dir, module.file, numbered = FALSE, layout.fun, ...) {

  res <- do.call(
    layout.fun,
    c(modularTabPanels(module.dir, module.file, numbered), list(...))
  )

  return(res)

}
