library(tidyverse)
library(RefManageR)
library(gsheet)
library(handlr)
options(encoding = "UTF-8")
# Publications ----

## Peer Reviewed Publication ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=0") %>%
  filter(category=="peer-reviewed") %>%
  select(-category) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_pub.bib", biblatex=T)

## Book Reviews ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=0") %>%
  filter(category=="book review") %>%
  select(-category) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_reviews.bib", biblatex=T)

## Technical Reports ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=1473597883") %>%
  select(-month, -date) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_techreports.bib", biblatex=T)

## Other Publications ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=2085169179") %>%
  select(-category) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_other.bib", biblatex=T)

# Conferences

## International/National ----
gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=318960497") %>%
  filter(category=="intl") %>%
  select(-category, -markdown_name, -markdown_date, -markdown) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_conf_intl.bib", biblatex=T)

## Regional ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=318960497") %>%
  filter(category=="regional") %>%
  select(-category, -markdown_name, -markdown_date, -markdown) %>%
  RefManageR::as.BibEntry() %>%
  RefManageR::WriteBib("bib/anthony_conf_regional.bib", biblatex=T)


## Poster Presentations ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=318960497") %>%
  filter(category=="poster") %>%
  select(-category, -markdown_name, -markdown_date, -markdown) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_conf_posters.bib", biblatex=T)

## Campus and Department Talks ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=318960497") %>%
  filter(category=="campus talk") %>%
  select(-category, -markdown_name, -markdown_date, -markdown) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_conf_talks.bib", biblatex=T)

## Invited Talks ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=318960497") %>%
  filter(category=="invited") %>%
  select(-category, -markdown_name, -markdown_date, -markdown) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_conf_invited.bib", biblatex=T)



## Workshops ----

gsheet2tbl("https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=318960497") %>%
  filter(category=="workshops") %>%
  select(-category, -markdown_name, -markdown_date, -markdown) %>%
  RefManageR::as.BibEntry() %>% 
  RefManageR::WriteBib("bib/anthony_conf_workshops.bib", biblatex=T)


