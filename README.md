# FlyMapping
CircRTrain Secondment Fly Brain Mapping scRNA-seq

#### Create_Martrix.R
This file is for creating Data frame from Aerts 57k 10X Genomics file

Input file can be downloaded from below link: 

[link](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE107451)

#### Extract_Subclusters_Aerts_DF.py

This file is to extract Data frame from each cluster. Thus it needs two input file 1)Data frame 2)Meta data. 

The output will be tab-delimited text file of DGEm

How to use e.g. cluster 80:

python3 Extract_Subclusters_Aerts_DF.py --Sequencing_Data Aerts_Publication_DGEm_from_DF.txt.gz --Meta_Data aerts_57k_cells_metadata.txt --Cluster_Number 80 &
 


 

