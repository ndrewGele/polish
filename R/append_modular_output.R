append_modular_output <- function(output, module.dir, module.file) {

  subdirs <- list.dirs(module.dir)
  subdirs <- subdirs[subdirs != module.dir]

  file_no_ext <- tools::file_path_sans_ext(module.file)

  for (subdir in subdirs) {

    module_name <- gsub('[./]*[a-z]*[./]', '', subdir)
    output_name <- glue::glue('{module_name}_{file_no_ext}')
    output[[output_name]] <- source(file.path(subdir, module.file))$value

  }

  output

}
