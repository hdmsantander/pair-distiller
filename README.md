# README

## GitHub Pages

You can find some results of the project [here](https://hdmsantander.github.io/pair-distiller/)

## Generating CSV (pair-distiller)

To generate the _distill_results.csv file_, run _distill_script.sh_ as follows:

```BASH
./distill_script.sh arg1 arg2
```

Where `arg1` and `arg2` are:

- `arg1`: Tag from which to run the tool
- `arg2`: Number of commits to work with, e.g. 500

The script has to be run at the root of the project to analyze.

## Incorporating CSV information to database (pair-distiller-integrator)

To incorporate the CSV information to the database, run the _pair_distiller_integrator.jar_ as follows:

```BASH
java -jar pair_distiller_integrator.jar -h DATABASE_HOST -d DATABASE_NAME -u DATABASE_USER -p USER_PASSWORD -c CSV_FILE
```

This will load the CSV information into the change_details table within the PostgreSQL database using the information from the CSV file.

The program will output errors to STDOUT and print a brief summary of the successes and failures. It will also print an array of line numbers for problematic entries from the CSV file.

Like:

```
Matched: 241 not matched: 16 ambiguous: 0
Lines with errors: [30, 87, 89, 92, 94, 97, 98, 103, 183, 185, 186, 187, 190, 192, 193, 194]
```

## Generating RDA files (r_script)

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
