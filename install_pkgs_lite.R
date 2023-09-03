# Add this to your .Rprofile to permanently set your Bioc version
Sys.setenv(R_BIOC_VERSION=3.17)

if (!requireNamespace("pak", quietly = TRUE)) {
    install.packages("pak", repos = "https://cran.rstudio.com/")
}
