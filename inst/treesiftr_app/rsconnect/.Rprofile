# A sample .Rprofile file with two different package repositories.
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cran.rstudio.com/"
  r["mycompany"] <- "https://bioconductor.org/packages/3.7/bioc"
  options(repos = r)
})
