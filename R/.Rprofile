# ## We set the cloud mirror, which is 'network-close' to everybody, as default
# local({
#   r <- getOption("repos")
#   r["CRAN"] <- Sys.getenv(
#     x = "CRAN_ARTIFACTORY_URL",
#     unset = "https://cloud.r-project.org"
#   )
#   options(repos = r)
# })

.Last <- function() {
  # Save the history file on exit:
  # See: https://astrostatistics.psu.edu/su07/R/html/utils/html/savehistory.html
  if (interactive()) try(savehistory())
}

# Useful functions for common TRP stuff.
trp <- list(
  test = function() {
    testthat::test_local(".", stop_on_failure = TRUE)
  }
)
