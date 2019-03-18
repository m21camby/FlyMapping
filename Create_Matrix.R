#!/usr/bin/env Rscript


# File download from below link:
# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE107451

# This file is to Create matrix from Aerts publication 57k
# To work correlation with imaging matrix, the data has to convert from 10X genomics format data to matrix 


.libPaths(c("/data/rajewsky/shared_libs/test_seurat3/", .libPaths())) # for temporary reason, Seurat needs other library path
library(Seurat)
library(plyr)
library(dplyr)
library("MASS", lib.loc="/data/local/rajewsky/shared_libs/R") 

PATH = "/data/rajewsky/home/skim/Image_Mapping_Marwan/FishProject/single_cell_sequencing_data/Stein_Aerts/from_publication/"
Aerts.data <- Read10X(data.dir = PATH)

Aerts.matrix <- as.matrix(Aerts.data)
write.matrix(Aerts.matrix,'/data/rajewsky/home/skim/Image_Mapping_Marwan/FishProject/single_cell_sequencing_data/Stein_Aerts/from_publication/Aerts_Publication_DGEm.txt',sep = "\t")



