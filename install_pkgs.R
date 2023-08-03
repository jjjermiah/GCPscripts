#!/bin/R

# Add this to your .Rprofile to permanently set your Bioc version
Sys.setenv(R_BIOC_VERSION=3.16)

if (!requireNamespace("pak", quietly = TRUE)) {
    install.packages("pak", repos = "https://cran.rstudio.com/")
}

# Install CRAN, GitHub and BioC packages with pak
CRAN <- c('renv', 'data.table', 'jsonlite', 'httr', 'xml2', 'XML', 'ggplot2',
    'ggtext', 'crayon', 'glue', 'RMySQL', 'RMariaDB', 'RSQLite', 'rextendr',
    'renv', 'reticulate', 'caret', 'knitr', 'rmarkdown', 'tinytex',
    'shiny', 'ggvis', 'htmlwidgets', 'plotly', 'xtable', 'foreach', 'parallel',
    'future', 'devtools', 'roxygen2', 'testthat', 'drake', 'plumber',
    'checkmate', 'profvis', 'bench', 'survival', 'lattice',
    'RColorBrewer', 'ggplotify', 'gridExtra', 'qs', 'logger', 'memoise',
    'languageserver', 'IRkernel'
    )
GITHUB <- c()
BIOC <- c('BiocGenerics', 'MatrixGenerics', 'S4Vectors', 'Biobase',
    'SummarizedExperiment', 'MultiAssayExperiment', 'GenomicRanges',
    'GenomicFeatures', 'biomaRt', 'limma', 'AnnotationDbi', 'annotate',
    'piano', 'lsa')

pak::pkg_install(c(CRAN, GITHUB, BIOC), dependencies=TRUE)


# CRAN <- c('data.table', 'jsonlite', 'httr', 'xml2', 'XML', 'ggplot2',
#     'ggtext', 'crayon', 'glue', 'RMySQL', 'RMariaDB', 'RSQLite', 'rextendr',
#     'renv', 'reticulate', 'caret', 'knitr', 'rmarkdown', 'tinytex',
#     'shiny', 'parallel',
#     'devtools', 'roxygen2', 'testthat', 
#     'checkmate', 
#     'qs', 'logger', 'memoise',
#     'languageserver', 'IRkernel'
#     )
# GITHUB <- c()
# BIOC <- c('BiocGenerics', 'MatrixGenerics', 'S4Vectors', 'Biobase',
#     'SummarizedExperiment', 'MultiAssayExperiment', 'GenomicRanges',
#     'GenomicFeatures', 'biomaRt', 'limma', 'AnnotationDbi', 'annotate',
#     'piano', 'lsa', 'PharmacoGx')