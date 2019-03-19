#!/usr/bin/env Rscript


# This file is to Create matrix from Aerts publication 57k
# File download from below link:
# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE107451

.libPaths(c("/data/rajewsky/shared_libs/test_seurat3/", .libPaths()))
library(Seurat)
library(plyr)
library(dplyr)
library("MASS", lib.loc="/data/local/rajewsky/shared_libs/R")

PATH = "/data/rajewsky/home/skim/Image_Mapping_Marwan/FishProject/single_cell_sequencing_data/Stein_Aerts/from_publication/"
Aerts.data <- Read10X(data.dir = PATH)

# Create Seurat object
Aerts.SO <- CreateSeuratObject(counts = Aerts.data, project = "Aerts")
# Get genes
Aerts_Data_Genes <- as.data.frame(Aerts.SO@assays$RNA@data@Dimnames[1])

Aerts.matrix <- as.matrix(Aerts.data)
Aerts.df <- as.data.frame(Aerts.matrix)
rownames(Aerts.df) <- Aerts_Data_Genes$c..128up....140up....14.3.3epsilon....14.3.3zeta....18SrRNA.CR41548...

# Instead of writing matrix, I used DF
write.table(Aerts.df, file = '/data/rajewsky/home/skim/Image_Mapping_Marwan/FishProject/single_cell_sequencing_data/Stein_Aerts/from_publication/Aerts_Publication_DGEm_from_DF.txt', sep = '\t', row.names = TRUE)
#write.matrix(Aerts.matrix,'/data/rajewsky/home/skim/Image_Mapping_Marwan/FishProject/single_cell_sequencing_data/Stein_Aerts/from_publication/Aerts_Publication_DGEm.txt',sep = "\t")



