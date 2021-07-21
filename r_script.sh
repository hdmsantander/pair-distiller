#!/bin/bash
# Requires pandoc and R
Rscript -e 'rmarkdown::render("workpad.rmd", "html_document", output_dir = "dist")' && mv dist/workpad.html dist/index.html
