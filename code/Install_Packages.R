#Install packages

#Install and load packages from bioconductor
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
if (!require("biomaRt", quietly = TRUE)) install("biomaRt"); library(biomaRt)
if (!require("clusterProfiler", quietly = TRUE)) install("clusterProfiler"); library(clusterProfiler)
if (!require("pathview", quietly = TRUE)) install("pathview"); library(pathview)
if (!require("enrichplot", quietly = TRUE)) install("enrichplot"); library(enrichplot)

#Install genome wide annotation for Yeast
if (!require("org.Sc.sgd.db", quietly = TRUE)) install("org.Sc.sgd.db"); library(org.Sc.sgd.db)

#Install and load packages from CRAN
if (!require('tidyverse')) install.packages('tidyverse'); library('tidyverse')
if (!require('reshape2')) install.packages('reshape2'); library('reshape2')
if (!require('conflicted')) install.packages('conflicted'); library('conflicted')
if (!require('umap')) install.packages('umap'); library('umap')
if (!require('RColorBrewer')) install.packages('RColorBrewer'); library('RColorBrewer')
