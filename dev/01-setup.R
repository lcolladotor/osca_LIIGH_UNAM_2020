## Create README.Rmd
usethis::use_readme_rmd()

## Install xaringan and the theme manager
install.packages('xaringan')
devtools::install_github("gadenbuie/xaringanthemer")


## Made 00-template.Rmd
## Now populate all the template Rmd files
readme_content <- readLines('README.Rmd')
patt <- '[0-9]+\\. '
titles_i <- grep(patt, readme_content)
titles <- gsub(patt, '', readme_content[titles_i])


for(i in seq_along(titles)) {
    ## Replace title
    new_rmd_content <- readLines('00-template.Rmd')
    new_rmd_content <- gsub('Template', titles[i], new_rmd_content)

    ## From https://stackoverflow.com/questions/5812493/how-to-add-leading-zeros
    new_rmd <- paste0(sprintf('%02d', i), '-', gsub(' ', '-', tolower(titles[i])), '.Rmd')
    writeLines(new_rmd_content, new_rmd)

    ## knit
    rmarkdown::render(new_rmd)

    ## update the title content
    titles[i] <- paste0('1. [', titles[i], '](', gsub('Rmd', 'html', new_rmd), ')')
}

readme_content[titles_i] <- titles
writeLines(readme_content, 'README.Rmd')
rmarkdown::render('README.Rmd')
unlink('README.html')

