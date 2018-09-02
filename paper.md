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

Phylogenetic trees represent the evolutionary relationships between a set of taxa. Estimating 
phylogenetic trees is crucial in many areas of biology. However, visualizing the 
relationship between a phylogenetic tree and the data used to generate it is not always 
intuitive to novice learners. To assist with understanding this relationship, I have created treesiftr, an R 
package [@R] that creates subsets of data from a phylogenetic matrix, estimates a 
tree for each subset under the maximum parsimony optimality criterion, and scores that 
tree under both the likelihood and parsimony criteria. The output of the package is a 
visualization or set of visualizations of a tree and the characters used to estimate it. 
Also included is a (Shiny application](https://wrightaprilm.shinyapps.io/treesiftr_app/) [@shiny] 
that can be run locally or used via the web without installing any R packages or 
having knowledge of R.

In the `vignettes` directory, there are two worksheets for student use. One worksheet
(01-treesiftr) is intended for use with the Shiny server graphical user interface (GUI). The other,
(02-treesiftr-advanced) is intended for use with R and RStudio. There is also an
instructor's guide with screenshots of the expected GUI output, and worked code snippets and outputs
for the advanced exercise. These exercises can also be viewed as a [rendered website](https://wrightaprilm.github.io/treesiftr/),
so that no installations or downloads are required at all for the GUI-based exercises.

treesiftr works by subsetting a phylogenetic matrix according to user-provided input about
which characters to visualize. A maximum parsimony tree is then estimated from each dataset subset. 
Maximum parsimony was chosen for speed and analytical simplicity. Under the parsimony
optimality criterion, the preferred tree is the one that suggests the fewest evolutionary steps,
or character changes over evolutionary history. The tree is scored under both parsimony and 
Lewis' Mk model [@Lewis2001], a maximum likelihood model for estimating phylogeny from 
discrete character data. The data and tree are then visualized using ggtree [@ggtree],
based upon the ggplot2 [@ggplot2] package. Expected outputs are the same whether the learner is interacting via the GUI or the 
RStudio interface; however, the RStudio interface does have additional options not available in the GUI.
The worksheet for the RStudio interface also emphasizes general R skills, such as subsetting data, 
and specific R skills, such as interacting with phylogenetic data.


## Statement of Need

treesiftr was initially written for use in the [Analytical Paleobiology Workshop](http://www.analytical.palaeobiology.de/) in summer 2018.
This course is a 30-day paleobiological data predominantly for graduate students, but also 
postdocs and research-active undergraduates. treesiftr was used in the last week of the course,
by which time the learners had been working with R via the RStudio application for three weeks.
There are many  phylogenetic tree viewers on the market such as [FigTree](http://tree.bio.ed.ac.uk/software/figtree/),
IcyTree [@icytree], and Phylogeny.IO [@phylogenyio]. But visualizing the data that underlie a 
particular tree is still largely accomplished via the Mesquite software [@Maddison2008]. To 
use Mesquite, one must perform local installs. The software must also be interacted with via 
a GUI, without the opportunity for learners to practice programmatic skills while learning about
phylogenetic trees and data. Since the participants in the course were learning R, 
I wrote this package to allow students to practice R skills, while learning about the 
relationship between phylogenetic data and phylogenetic trees. In this setting, the exercise 
itself took about 45 minutes, and was embedded in a 3-hour lecture block (see below). 

I also added a web-based GUI for portability, and use in undergraduate biology classrooms. 
In undergraduate biology classrooms, learners are largely naive with respect to scientific computing,
 and performing installations on school or personal computers for a single class period may 
 not be feasible. In  particular, I am faculty at Southeastern Louisiana University, which 
 is an institution serving 
students in a low-income region of a low-income state. Many students do not have reasonable 
computers to perform local installs of software. For demonstrating phylogeny and evolutionary 
history in my genetics class, a web-based viewer and activity set is, thereforem preferable. 
The discussion of phylogeny is one hour and fifteen minute class period, with the hands-on 
activity taking about 30 minutes.

The included worksheets and package are not intended to be a replacement for a lecture. They are,
instead, intended to be a hands-on supplement for the lecturer to use in class. By allowing the student
to choose subsets of data, and have a tree of those data appear instantly, the relationship between
the data and the estimated tree is enforced visually. Each worksheet does come with a
glossary of terms that are required to describe phylogenetic trees, and it is the responsibility
of the instructor to help students learn these terms before they start the activity. There is one example
slideshow included in the `inst/slides` directory. These slides are written in RMarkdown,
with executable R code segments that illustrate skills such as interacting with phylogenetic trees
in R, and terminology to describe phylogenies. An overview of different methodologies in
phylogeny estimation is also provided. This is an example of a lecture that could be used to explain the 
terminology presented in the worksheets. It is not necessary to use these particular slides
for the activity to function.

If using the GUI version of the software, the students will be applying the skill of 
scoring a tree under the maximum parsimony tree estimation criterion, and they will explain how 
different phylogenetic terms (such as monophyly, reversal, and autapomorphy) relate to the 
representation of evolutionary history on a phylogenetic tree. This module also includes 
several theoretical questions on phylogenetics, such as explaining the difference  between 
two different optimality criteria (maximum parsimony and maximum likelihood) for constructing 
phylogenetic trees. The RStudio activities share these objectives, but students will
also practice using functions to read phylogenetic data, subsetting vectors and matrices of data, 
and changing the arguments to functions to achieve a desired behavior. The advanced activity does
not teach students to program in R. I recommend that users of this activity are familiar with
object assignments, vectors, functions, and dataframes prior to beginning the 02-treesiftr-advanced
activity.

# References