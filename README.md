# README

To generate the _distill_results.csv file_, run _distill_script.sh_ as follows:

```BASH
./distill_script.sh arg1 arg2 arg3
```

Where `arg1`, `arg2` and `arg3` are:

- `arg1`: Name of the branch on which to run git commands, e.g. master
- `arg2`: Number of commits to work with, e.g. 50
- `arg3`: Date from which the scan will take place, e.g. 2015-02-18

The script has to be run at the root of the project to analyze.

To generate the RDA files given the _distill_results.csv_ run _r_script.sh_:

```BASH
./r_script.sh
```

The script will invoke _Rscript_ to perform the knitting of the r-markdown file. The file imports the following R libraries at runtime:

- `library(readr)`
- `library(dplyr)`
- `library(tidyverse)`
- `library(kableExtra)`
- `library(ggplot2)`
- `library(viridis)`
- `library(funtimes)`

The script also needs `pandoc` to be installed.
