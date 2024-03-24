Analysis
================

``` r
library(tidyverse)
library(broom)
library(readxl)
#install.packages("dplyr")
library(dplyr)
library(ggplot2)
#install.packages("leaflet")
library(leaflet)
#install.packages("htmltools")
library(htmltools)
```

## 1. Introduction

## 2. Data

``` r
Internships <- read_excel("/cloud/project/data/Internship_Program_Edit.xlsx", 
    col_types = c("text", "text", "numeric", 
        "text", "text", "text", "numeric", 
        "numeric", "text", "text"))
```

    ## Warning: Expecting numeric in C2 / R2C3: got 'NA'

    ## Warning: Expecting numeric in G2 / R2C7: got 'NA'

    ## Warning: Expecting numeric in H2 / R2C8: got 'NA'

    ## Warning: Expecting numeric in C23 / R23C3: got '1973, 1974, 1975'

    ## Warning: Expecting numeric in C46 / R46C3: got '1984, 1985'

    ## Warning: Expecting numeric in C49 / R49C3: got '1997, 1998'

    ## Warning: Expecting numeric in C62 / R62C3: got '1979 and 1980'

    ## Warning: Expecting numeric in C77 / R77C3: got '1994-95'

    ## Warning: Expecting numeric in C87 / R87C3: got 'NA'

    ## Warning: Expecting numeric in C162 / R162C3: got '1987-1993'

    ## Warning: Expecting numeric in C164 / R164C3: got '1977, 1978'

    ## Warning: Expecting numeric in C184 / R184C3: got '1987, 1988'

    ## Warning: Expecting numeric in C202 / R202C3: got '1995, 1996'

    ## Warning: Expecting numeric in C211 / R211C3: got '2002 - 2009'

    ## Warning: Expecting numeric in C243 / R243C3: got '2003, 2004, 2005'

    ## Warning: Expecting numeric in C286 / R286C3: got '1985, 1986'

    ## Warning: Expecting numeric in C314 / R314C3: got 'NA'

    ## Warning: Expecting numeric in C431 / R431C3: got '1997, 1998, 1999'

    ## Warning: Expecting numeric in C516 / R516C3: got '2001, 2002'

    ## Warning: Expecting numeric in C519 / R519C3: got '1978, 1979, 1980'

    ## Warning: Expecting numeric in C545 / R545C3: got '1996-2008'

    ## Warning: Expecting numeric in C549 / R549C3: got '≤2000'

    ## Warning: Expecting numeric in G549 / R549C7: got 'NA'

    ## Warning: Expecting numeric in H549 / R549C8: got 'NA'

    ## Warning: Expecting numeric in C550 / R550C3: got 'NA'

    ## Warning: Expecting numeric in G550 / R550C7: got 'NA'

    ## Warning: Expecting numeric in H550 / R550C8: got 'NA'

    ## Warning: Expecting numeric in G551 / R551C7: got 'NA'

    ## Warning: Expecting numeric in H551 / R551C8: got 'NA'

    ## Warning: Expecting numeric in C552 / R552C3: got 'NA'

    ## Warning: Expecting numeric in G552 / R552C7: got 'NA'

    ## Warning: Expecting numeric in H552 / R552C8: got 'NA'

    ## Warning: Expecting numeric in C553 / R553C3: got 'NA'

    ## Warning: Expecting numeric in G553 / R553C7: got 'NA'

    ## Warning: Expecting numeric in H553 / R553C8: got 'NA'

    ## Warning: Expecting numeric in G554 / R554C7: got 'NA'

    ## Warning: Expecting numeric in H554 / R554C8: got 'NA'

    ## Warning: Expecting numeric in C555 / R555C3: got 'NA'

    ## Warning: Expecting numeric in G555 / R555C7: got 'NA'

    ## Warning: Expecting numeric in H555 / R555C8: got 'NA'

    ## Warning: Expecting numeric in G556 / R556C7: got 'NA'

    ## Warning: Expecting numeric in H556 / R556C8: got 'NA'

    ## Warning: Expecting numeric in G557 / R557C7: got 'NA'

    ## Warning: Expecting numeric in H557 / R557C8: got 'NA'

    ## Warning: Expecting numeric in C558 / R558C3: got 'NA'

    ## Warning: Expecting numeric in G558 / R558C7: got 'NA'

    ## Warning: Expecting numeric in H558 / R558C8: got 'NA'

    ## Warning: Expecting numeric in C559 / R559C3: got 'NA'

    ## Warning: Expecting numeric in G559 / R559C7: got 'NA'

    ## Warning: Expecting numeric in H559 / R559C8: got 'NA'

    ## Warning: Expecting numeric in C560 / R560C3: got 'NA'

    ## Warning: Expecting numeric in G560 / R560C7: got 'NA'

    ## Warning: Expecting numeric in H560 / R560C8: got 'NA'

    ## Warning: Expecting numeric in C561 / R561C3: got 'NA'

    ## Warning: Expecting numeric in G561 / R561C7: got 'NA'

    ## Warning: Expecting numeric in H561 / R561C8: got 'NA'

    ## Warning: Expecting numeric in C562 / R562C3: got 'NA'

    ## Warning: Expecting numeric in G562 / R562C7: got 'NA'

    ## Warning: Expecting numeric in H562 / R562C8: got 'NA'

    ## Warning: Expecting numeric in C563 / R563C3: got 'NA'

    ## Warning: Expecting numeric in G563 / R563C7: got 'NA'

    ## Warning: Expecting numeric in H563 / R563C8: got 'NA'

    ## Warning: Expecting numeric in C564 / R564C3: got 'NA'

    ## Warning: Expecting numeric in G564 / R564C7: got 'NA'

    ## Warning: Expecting numeric in H564 / R564C8: got 'NA'

    ## Warning: Expecting numeric in C565 / R565C3: got 'NA'

    ## Warning: Expecting numeric in G565 / R565C7: got 'NA'

    ## Warning: Expecting numeric in H565 / R565C8: got 'NA'

    ## Warning: Expecting numeric in C566 / R566C3: got 'NA'

    ## Warning: Expecting numeric in G566 / R566C7: got 'NA'

    ## Warning: Expecting numeric in H566 / R566C8: got 'NA'

    ## Warning: Expecting numeric in G567 / R567C7: got 'NA'

    ## Warning: Expecting numeric in H567 / R567C8: got 'NA'

    ## Warning: Expecting numeric in C568 / R568C3: got 'NA'

    ## Warning: Expecting numeric in G568 / R568C7: got 'NA'

    ## Warning: Expecting numeric in H568 / R568C8: got 'NA'

    ## Warning: Expecting numeric in C569 / R569C3: got 'NA'

    ## Warning: Expecting numeric in G569 / R569C7: got 'NA'

    ## Warning: Expecting numeric in H569 / R569C8: got 'NA'

    ## Warning: Expecting numeric in C570 / R570C3: got 'NA'

    ## Warning: Expecting numeric in G570 / R570C7: got 'NA'

    ## Warning: Expecting numeric in H570 / R570C8: got 'NA'

    ## Warning: Expecting numeric in C571 / R571C3: got 'NA'

    ## Warning: Expecting numeric in G571 / R571C7: got 'NA'

    ## Warning: Expecting numeric in H571 / R571C8: got 'NA'

    ## Warning: Expecting numeric in C572 / R572C3: got 'NA'

    ## Warning: Expecting numeric in G572 / R572C7: got 'NA'

    ## Warning: Expecting numeric in H572 / R572C8: got 'NA'

    ## Warning: Expecting numeric in C573 / R573C3: got 'NA'

    ## Warning: Expecting numeric in G573 / R573C7: got 'NA'

    ## Warning: Expecting numeric in H573 / R573C8: got 'NA'

    ## Warning: Expecting numeric in C574 / R574C3: got 'NA'

    ## Warning: Expecting numeric in G574 / R574C7: got 'NA'

    ## Warning: Expecting numeric in H574 / R574C8: got 'NA'

    ## Warning: Expecting numeric in C575 / R575C3: got 'NA'

    ## Warning: Expecting numeric in G575 / R575C7: got 'NA'

    ## Warning: Expecting numeric in H575 / R575C8: got 'NA'

    ## Warning: Expecting numeric in C576 / R576C3: got 'NA'

    ## Warning: Expecting numeric in G576 / R576C7: got 'NA'

    ## Warning: Expecting numeric in H576 / R576C8: got 'NA'

    ## Warning: Expecting numeric in C577 / R577C3: got 'NA'

    ## Warning: Expecting numeric in G577 / R577C7: got 'NA'

    ## Warning: Expecting numeric in H577 / R577C8: got 'NA'

    ## Warning: Expecting numeric in C578 / R578C3: got 'NA'

    ## Warning: Expecting numeric in G578 / R578C7: got 'NA'

    ## Warning: Expecting numeric in H578 / R578C8: got 'NA'

    ## Warning: Expecting numeric in C579 / R579C3: got 'NA'

    ## Warning: Expecting numeric in G579 / R579C7: got 'NA'

    ## Warning: Expecting numeric in H579 / R579C8: got 'NA'

    ## Warning: Expecting numeric in C580 / R580C3: got 'NA'

    ## Warning: Expecting numeric in G580 / R580C7: got 'NA'

    ## Warning: Expecting numeric in H580 / R580C8: got 'NA'

    ## Warning: Expecting numeric in C581 / R581C3: got 'NA'

    ## Warning: Expecting numeric in G581 / R581C7: got 'NA'

    ## Warning: Expecting numeric in H581 / R581C8: got 'NA'

    ## Warning: Expecting numeric in C582 / R582C3: got 'NA'

    ## Warning: Expecting numeric in G582 / R582C7: got 'NA'

    ## Warning: Expecting numeric in H582 / R582C8: got 'NA'

    ## Warning: Expecting numeric in C583 / R583C3: got 'NA'

    ## Warning: Expecting numeric in G583 / R583C7: got 'NA'

    ## Warning: Expecting numeric in H583 / R583C8: got 'NA'

    ## Warning: Expecting numeric in C584 / R584C3: got 'NA'

    ## Warning: Expecting numeric in G584 / R584C7: got 'NA'

    ## Warning: Expecting numeric in H584 / R584C8: got 'NA'

    ## Warning: Expecting numeric in C585 / R585C3: got 'NA'

    ## Warning: Expecting numeric in G585 / R585C7: got 'NA'

    ## Warning: Expecting numeric in H585 / R585C8: got 'NA'

    ## Warning: Expecting numeric in C586 / R586C3: got 'NA'

    ## Warning: Expecting numeric in G586 / R586C7: got 'NA'

    ## Warning: Expecting numeric in H586 / R586C8: got 'NA'

    ## Warning: Expecting numeric in C587 / R587C3: got 'NA'

    ## Warning: Expecting numeric in G587 / R587C7: got 'NA'

    ## Warning: Expecting numeric in H587 / R587C8: got 'NA'

    ## Warning: Expecting numeric in C588 / R588C3: got 'NA'

    ## Warning: Expecting numeric in G588 / R588C7: got 'NA'

    ## Warning: Expecting numeric in H588 / R588C8: got 'NA'

    ## Warning: Expecting numeric in C589 / R589C3: got 'NA'

    ## Warning: Expecting numeric in G589 / R589C7: got 'NA'

    ## Warning: Expecting numeric in H589 / R589C8: got 'NA'

    ## Warning: Expecting numeric in C590 / R590C3: got 'NA'

    ## Warning: Expecting numeric in G590 / R590C7: got 'NA'

    ## Warning: Expecting numeric in H590 / R590C8: got 'NA'

    ## Warning: Expecting numeric in C591 / R591C3: got 'NA'

    ## Warning: Expecting numeric in G591 / R591C7: got 'NA'

    ## Warning: Expecting numeric in H591 / R591C8: got 'NA'

    ## Warning: Expecting numeric in C592 / R592C3: got 'NA'

    ## Warning: Expecting numeric in G592 / R592C7: got 'NA'

    ## Warning: Expecting numeric in H592 / R592C8: got 'NA'

    ## Warning: Expecting numeric in C593 / R593C3: got 'NA'

    ## Warning: Expecting numeric in G593 / R593C7: got 'NA'

    ## Warning: Expecting numeric in H593 / R593C8: got 'NA'

    ## Warning: Expecting numeric in C594 / R594C3: got 'NA'

    ## Warning: Expecting numeric in G594 / R594C7: got 'NA'

    ## Warning: Expecting numeric in H594 / R594C8: got 'NA'

    ## Warning: Expecting numeric in C595 / R595C3: got 'NA'

    ## Warning: Expecting numeric in G595 / R595C7: got 'NA'

    ## Warning: Expecting numeric in H595 / R595C8: got 'NA'

    ## Warning: Expecting numeric in C596 / R596C3: got 'NA'

    ## Warning: Expecting numeric in G596 / R596C7: got 'NA'

    ## Warning: Expecting numeric in H596 / R596C8: got 'NA'

    ## Warning: Expecting numeric in C597 / R597C3: got 'NA'

    ## Warning: Expecting numeric in G597 / R597C7: got 'NA'

    ## Warning: Expecting numeric in H597 / R597C8: got 'NA'

    ## Warning: Expecting numeric in C598 / R598C3: got 'NA'

    ## Warning: Expecting numeric in G598 / R598C7: got 'NA'

    ## Warning: Expecting numeric in H598 / R598C8: got 'NA'

    ## Warning: Expecting numeric in C599 / R599C3: got 'NA'

    ## Warning: Expecting numeric in G599 / R599C7: got 'NA'

    ## Warning: Expecting numeric in H599 / R599C8: got 'NA'

    ## Warning: Expecting numeric in C600 / R600C3: got 'NA'

    ## Warning: Expecting numeric in G600 / R600C7: got 'NA'

    ## Warning: Expecting numeric in H600 / R600C8: got 'NA'

    ## Warning: Expecting numeric in C601 / R601C3: got 'NA'

    ## Warning: Expecting numeric in G601 / R601C7: got 'NA'

    ## Warning: Expecting numeric in H601 / R601C8: got 'NA'

    ## Warning: Expecting numeric in C602 / R602C3: got 'NA'

    ## Warning: Expecting numeric in G602 / R602C7: got 'NA'

    ## Warning: Expecting numeric in H602 / R602C8: got 'NA'

    ## Warning: Expecting numeric in C603 / R603C3: got 'NA'

    ## Warning: Expecting numeric in G603 / R603C7: got 'NA'

    ## Warning: Expecting numeric in H603 / R603C8: got 'NA'

    ## Warning: Expecting numeric in C604 / R604C3: got 'NA'

    ## Warning: Expecting numeric in G604 / R604C7: got 'NA'

    ## Warning: Expecting numeric in H604 / R604C8: got 'NA'

    ## Warning: Expecting numeric in C605 / R605C3: got 'NA'

    ## Warning: Expecting numeric in G605 / R605C7: got 'NA'

    ## Warning: Expecting numeric in H605 / R605C8: got 'NA'

    ## Warning: Expecting numeric in C606 / R606C3: got 'NA'

    ## Warning: Expecting numeric in G606 / R606C7: got 'NA'

    ## Warning: Expecting numeric in H606 / R606C8: got 'NA'

    ## Warning: Expecting numeric in C607 / R607C3: got 'NA'

    ## Warning: Expecting numeric in G607 / R607C7: got 'NA'

    ## Warning: Expecting numeric in H607 / R607C8: got 'NA'

    ## Warning: Expecting numeric in C608 / R608C3: got 'NA'

    ## Warning: Expecting numeric in G608 / R608C7: got 'NA'

    ## Warning: Expecting numeric in H608 / R608C8: got 'NA'

    ## Warning: Expecting numeric in C609 / R609C3: got 'NA'

    ## Warning: Expecting numeric in G609 / R609C7: got 'NA'

    ## Warning: Expecting numeric in H609 / R609C8: got 'NA'

    ## Warning: Expecting numeric in C610 / R610C3: got 'NA'

    ## Warning: Expecting numeric in G610 / R610C7: got 'NA'

    ## Warning: Expecting numeric in H610 / R610C8: got 'NA'

    ## Warning: Expecting numeric in C616 / R616C3: got '1981, 1982'

    ## Warning: Expecting numeric in C617 / R617C3: got '1981-1983'

    ## Warning: Expecting numeric in C623 / R623C3: got 'NA'

    ## Warning: Expecting numeric in G665 / R665C7: got 'NA'

    ## Warning: Expecting numeric in H665 / R665C8: got 'NA'

    ## Warning: Expecting numeric in C676 / R676C3: got '2017-18'

    ## Warning: Expecting numeric in G687 / R687C7: got 'NA'

    ## Warning: Expecting numeric in H687 / R687C8: got 'NA'

    ## Warning: Expecting numeric in C697 / R697C3: got '1974, 1975'

    ## Warning: Expecting numeric in C715 / R715C3: got 'NA'

    ## Warning: Expecting numeric in C741 / R741C3: got '2009-2010'

    ## Warning: Expecting numeric in C755 / R755C3: got '2009-2011'

    ## Warning: Expecting numeric in C756 / R756C3: got a date

    ## Warning: Expecting numeric in G792 / R792C7: got 'NA'

    ## Warning: Expecting numeric in H792 / R792C8: got 'NA'

    ## Warning: Expecting numeric in C827 / R827C3: got '2015, 2016'

    ## Warning: Expecting numeric in C840 / R840C3: got '2006, 2007'

    ## Warning: Expecting numeric in C860 / R860C3: got '2015, 2016, 2017'

    ## Warning: Expecting numeric in C925 / R925C3: got '1994, 1995, 1996'

    ## Warning: Expecting numeric in G928 / R928C7: got 'NA'

    ## Warning: Expecting numeric in H928 / R928C8: got 'NA'

    ## Warning: Expecting numeric in G950 / R950C7: got 'NA'

    ## Warning: Expecting numeric in H950 / R950C8: got 'NA'

    ## Warning: Expecting numeric in C951 / R951C3: got 'NA'

    ## Warning: Expecting numeric in G951 / R951C7: got 'NA'

    ## Warning: Expecting numeric in H951 / R951C8: got 'NA'

    ## Warning: Expecting numeric in G952 / R952C7: got 'NA'

    ## Warning: Expecting numeric in H952 / R952C8: got 'NA'

    ## Warning: Expecting numeric in G953 / R953C7: got 'NA'

    ## Warning: Expecting numeric in H953 / R953C8: got 'NA'

    ## Warning: Expecting numeric in G954 / R954C7: got 'NA'

    ## Warning: Expecting numeric in H954 / R954C8: got 'NA'

