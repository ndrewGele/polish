renderModularApp <- function(module.dit, module.file, layout.fun, ...) {

  app <- do.call(
    layout.fun,
    c(modularTabPanels(module.dir, module.file), list(...))
  )

  app

}
