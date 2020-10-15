# polish

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/polish)](https://cran.r-project.org/package=polish)

## Overview

polish is a framework for R Shiny applications that facilitates organizational modularity. It's common to use the `source()` 
function to break up a codebase into multiple files (in both shiny and non-shiny contexts). polish helps this process by
loading external files automatically, keeping your `app.R` file short and clean. 

## Installation

``` r
# Until polish is submitted to CRAN and approved, you can install it via GitHub.
devtools::install_github("ndrewGele/polish")
```

## Usage

The simplest way to use polish is to run `create_polish_app()` and start adding UI and server content to the `/modules`
directory that gets created. For first-time users, The Helpful Comments can help you gain a better understanding of how a 
polish `app.R` is organized, and the Example Modules can serve as a blueprint for your own modules.

``` r
library(polish)

create_polish_app(
  app.dirname = '/path/to/my_new_shiny_app', 
  example.modules = TRUE,
  helpful.comments = TRUE
)
```

If you'd like to see how polish's core functions are used before installing, check out the package's `/inst/boilerplate` directory.