``` r
head(Internships)
```

    ## # A tibble: 6 × 10
    ##   Name    Term   Year `Internship Site` Title (if applicable…¹ Location Latitude
    ##   <chr>   <chr> <dbl> <chr>             <chr>                  <chr>       <dbl>
    ## 1 Auciel… NA       NA Prior Fulfillmen… Photographer           NA          NA   
    ## 2 Amin, … Fall   2002 Institute for Su… Intern                 Addis A…     9.04
    ## 3 Brandv… Summ…  2002 Savannah River E… Research Assistant     Aiken, …    33.6 
    ## 4 Edmond… Summ…  2003 Santa Ana Refuge  Intern                 Alamo, …    26.2 
    ## 5 Garcia… Fall   2012 Santa Ana Nation… Intern                 Alamo, …    26.2 
    ## 6 Anders… Summ…  2020 US Committee for… Refugee Services Stud… Albany,…    42.7 
    ## # ℹ abbreviated name: ¹​`Title (if applicable)`
    ## # ℹ 3 more variables: Longitude <dbl>, `Notes (if any)` <chr>,
    ## #   `Notes on Location` <chr>

``` r
glimpse(Internships)
```

    ## Rows: 953
    ## Columns: 10
    ## $ Name                    <chr> "Auciello, Shlomit", "Amin, Muktar", "Brandvai…
    ## $ Term                    <chr> "NA", "Fall", "Summer", "Summer", "Fall", "Sum…
    ## $ Year                    <dbl> NA, 2002, 2002, 2003, 2012, 2020, 1998, 2017, …
    ## $ `Internship Site`       <chr> "Prior Fulfillment of Internship Requirement",…
    ## $ `Title (if applicable)` <chr> "Photographer", "Intern", "Research Assistant"…
    ## $ Location                <chr> "NA", "Addis Ababa, Ethiopia", "Aiken, South C…
    ## $ Latitude                <dbl> NA, 9.035829, 33.561617, 26.183685, 26.196339,…
    ## $ Longitude               <dbl> NA, 38.752413, -81.722458, -98.123064, -98.108…
    ## $ `Notes (if any)`        <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
    ## $ `Notes on Location`     <chr> "For coordinates: https://www.gps-coordinates.…

