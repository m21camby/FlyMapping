#!/usr/bin/env python

"""
Fly brain project (Stephan Preibisch lab)

This file is for return subset Data frame from Aerts 57k data. 

For Analysis, two arguments as input

1st input DataFrame is from scRNA-seq (txt format)
2nd input DataFrame is from metadata from scRNA-seq (txt format)
3rd input is number of cluster you want to extract

how to?
e.g.
python3 Extract_Subclusters_Aerts_DF.py --Sequencing_Data ../single_cell_sequencing_data/Stein_Aerts/from_publication/Aerts_Publication_DGEm_from_DF.txt.gz --Meta_Data ../single_cell_sequencing_data/Stein_Aerts/aerts_57k_cells_metadata.txt --Cluster_Number 80 &

"""
import argparse
import pandas as pd
import heapq

parser = argparse.ArgumentParser()
parser.add_argument("--Sequencing_Data", help="input file (format: txt)")
parser.add_argument("--Meta_Data", help="input meta file")
parser.add_argument("--Cluster_Number", help="Number of Cluster to extract from 0 to 101, will produce all clusters if input is more than 101")
args = parser.parse_args()

#####################
# load Data
#####################

Aerts_raw = pd.read_csv(args.Sequencing_Data, delimiter="\t", error_bad_lines=False, compression = 'gzip')
Meta_Aerts = pd.read_csv(args.Meta_Data, delimiter="\t", index_col = 0)


#####################
# cluster by number
#####################

# we have from 0 to 101 cluster (Created by Ines)
Cluster_lists = list(range(0, 101))

args.Cluster_Number = int(args.Cluster_Number) # change to int

if args.Cluster_Number in Cluster_lists:

	Meta = Meta_Aerts.index[Meta_Aerts.iloc[:, 5] == int(args.Cluster_Number)]
	Aerts_sub = Aerts_raw.loc[:, Meta]
	Aerts_sub.to_csv('Cluster_Aerts' + str(args.Cluster_Number) + '.txt', sep='\t', index=True)

else: # where not a number between 0 ~ 101 

	for i in range(0, 101):
		
		Meta = Meta_Aerts.index[Meta_Aerts.iloc[:, 5] == i]
		DF_sub = Aerts_raw.loc[:, Meta]
		DF_sub.to_csv('Cluster_Aerts' + str(i) + '.txt', sep='\t', index=True) 









