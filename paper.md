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

## Summary

treesiftr is an R package [@R] and associated Shiny [@shiny] [application](https://wrightaprilm.shinyapps.io/treesiftr_app/) for visualizing the relationship between phylogenetic trees and the underlying data used to estimate them. treesiftr works by subsetting a phylogenetic matrix according to user-provided input about
which characters to visualize. A maximum parsimony tree is then estimated from each data subset. Maximum parsimony was chosen for speed and analytical simplicity. Under the parsimony optimality criterion, the preferred tree is the one that suggests the fewest evolutionary steps, or character changes over evolutionary history. The tree is scored under both parsimony and  Lewis' Mk model [@Lewis2001], a maximum likelihood model for estimating phylogeny from 
discrete character data. The data and tree are then visualized using ggtree [@ggtree], based upon the ggplot2 [@ggplot2] package. Expected outputs are the same whether the learner is interacting via the GUI or the RStudio interface; however, the RStudio interface does have additional options not available in the GUI. 

The included Shiny [application]((https://wrightaprilm.shinyapps.io/treesiftr_app/) renders the visual output of the subsetting and estimation process, and can be used to provide further input to the treesiftr functions, such as decorating the trees with scores under different optimality criteria. It can be run locally or used via the web without installing any R packages or having knowledge of R. The web instance can accommodate 150 concurrent users. 

Also included in the package are two worksheets and an instructor guide. The worksheet intended for use with the Shiny app, "treesiftr GUI", introduces the application, the underlying data, and the application functions. It includes several questions, and a glossary. The worksheet for the RStudio interface, "treesiftr Advanced", asks the same questions, but also emphasizes general R skills, such as subsetting data, and specific R skills, such as interacting with phylogenetic data. And instructor guide contains answers to the questions, as well as renderings of the outputs students should see.
treesiftr is not intended to replace a lecture on phylogeny, but to supplement student understanding. 

Phylogenetic trees represent the evolutionary relationships between a set of taxa. These taxa can be species, higher-level biological groupings (e.g., genera or families), lower-level groupings (e.g., populations or strains) or even individuals. Estimating phylogenetic trees is crucial in many areas of biology. Phylogenetic trees are built from homologous characters, characters which are similar in multiple taxa because they were inherited from the most recent common ancestor [@Darwin1859]. For morphological traits, homology is assigned by experts by evaluating the character's evolutionary history and ontology. In molecular characters, it is typically assigned via multiple sequence alignment [@feng].

Once homology is assigned, a phylogeny is estimated from the data. Several optimality criteria may be used to do this. They broadly fall into parametric methods, such as maximum likelihood [@Felsenstein1973] and Bayesian methods [@Huelsenbeck2001a], and non-parametric methods, such as maximum parsimony [@FarrisKluge] and neighbor-joining [@gower1969]. Parametric methods assume a model of underlying character evolution, while non-paramtric methods do not. Parametric methods have been shown in many instances to be more accurate [@Felsenstein1978] and, as they enable a rigorous framework of model testing, should be preferred over non-parametric methods. However, they are also compute-intensive, and so treesiftr makes use of the maximum parsimony criterion for analytical simplicity. Under maximum parsimony, the tree that is favored for a set of taxa is the one which implies the fewest evolutionary changes.


## Statement of Need

There are many  phylogenetic tree viewers on the market such as [FigTree](http://tree.bio.ed.ac.uk/software/figtree/),
IcyTree [@icytree], and Phylogeny.IO [@phylogenyio]. But visualizing the data that underlie a particular tree is still largely accomplished via the Mesquite software [@Maddison2008]. To use Mesquite, one must perform local installs. The software must also be interacted with via a GUI, without the opportunity for learners to practice programmatic skills while learning about phylogenetic trees and data. I wrote this package to allow students to learn about phylogenetic trees and data without performing local installs, and to give the option for students to practice programmatic skills while doing so. 

treesiftr was initially written for use in the [Analytical Paleobiology Workshop](http://www.analytical.palaeobiology.de/) in summer 2018.
This course is a 30-day paleobiological data predominantly for graduate students. treesiftr was used in the last week of the course,
by which time the learners had been working with R via the RStudio application for three weeks. In this setting, the exercise 
itself took about 45 minutes, and was embedded in a 3-hour lecture block (see below). I also added a web-based GUI for portability, and use in undergraduate biology classrooms. In undergraduate biology classrooms, learners are largely naive with respect to scientific computing, and performing installations on school or personal computers for a single class period may not be feasible. In  particular, I am faculty at Southeastern Louisiana University, which 
 is an institution serving students in a low-income region of a low-income state. Many students do not have reasonable 
computers to perform local installs of software. For demonstrating phylogeny and evolutionary history in my genetics class, a web-based viewer and activity set is, therefore, preferable. 
The discussion of phylogeny is one hour and fifteen minute class period, with the hands-on activity taking about 30 minutes, preceded by lecture on the basics of tree thinking [@Baum979] and tree reading. 

The included worksheets and package are not intended to be a replacement for a lecture. They are instead intended to be a hands-on supplement for the lecturer to use in class. By allowing the student to choose subsets of data, and have a tree of those data appear instantly, the relationship between the data and the estimated tree is enforced visually. Each worksheet does come with a glossary of terms that are required to describe phylogenetic trees, and it is the responsibility of the instructor to help students learn these terms before they start the activity. There is one example slideshow included in the `inst/slides` directory. These slides are written in RMarkdown, with executable R code segments that illustrate skills such as interacting with phylogenetic trees in R, and terminology to describe phylogenies. An overview of different methodologies in phylogeny estimation is also provided. This is an example of a lecture that could be used to explain the terminology presented in the worksheets. It is not necessary to use these particular slides for the activity to function.

# References