renderModularUI <- function(module.dir, module.file, numbered = FALSE, layout.fun, ...) {

  res <- do.call(
    layout.fun,
    c(modularTabPanels(module.dir, module.file, numbered), list(...))
  )

  return(res)

}
