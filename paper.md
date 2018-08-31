---
title: 'treesiftr: An R package and server for viewing phylogenetic trees and data'
tags:
- biology
- paleobiology
- phylogeny
authors:
- name: April M Wright
  orcid: 0000-0003-4692-3225
  affiliation: "1" # (Multiple affiliations must be quoted)
affiliations:
- name: Southeastern Louisiana University
  index: 1
date: 31 August 2018
bibliography: bibliography.bib
---

# Summary

Estimating phylogenetic trees is crucial in many areas of evolutionary biology. 
However, visualizing the relationship between data and trees is not intutive. 
To assist with visualizing this relationship, I have created treesiftR, an R 
package [@R] that takes subsets of data from a phylogenetic matrix, generates a 
tree under parsimony, and scores that tree under both the likelihood and parsimony 
criteria. The output of the package is a visualization or set of visualizations of 
a tree and characters. Also included is a 
(Shiny application](https://wrightaprilm.shinyapps.io/treesiftr_app/) [@shiny] 
that can be run locally or used via the web without installing any R packages or 
having knowledge of R.

## Target Audience
treesiftr has been used in the Analytical Paleobiology Workshop, in which the audience was 
graduate students and postdocs, many of whom had no prior knowledge of phylogeny. It is 
also used in the Genetics course at Southeastern Louisiana University, where the audience 
is undergraduates who have no prior knowledge of phylogeny. It is meant to be accompanied 
by lecture material on phylogenetics. A glossary is provided with each worksheet, and a 
sample slide deck is included in the inst/slides directory.

# References