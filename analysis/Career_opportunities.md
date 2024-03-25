Analysis
================

``` r
library(tidyverse)
library(googlesheets4)
library(openxlsx)
```

``` r
#career_connections_internships <- read_sheet("https://docs.google.com/spreadsheets/d/1_iSvNe37MX_rvaBNmIgu37PffRk5jXE4qdLSiyZ-Q7w/edit#gid=0", sheet = 1,
           #gs4_deauth())

#repeat for each sheet
```

``` r
career_connections <-"/cloud/project/data/Career_Connections_Database.xlsx"

sheets <- openxlsx::getSheetNames(career_connections)
SheetList <- lapply(sheets,openxlsx::read.xlsx,xlsxFile=career_connections)
names(SheetList) <- sheets
CombinedCareerConnections <- data.table::rbindlist(SheetList, fill = TRUE)

CombinedCareerConnections$Opportunity <- rep(sheets, sapply(SheetList, nrow))
```
