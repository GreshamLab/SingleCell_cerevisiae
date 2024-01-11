#This script runs the specified R markdown files in the folder, generating 
#the folder structure, the files, and the plots used for analysis

files <- c("Gene_Variance.Rmd",
           "Bootstrapping.Rmd",
           "Cluster_Cells.Rmd",
           "IntraCluster_Analysis.Rmd")

if (!dir.exists("../results/")){dir.create("../results/")}

#render the Rmd files and perform the analysis
for (f in files) 
  rmarkdown::render(f, 
                    encoding = encoding, 
                    output_dir = "../results/") 
