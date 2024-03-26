Analysis
================

# Load libraries

``` r
library(tidyverse)
library(googlesheets4)
library(openxlsx)
library(DT)
```

# Read data

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
CombinedCareerConnections <- data.table::rbindlist(SheetList, fill = TRUE, use.names = TRUE)

CombinedCareerConnections$Opportunity <- rep(sheets, sapply(SheetList, nrow))
```

# Interactive datatable

``` r
datatable <- datatable(CombinedCareerConnections, options = list(
  searching = TRUE, 
  pageLength = 5,
  lengthMenu = c(5, 15, 20, 25),
  filter = 'top'
))
```

``` r
formatStyle(datatable, 
  "Application.Due", 
  backgroundColor = styleEqual(
    levels = c('ASAP', 'Rolling basis', 'Rolling Basis'), 
    values = c('red', 'orange', 'orange')
    )
  )
```
