loadWholeWtDataset <- function(rawdata_path = NULL, metadata_path = NULL) {
  if(is.null(rawdata_path) || is.null(metadata_path)) {
    stop("Both 'rawdata_path' and 'metadata_path' paths must be provided.")
  }
  
  suppressPackageStartupMessages({
    require(tidyverse)
  })
  
  # Load data and metadata
  rawdata <- read_tsv(rawdata_path, 
                      show_col_types = FALSE) # load raw data
  metadata <- read_tsv(metadata_path, 
                       show_col_types = FALSE) # cell cycle data
  
  df <- cbind(rawdata, metadata) %>% # merge data and metadata
    filter(Gene %in% "WT") %>% # only wt strain
    filter(rowSums(.[1:5843]) < 15000) %>% # remove counts above 15000
    drop_na() %>% # remove empty levels
    mutate(max = max(Cell_Cycle_Time), # divide cells into time bins
           min = min(Cell_Cycle_Time),
           width = (max-min)/30,
           bin1 = ceiling((Cell_Cycle_Time - min)/width),
           time_interval = ifelse(Cell_Cycle_Time == min, 
                                  bin1 + 1, 
                                  bin1),
           time_interval = time_interval * 3) %>% # each bin should reflect minutes
    select(-c("max", "min", "width", "bin1")) %>% # remove unnecessary cols
    mutate(time_interval = factor(time_interval))
  
  
  df[1:5843] <- df[1:5843]*10000/rowSums(df[1:5843]) # normalize data
  
  return(df)
}
