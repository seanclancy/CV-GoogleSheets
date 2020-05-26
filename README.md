
This repo is for my reproducible CV, built following [JooYoung Seo's Academic CV](https://github.com/jooyoungseo/jy_CV). It primarily uses `vitae`, `bookdown`, and `gsheet` to build the CV.

## CV Data

All CV data is stored in a [GoogleSheet](https://docs.google.com/spreadsheets/d/1qbMpXHXm41q69prUVjpQFfP_mMXjORNxFP_IbAoCuKo/edit#gid=1760172285). Various tabs are pulled into the CV using `gsheet` and further filtered, if needed. They are mostly converted to .bib files using `RefManageR` or vectorized and included as `markdown`.

## Primary Files and Folders

  * `bib` - This folder contains the .bib files generated from GoogleSheets. These form the various bibliographies used throughout the CV.
  * `docs` - This folder contains the main sections of the CV. Each section has its own markdown file.
  * `hyndman` - For rendering the `hyndman` version. I have modified the template stored in the `vitae` library folder. A copy is included in here until I figure out how to point to it.
    + I changed the bullet type and colored it by the headcolor. I also added a package to support tables.
    + The `_bookdown.yml` file points to a different file to generate the skills section, as I could not insert the LaTeX formatting for this section from Awesome-CV into Hyndman. This will eventually point to several different files that render `vitae`'s brief entires (`with`, `what`, `when`, `where`, `why`) differently and thus the data coming from Google needs to be assigned differently.
  
## Updating the CV

All updates to the data happen in the GoogleSheet. When ready to update the CV, I run the commands stored in `update_cv.R`:

```
source("update_bib.R")
bookdown::render_book("index.Rmd")
bookdown::render_book("hyndman/index.Rmd")
```

The first line, `source("update_bib.R")` pulls the latest data from GoogleSheets and updates the .bib files. The second line, `bookdown::render_book("index.Rmd")` knits everything together and produces a PDF with the Awesome-CV format. Likewise, `bookdown::render_book("hyndman/index.Rmd")` creates a CV following the Hyndman format plus my changes.

## Issues

The CV is not perfect. Here are several issues I have encountered and either found a workaround or have not solved *yet*:

  * No (Year, Month) format for many entries
    + I have found that a number of entries, especially technical reports and conferences, do not easily show (Year, Month) date formats required by APA 7. If I do include these (as a `date` field in the .bib files), the listings become out of order. [Apparently, .bib files and CSL (the source of the APA 7 formatting) don't always play nicely](https://github.com/citation-style-language/styles/issues/4825#issuecomment-633665114). Using a `citeproc` .json file would be better, but I'm not sure how to feed from Google into that file type. For now, I have developed three workarounds:
      1. Ignore the (Year, Month) conventions. This is currently my default.
      2. Import these references already written out in the Excel file. This requires a little bit more work, but is easily done. Each reference is on a row, made from columns already used for the .bib files as well as some fancy use of Excel/GoogleSheet's `concatenate` function. This works well, but I feel it is cheating, especially since my CV is mostly conferences right now and I want them to be "legitamtely" produced through `biblatex` and not my own encoding.
      3. Include the (Year, Month) via the `date` field and add a macro to the .CSL file to control how they are sorted. I do not know how to do this.
  * One long url
    + Apparently, there is a URL that is too long and runs off the page a bit before a line break puts the rest on the next line. I will need to see how to change the LaTex rules on how this is controlled. My only workaround right now is to ignore the issue. The Hyndman format does not have this issue.
  * CV Skills Section
    + In the layout designed by JooYoung (I think), the Skills section is hardcoded into the LaTeX template. This is not a problem if I want to only use the `awesomecv` template, however there are aspects of the `hyndman` template I like. I tried to include the relevant LaTeX in the `hyndman` template, but could not get it to work.
      + As a workaround, I recreated to look at feel of the section using the `kable` and `kabelExtra` packages. That works nicely.

## [Check out the CV](https://github.com/acircleda/CV/blob/master/Anthony_Schmidt_CV.pdf)

