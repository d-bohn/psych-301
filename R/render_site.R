files <- list.files("lessons", pattern = "*.Rmd$", full.names = TRUE)

# purrr::walk(files, rmarkdown::render, output_format = "html_document")

for (f in files) rmarkdown::render(f)

files_html <- stringr::str_replace_all(files, ".Rmd", ".html")

purrr::walk(c(files,files_html), fs::file_copy,
            new_path = "docs/lessons", overwrite = TRUE)

rmarkdown::render_site()


