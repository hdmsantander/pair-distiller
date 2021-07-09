#!/bin/bash
# Requires pandoc and R
Rscript -e 'rmarkdown::render("workpad.rmd", "html_document")'
