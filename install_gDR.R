
# Load necessary libraries

# if devtools isnt installed, install it

if (!require("devtools")) install.packages("devtools")
library(devtools)
# Set the GitHub organization and access token
github_org <- "gdrplatform"
access_token_path <- "/home/jermiah_joseph/software/R_pkgs/gDR/rplatform/.github_access_token.txt"

# Read the access token from the file
access_token <- readLines(access_token_path)
# Authenticate with GitHub using the access token
# github_token(access_token)

# install_github(repo, username = NULL, ref = "master", subdir = NULL,
#   auth_token = github_pat(quiet), host = "https://api.github.com",
#   quiet = FALSE, ...)
# Install the packages from the private GitHub organization
install_github(repo = "gdrplatform/gDRstyle",  auth_token=access_token)
install_github(repo = "gdrplatform/gDRtestData",  auth_token=access_token)
install_github(repo = "gdrplatform/gDRutils",  auth_token=access_token)
install_github(repo = "gdrplatform/gDRimport",  auth_token=access_token)
install_github(repo = "gdrplatform/gDRcore",  auth_token=access_token)
install_github(repo = "gdrplatform/gDR",  auth_token=access_token)