index <- function(url, type = "source", filters = NULL, head = 5, cols = c("Package", "Version")) {
  contribUrl <- contrib.url(url, type = type)
  p <- available.packages(contribUrl, type = type, filters = filters)
  p[1:head, cols]
}

bioc <- local({
  env <- new.env()
   on.exit(rm(env))
   evalq(source("http://bioconductor.org/biocLite.R", local = TRUE), env)
   biocinstallRepos()
  })

index(bioc)

bioc[grep("BioC", names(bioc))]


index(bioc["BioCsoft"])

options(repos = BiocInstaller::biocinstallRepos())
