#!/bin/bash
# Requires pandoc and R
Rscript -e 'rmarkdown::render("workpad.rmd", "html_document", output_dir = "docs")' && mv docs/workpad.html docs/index.html