I think this delim does not work because I already read in the data for
Year as numeric. That already took out the ones with multiple years. But
if I do not read it in as numeric, I get lots of problems later on, so
maybe we should just make the data more suitable? The leaflet would show
just one year column anyways, so why not pick the first year given to us
before reading in the data. How relevant is it that they stayed at the
site for 2-3 years? Most of them are from a long time ago anyways.

``` r
#Internships %>%
  #filter(is.na(Year) == FALSE, Year != "NA") %>%
  #separate_longer_delim(Year, delim = ", ")
```

## 3. Data analysis plan

General analysis of data

``` r
Internships |>
  filter(as.numeric(Year) %in% 1973:2023) |>
ggplot(aes(x = Year)) +
  geom_histogram()
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](analysis_files/figure-gfm/years-spread-1.png)<!-- -->

There are 237 distinct titles for people’s internships. The entries
should be checked for spelling errors, such as Reaserch instead of
Research. They should also be grouped, e.g. farm apprentice, farm
assistant, farm hand, farm intern. Make it more explicit when people
fill out the internship report to choose from a couple of specific
options that e.g. do not contain the type of institution (“Farm”).

``` r
Internships %>%
  group_by( `Title (if applicable)`) %>%
  count() %>%
  arrange(desc(n))
```

    ## # A tibble: 247 × 2
    ## # Groups:   Title (if applicable) [247]
    ##    `Title (if applicable)`     n
    ##    <chr>                   <int>
    ##  1 Intern                    516
    ##  2 NA                         63
    ##  3 Research Assistant         48
    ##  4 Reaserch Assistant         18
    ##  5 Student Teacher            12
    ##  6 Apprentice                  5
    ##  7 Assistant                   5
    ##  8 Field Assistant             5
    ##  9 Teacher Assistant           5
    ## 10 Camp Counselor              4
    ## # ℹ 237 more rows

# Leaflet

``` r
labels <- sprintf("<strong>%s</strong><br/> %s<br/> %s", 
                  Internships$`Internship Site`, Internships$Location, Internships$Year) |>
  lapply(htmltools::HTML)
```

``` r
leaflet() %>%
  addTiles() %>%
  addMarkers(data = Internships,
              label = labels) 
```
