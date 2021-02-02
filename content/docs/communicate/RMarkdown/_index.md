---
title: "R Markdown"
---

<script src="/rmarkdown-libs/kePrint/kePrint.js"></script>
<link href="/rmarkdown-libs/lightable/lightable.css" rel="stylesheet" />
<script src="/rmarkdown-libs/htmlwidgets/htmlwidgets.js"></script>
<script src="/rmarkdown-libs/jquery/jquery.min.js"></script>
<link href="/rmarkdown-libs/datatables-css/datatables-crosstalk.css" rel="stylesheet" />
<script src="/rmarkdown-libs/datatables-binding/datatables.js"></script>
<link href="/rmarkdown-libs/dt-core/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="/rmarkdown-libs/dt-core/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="/rmarkdown-libs/dt-core/js/jquery.dataTables.min.js"></script>
<link href="/rmarkdown-libs/crosstalk/css/crosstalk.css" rel="stylesheet" />
<script src="/rmarkdown-libs/crosstalk/js/crosstalk.min.js"></script>

# R Markdown

## The Bigger Picture

In this document we learn how to create and manipulate R Markdown documents. Simply put, we are learning how to create documents, slideshows, websites and reports to produce and communicate the visualisations created earlier on. In the overall context of the workflow, this falls into the category of producing our presentations.

<center>
<img src = "images/workflowschematic.JPG" width="80%" class="ImageBorder"> </img>
</center>
 
<center>
<img src = "images/workflow.JPG" width="80%" class="ImageBorder"> </img>
</center>

`{{<expand "Note: LinkedIn Learning videos" "...">}} There are references to LinkedIn Learning videos. These are complementary but not really required as the notes below are meant to be self-contained. Some students and staff would have access for free. Do not purchase access unless you are sure you don’t have access through your organisation already. {{</expand>}}`

## What is R Markdown?

> [LinkedIn Learning 1.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/what-is-markdown)

> [LinkedIn Learning 1.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/what-is-r-markdown)

### Markup Languages

-   R Markdown is a markup language
-   Markup langages are systems for annotating documents and other media
-   Some other markup languages are:
    -   Markdown (different from R Markdown!)
    -   LaTeX
    -   HTML

### How does R Markdown work?

-   R Markdown begins by looking like a weird R script with its own special syntax
-   R Markdown documents have the special file extension `.Rmd`
-   It includes chunks of R code, and possibly some snippets of other languages
-   After we “knit” the document together (according to how we specify), it looks like a nicely rendered form of media
-   The document you are currently reading was built in R Markdown!

<center>
<img src = "images/thisdocument.JPG" width="50%" class="ImageBorder"> </img>
</center>

### What can R Markdown do?

There are three broad types of documents R Markdown can produce. Note that each have sub-categories, and other document types exist. See [here](https://rmarkdown.rstudio.com/lesson-9.html) for more information.

#### PDF

> [LinkedIn Learning 1.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/writing-pdf-reports-in-r-markdown)

-   These documents always look the same
-   They cannot be edited without leaving a ‘footprint’ (the edits will be noticeable!)
-   They can be password protected

#### HTML Reports

> [LinkedIn Learning 1.4](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/writing-html-reports-in-r-markdown)

-   Documents which can be put online
-   They are easily viewable on mobile
-   These reports can interact with htmlwidgets (moving objects, responsive to the viewer’s behaviour!)

#### HTML Presentations

> [LinkedIn Learning 1.5](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/writing-html-presentations-in-r-markdown)

-   These are HTML documents comparable to a slideshow presentation
-   There are several preset styles
-   Some styles are very customisable

#### Other Media

> [LinkedIn Learning 1.6](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/what-else-can-you-build-with-r-markdown)

R Markdown can also produce:

-   Microsoft PowerPoint presentations
-   Microsoft Word documents
-   Blog-style webpages (Blogdown)
-   Multi-chapter books and reference documents (Bookdown)

## LaTeX, BibTeX and TeX

> [LinkedIn Learning 2.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/what-are-latex-and-bibtex)

### LaTeX

-   LaTeX is a markup language like R Markdown
-   It is heavily used in academia for its ability to create mathematical formulae with ease and precision
-   We can call LaTeX in R Markdown if we configure RStudio correctly

### BibTeX

-   A reference management software for LaTeX
-   It is required to customise the appearance and layout of all PDF documents in R Markdown

### TeX

-   A typesetting system which encompasses LaTeX
-   Developed with LaTeX partly to process mathematical formulae
-   LaTeX is **one distribution** of TeX

## Installing TeX

> [LinkedIn Learning 2.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/setting-up-tex-for-generating-r-markdown-reports)

This installation is needed to call upon several functions of R Markdown. Depending on your operating system, the installation for TeX will be one of these options:

|                       macOS                       |                  Linux                  |                       Windows                       |
|:-------------------------------------------------:|:---------------------------------------:|:---------------------------------------------------:|
| Go to <http://www.tug.org/mactex> and install TeX | Run `sudo apt-get install texlive-full` | Go to <https://miktex.org/download> and install TeX |

After the installation, RStudio will automatically be able to detect TeX on your computer.

## Installing Pandoc

> [LinkedIn Learning 2.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/installing-pandoc)

-   Pandoc is a software which can convert files from one markup format to another
-   This is what will convert our `.Rmd` (R Markdown) files to other, more useful formats
-   Make sure the latest version of Pandoc is installed on your computer by visiting <https://pandoc.org/installing.html>

## The R Markdown Package

> [LinkedIn Learning 3.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/installing-r-markdown)

R Markdown must be installed as a package through R Studio by running the following:

``` r
install.packages("rmarkdown")
```

-   R Markdown is now almost up and running
-   The final step is to watch for RStudio warning that extra packages need to be installed for R Markdown to operate
-   A pop-up may or may not appear, depending on the current version of `rmarkdown`

<center>
<img src = "images/install.png" width="40%" class="ImageBorder"> </img>
</center>

Once these are installed, R Markdown is ready for use!

## The R Markdown interface

> [LinkedIn Learning 3.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/r-markdown-knitting-and-generating-outputs)

**Reminder: R Markdown files are of the type `.Rmd`**

-   When we’re in RStudio, we create a new R Markdown document
-   It is recommended to do this in a new (or existing) *R Project*
-   Navigate to `File`()`New File`()`Rmarkdown...`
-   This menu will appear.

<center>
<img src = "images/newrmd.JPG" width="40%" class="ImageBorder"> </img>
</center>

-   We are immediately forced to make a choice, however, no selection we make is permanent
-   By default, we will begin by working in an HTML document
-   When we select OK, we have an R Markdown document in front of us

<center>
<img src = "images/newrmd2.JPG" width="40%" class="ImageBorder"> </img>
</center>

-   If we save this document, it will appear in our files tab

<center>
<img src = "images/newrmd3.JPG" width="30%" class="ImageBorder"> </img>
</center>

-   The document currently appears to look like a script
-   We use the “Knit” button to compile this script into the document type we chose

<center>
<img src = "images/newrmd4.JPG" width="30%" class="ImageBorder"> </img>
</center>
 
<center>
<img src = "images/newrmd5.JPG" width="40%" class="ImageBorder"> </img>
</center>

-   We are also able to freely modify the text in the `.Rmd` file
-   This is our first step to creating our own reports

<center>
<img src = "images/newrmd6.JPG" width="30%" class="column"> </img>
</center>
<center>
<img src = "images/newrmd7.JPG" width="40%" class="column"> </img>
</center>
<div style="clear: both;">

## The YAML Header

> [LinkedIn Learning 3.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/the-yaml-header-of-an-rmd-file)

-   YAML is a standard for configuration files
-   By modifying the “YAML header,” we configure our R Markdown file
-   The YAML header is everything between the two `---`
-   It is automatically generated when we create a document
-   In this format, indentation matters, so when we modify our headers we must be careful

### Basic options:

-   The `title`, `author` and `date` options are self-explanatory
-   The `output` option dictates the document we produce when we Knit (by default it is set to whatever we selected when creating the document)
-   Some output styles (which we will cover) are:
    -   `html_document` and `bookdown::html_document2`
    -   `pdf_document` and `bookdown::pdf_document2`
    -   `slidy_presentation`
    -   `ioslides_presentation`
    -   `beamer_presentation`

### Additional options:

-   There are very many different fields we can add to the YAML header
-   Some are simple to include and require only one line, such as the `subtitle` field added below
-   Others are more complex and must be formatted by several layers of indentation, such as the `toc` field

<center>
<img src = "images/yaml1.JPG" width="40%" class="column"> </img>
</center>
<center>
<img src = "images/yaml2.JPG" width="40%" class="column"> </img>
</center>

-   We will introduce a few more fields later on, but here are lists of [useful PDF-relevant fields](https://bookdown.org/yihui/rmarkdown/pdf-document.html) and [useful HTML-relevant fields](https://bookdown.org/yihui/rmarkdown/html-document.html)

## Code Chunks

> [LinkedIn Learning 3.4](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/code-chunks-and-global-code-chunk-settings)

R Markdown is enormously useful for its ability to display and run code.

### Creating Code Chunks

``` r
text <- "R Markdown is cool"
print(text)
```

    ## [1] "R Markdown is cool"

``` r
x = seq(-5,5,0.1)
y = x^2
plot(x,y)
```

<div class="figure" style="text-align: center">

<img src="/docs/communicate/RMarkdown/_index_files/figure-html/code1-1.png" alt="*Fig 1: A nice parabola.*" width="40%" />
<p class="caption">
Figure 1: *Fig 1: A nice parabola.*
</p>

</div>

-   “Code chunks” are small, dedicated sections of the R Markdown document which come with their own options for displaying or running code
-   We begin a code chunk with three backticks (\`s) and end it with three backticks
-   After the three backticks we have a section of curly brackets (`{ }`)
-   In these backticks, we state the language we are coding in, then type a space, then name the code chunk
-   **Warning**: never give two code chunks in the same document the same name, or the document will not compile

<center>
<img src = "images/codechunks1.JPG" width="40%" class="ImageBorder"> </img>
</center>

-   The above code runs and produces the code shown above

### Code Chunk options

#### Global Chunk options

-   When creating chunks, all options are set to a “global” default which spans the entire document
-   These default options are specified in the chunk called `setup`, which is automatically generated at the beginning of our `.Rmd` file
-   The `opts_chunk$set()` function can set any default chunk options, and we can modify this to include whatever options we need

<center>
<img src = "images/codechunks2.JPG" width="40%" class="column"> </img>
</center>
<center>
<img src = "images/codechunks3.JPG" width="40%" class="column"> </img>
</center>
<div style="clear: both;">

#### Local Chunk options

-   Local chunk options are specified from within one chunk and are listed in the curly brackets (`{ }`)
-   They overwrite global options (that means that any local chunk option is obeyed, rather than the default)

<center>
<img src = "images/codechunks4.JPG" width="40%" class="ImageBorder"> </img>
</center>

#### List of options

|   Option    |    Argument    |
|:-----------:|:--------------:|
|  `include`  | TRUE or FALSE  |
|   `echo`    | TRUE or FALSE  |
|  `message`  | TRUE or FALSE  |
|  `warning`  | TRUE or FALSE  |
| `out.width` | “40%” or 300px |
|  `fig.cap`  |   “Caption”    |
| `fig.align` | ‘center,’ etc  |

[For the long, full list of options, see this link.](https://yihui.name/knitr/options/#plots)

## Running code in R Markdown documents

> [LinkedIn Learning 3.5](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/writing-and-running-r-code-in-r-markdown-files)

### Specifying output

We can choose how code output is displayed in RStudio.

-   We go to the “cog” icon and we can select from displaying output inline or in console

<center>
<img src = "images/output1.JPG" width="40%" class="ImageBorder"> </img>
</center>

Output inline VS output in console:

<img src = "images/output2.JPG" class="column"> </img>
<img src = "images/output3.JPG" class="column"> </img>
<div style="clear: both;">

### Running individual lines

-   To run individual lines is the same as in an R script
-   If a line has been selected, CTRL+ENTER will run the line

### Running from chunks

-   There are two buttons in every code chunk
-   The first runs all code above a chunk
    -   This is very useful if lots of our code is inter-dependent
-   The second runs just the current chunk

<center>
<img src = "images/runchunks1.JPG" width="40%" class="ImageBorder"> </img>
</center>

### The Run button

-   This button prodivdes a list of options for running chunks

<center>
<img src = "images/runchunks2.JPG" width="40%" class="ImageBorder"> </img>
</center>

## Sectioning R Markdown documents

> [LinkedIn Learning 3.6](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/splitting-documents-into-sections-or-slides-in-r-markdown)

### Sectioning in standard documents

-   In R Markdown, the hash (`#`) symbol is used for headings
-   One hash, \#, is an ‘h1’ heading (the largest)
-   Two hashes, \#\#, is an ‘h2’ heading (slightly less large)
-   This goes all the way to six hashes, \#\#\#\#\#\#, for the smallest subheading
-   Each heading can be formatted to be different (see `.css` files below), but by default, the more “sub” the heading is, the smaller the font

Our R Markdown code VS its PDF output VS its HTML output

<img src = "images/heading1.JPG" width="30%" class="triple">
<img src = "images/heading2.JPG" width="30%" class="triple">
<img src = "images/heading3.JPG" width="30%" class="triple">
<div style="clear: both;">

### Sectioning in slides

-   If we are working with a slideshow document, headings and the hash (`#`) symbol also serve as slide headings
-   As an example, we can do this in the `slidy_presentation` format (discussed below)

<center>
<img src = "images/slides1.JPG" width="40%" class="column" > </img>
</center>
<center>
<img src = "images/slides2.JPG" width="40%" class="column" > </img>
</center>
<div style="clear: both;">

## Tabsets

> [LinkedIn Learning 3.7](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/tabbed-sections-in-r-markdown-html-reports)

-   **Note**: this will ***only*** work with the `html_document` formatting
-   Tabset options can create sophisticated headings
-   If we write `{.tabset}` immediately after a heading, the subheadings will be condensed into a selection bar

<img src = "images/tabset1.JPG" class="column" > </img>
<img src = "images/tabset2.JPG" class="column" > </img>
<div style="clear: both;">

-   If we write `{.tabset .tabset-dropdown}`, this selection bar will be a dropdown menu instead

<img src = "images/tabset3.JPG" class="column" > </img>
<img src = "images/tabset4.JPG" class="column" > </img>
<div style="clear: both;">

## R Markdown text options

> [LinkedIn Learning 3.8](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/formatting-text-in-r-markdown-files) and

> [LinkedIn Learning 3.9](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/bullets-and-lists-in-r-markdown)

| Feature           | Implementation                                                                                                  |
|:------------------|:----------------------------------------------------------------------------------------------------------------|
| Bold              | Surround text by `**` or `__`                                                                                   |
| Italics           | Surround text by `*`                                                                                            |
| Strikethrough     | Surround text by `~~`                                                                                           |
| Superscript       | Surround text by `^`                                                                                            |
| Code font         | Surround text by backticks (\`s)                                                                                |
| Bullet points     | `-` then space at the beginning of a line, and repeat on the next line                                          |
| Sub-bullet points | Four spaces, then `-` at the beginning of a line, and repeat on the next line                                   |
| Numbered list     | `1.` then space at the beginning of the line, and repeat on the next line (type the number one (1) repeatedly!) |
| New paragraph     | Two spaces at the end of a line                                                                                 |

<img src = "images/text1.JPG" class="column" > </img>
<img src = "images/text2.JPG" class="column" > </img>
<div style="clear: both;">

Here’s an [R Markdown cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf) to help remember all these formats!

## Referencing

References in R Markdown is done by placing a caret (`^`) wherever we desire to put a reference, then typing the reference in square brackets immediately after.

``` null
A reference may look like this!^[Mann, H. (2019)]
```

A reference may look like this![^1]

## Code Chunk Navigation and Naming Convention

> [LinkedIn Learning 4.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/name-your-code-chunks-sensibly)

-   Technically, R Markdown does not require any code chunks to be named
-   It is, however, always a good idea to name code chunks for debugging and readability purposes
-   The `namer` package can be installed to automatically name chunks in a script
-   However, for large scripts, naming code chunks appropriately is the recommended approach
-   This makes navigation through an `.Rmd` file much easier

As an example, consider a very large `.Rmd` file containing material on the `ggplot` package:

<center>
<img src = "images/codechunknavigation.JPG" width="40%" class="ImageBorder"> </img>
</center>

The button at the bottom of the script tab provides instand navigation between headings and code chunks in an `.Rmd` file. This navigation becomes much clearer with appropriate code chunk names.

## Including Code from Script Files

> [LinkedIn Learning 4.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/including-code-from-script-files)

-   If we have a script file saved in our project folder, we can call on it with the `source()` command

``` r
source("script.R")
```

    ## [1] "I have been called from script.R!"

## Different Slide Formats

> [LinkedIn Learning 5.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/what-are-slidy-ioslides-and-beamer)

There are three types of slides formats R Markdown, with their own strengths and weaknesses:

-   Ioslides (`output: ioslides_presentation`)
-   Slidy (`output: slidy_presentation`)
-   Beamer (`output: beamer_presentation`)

Ioslides and Slidy produce HTML output whereas Beamer produces PDF output.

### Ioslides

> [LinkedIn Learning 5.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/features-of-ioslides-presentations)

<img src = "images/ioslides.JPG" width = "50%" class="ImageBorder">

-   Creates HTML slides
-   Designed by Google for their 2010 I/O conference
-   Almost no customisability
-   Works well on mobile
-   Built in with hotkey functions:

| Hotkey |         Effect          |
|:------:|:-----------------------:|
|  `w`   |  Toggle to widescreen   |
|  `o`   |   Toggle to overview    |
|  `h`   |   Highlight code line   |
|  `p`   | Include presenter notes |

Highlighting lines of code requires the use of this unique syntax:

<img src = "images/highlight1.JPG" class="triple">
<img src = "images/highlight2.JPG" class="triple">
<img src = "images/highlight3.JPG" class="triple">
<div style="clear: both;">

Creating presenter notes (slides that can only be shown by pressing `p`) requires wrapping the content by some HTML:

<img src = "images/presenter1.JPG" class="triple">
<img src = "images/presenter2.JPG" class="triple">
<img src = "images/presenter3.JPG" class="triple">
<div style="clear: both;">

### Slidy

> [LinkedIn Learning 5.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/features-of-slidy-presentations)

-   Creates HTML slides
-   Slidy is the best choice for making custom HTML slides with custom `.css` files
-   By default they are very minimal
-   Also built with hotkeys

| Hotkey |                  Effect                  |
|:------:|:----------------------------------------:|
|  `c`   |        Opens a table of contents         |
|  `a`   | Converts the slides to a linear document |
|  `s`   |            Makes font smaller            |
|  `b`   |            Makes font bigger             |
|  `f`   |            Removes the footer            |

By manipulating the YAML header, we can add a timer to the footer:

``` null
output:
  slidy_presentation:
    duration: 2
```

Here is a set of Slidy slides produced with and without custom `.css` styles:

<img src = "images/slidy1.JPG" class="column">
<img src = "images/slidy2.JPG" class="column">
<div style="clear: both;">

[Credit to alblaine](https://github.com/alblaine/countess/blob/master/styles.css) for the style!

### Beamer

> [LinkedIn Learning 5.4](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/pdf-presentations-with-beamer)

-   Creates PDF slides
-   Based on the LaTeX class “Beamer”
-   Many different styles are available online
-   Knowledge of LaTeX is required to do certain features, such as including slide numbers

Here is the default Beamer VS one with custom styles:

<img src = "images/beamer1.JPG" class="column">
<img src = "images/beamer2.JPG" class="column">
<div style="clear: both;">

Including custom styles is achieved in two steps:

1.  Modifying the YAML header as such

``` null
output:
  beamer_presentation:
    includes:
      in_header: styles/styles.tex
```

1.  Creating a `.tex` file in our project in the directory `slides/styles.tex`

These few commands (written in your LaTeX file) will allow you to make a few changes to your slides:

-   Add custom colours and themes to your slides
-   Go to [the Beamer gallery](http://deic.uab.es/~iblanes/beamer_gallery/) to find themes and colours you like!

``` null
\usetheme{THEME_NAME}
\usecolortheme{COLOUR_THEME_NAME}
```

-   Add slide numbers to your slides

``` null
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}[page number]
```

## Controlling Chart Output

> [LinkedIn Learning 6.1 - 6.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/ggplot2-and-plots-in-r-markdown-documents)

-   We produce graphs in R Markdown by putting the relevant code in code chunks and then running them
-   This works with normal code and `ggplot2` code

``` r
# Base R plot
x = seq(-5,5,0.1)
y = x^2
plot(x,y)

# ggplot2 plot
library("tidyverse")
```

<img src="/docs/communicate/RMarkdown/_index_files/figure-html/chart_output1-1.png" width="60%" style="display: block; margin: auto;" />

``` r
load("tidy_EnvAcc_data/consumption.rdata")
consumption %>%
  ggplot() +
  geom_col(aes(x = year,
               y = water_consumption,
               fill = State))
```

<img src="/docs/communicate/RMarkdown/_index_files/figure-html/chart_output1-2.png" width="60%" style="display: block; margin: auto;" />

`fig.width` and `fig.height` can only take numeric arguments, and one or both can be specified. Measurements are in inches. Generally used for PDF.

<img src = "images/chart_output1.JPG" width = "50%" class="ImageBorder">

<img src="/docs/communicate/RMarkdown/_index_files/figure-html/chart_output2-1.png" width="60%" style="display: block; margin: auto;" />

`fig.width` and `fig.asp` (also numeric, often between 0 and 1) can both be specified, and figure height will be determined based on `fig.asp`.

<img src = "images/chart_output2.JPG" width = "50%" class="ImageBorder">

<img src="/docs/communicate/RMarkdown/_index_files/figure-html/chart_output3-1.png" width="60%" style="display: block; margin: auto;" />

`out.width` and `out.height` can take several arguments. Generally we use a character string to specify percentage or pixel measurement (eg out.width = “40%” or out.width = “480px”). However, `out.height` cannot overwrite the aspect ratio, and so it has limited usefulness.

Take note that these options can take some special LaTeX arguments as well. See [here under “out.width, out.height”](https://yihui.name/knitr/options/#plots).

<img src = "images/chart_output3.JPG" width = "50%" class="ImageBorder">

<img src="/docs/communicate/RMarkdown/_index_files/figure-html/chart_output4-1.png" width="50%" style="display: block; margin: auto;" />

Of course, all chunk options can also be modified globally.

## Images and R Markdown

### Images with Knitr

> [LinkedIn Learning 7.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/inserting-images-with-include-graphics)

If you know the directory to your image, you can use `include_graphics()` from the `knitr` package to output the image as a figure. It will be responsive to chunk figure options.

``` r
knitr::include_graphics("images/Rlogo.svg")
```

<img src="images/Rlogo.svg" width="20%" style="display: block; margin: auto;" />

### Images with Raw HTML

> [LinkedIn Learning 7.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/inserting-images-using-raw-html)

**Keep in mind**: HTML images (that is, images included using this html code) can only be inserted into HTML documents.

With even no understanding of HTML, inserting images is very simple. HTML can be pasted directly into an R Markdown file.

`src` specifies the file path of the image.

``` null
<img src = "images/Rlogo.svg" width = "20%">
```

<img src = "images/Rlogo.svg" width = "20%">

The image can easily be centred with the centre tag.

``` null
<center> <img src = "images/Rlogo.svg" width = "20%"> </center>
```

<center>
<img src = "images/Rlogo.svg" width = "20%">
</center>

HTML images are extremely tweakable, but require knowledge of HTML!

### Images with Raw LaTeX

> [LinkedIn Learning 7.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/inserting-images-using-raw-latex)

**Keep in mind**: LaTeX insertion can only be done in PDF documents.

LaTeX insertion, like HTML, is relatively simple to use. With LaTeX knowledged, images become extremely tweakable. This LaTeX can be pasted directly into an R Markdown script and run.

The argument in curly brackets specifies the file path of the image.

``` null
\includegraphics{images/Rlogo.JPG}
```

<center>
<img src = "images/lateximage.JPG" width = "30%">
</center>

We can adjust the size using some LaTeX as well.

``` null
\includegraphics[width = 5cm]{images/Rlogo.JPG}
```

## Tables

> [LinkedIn Learning 8.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/displaying-tables-in-r-markdown)

We can display tables in R Markdown in two ways.

1.  As an R Markdown formatted table
2.  As the output from code

The first option is fixed: there is only one method for creating R Markdown formatted tables. However, code output can be configured in several ways.

### R Markdown Formatted Tables

> [LinkedIn Learning 8.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/markdown-tables-in-rmd)

Let’s consider a table and how it is formatted. The following table describes the capabilities of HTMLwidgets packages in R:

| Library     | Charts | Maps | Networks | Tables |
|:------------|:------:|:----:|:--------:|:------:|
| DT          |   No   |  No  |    No    |  Yes   |
| Highcharter |  Yes   | Yes  |    No    |   No   |
| Leaflet     |   No   | Yes  |    No    |   No   |
| Plotly      |  Yes   | Yes  |    No    |   No   |
| visNetwork  |   No   |  No  |   Yes    |   No   |

-   Formatting tables relies heavily on the vertical bar (`|`) key
-   First we write the column headings
-   Then we specify the alignment of column words
-   Lastly we fill our final rows with data

Using our example, the first line of the table looks like this:

``` null
| Library | Charts | Maps | Networks | Tables |
```

-   We simply separate our column headings with bars

Our second line will have the same number of entries as our table above, spaced with bars. In each entry we type one of:

-   `:-:` (centre text for the column)
-   `:-` (text wraps left)
-   `-:` (text wraps right)

In our example, the “Library” column wraps left, and the remaining table entries are cetred, so our second line looks like this:

``` null
| :- | :-: | :-: | :-: | :-: |
```

We then simply enter our data, spacing with bars. The whole table looks like this:

``` null
| Library | Charts | Maps | Networks | Tables |
| :- | :-: | :-: | :-: | :-: |
| DT | No | No | No | Yes |
| Highcharter | Yes | Yes | No | No |
| Leaflet | No | Yes | No | No |
| Plotly | Yes | Yes | No | No |
| visNetwork | No | No | Yes | No |
```

## Kable Tables and other tables

> [LinkedIn Learning 8.3 - 8.5](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/formatting-printed-data-frames-and-tibbles),

We can print out tables using R code in R Markdown. `consumption` is a tibble created using the Tidyverse package:

``` r
head(consumption)
```

    ## # A tibble: 6 x 3
    ##   State year    water_consumption
    ##   <chr> <chr>               <dbl>
    ## 1 NSW   2008–09              4555
    ## 2 VIC   2008–09              2951
    ## 3 QLD   2008–09              3341
    ## 4 SA    2008–09              1179
    ## 5 WA    2008–09              1361
    ## 6 TAS   2008–09               466

We can also use the `kable()` function from `knitr` to print tables that appear to be much nicer in R Markdown. We simply pipe our data through the function:

``` r
head(consumption) %>%
  knitr::kable()
```

| State | year    | water\_consumption |
|:------|:--------|-------------------:|
| NSW   | 2008–09 |               4555 |
| VIC   | 2008–09 |               2951 |
| QLD   | 2008–09 |               3341 |
| SA    | 2008–09 |               1179 |
| WA    | 2008–09 |               1361 |
| TAS   | 2008–09 |                466 |

We can also customise the way these tables look if we install the `kableExtra` package:

``` r
library("knitr")
library("kableExtra")

head(consumption) %>%
  kable() %>%
  kable_styling(bootstrap_options = "striped")
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
State
</th>
<th style="text-align:left;">
year
</th>
<th style="text-align:right;">
water\_consumption
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
NSW
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
4555
</td>
</tr>
<tr>
<td style="text-align:left;">
VIC
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
2951
</td>
</tr>
<tr>
<td style="text-align:left;">
QLD
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
3341
</td>
</tr>
<tr>
<td style="text-align:left;">
SA
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
1179
</td>
</tr>
<tr>
<td style="text-align:left;">
WA
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
1361
</td>
</tr>
<tr>
<td style="text-align:left;">
TAS
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
466
</td>
</tr>
</tbody>
</table>

`bootstrap_options` is just one modification we can make to our kable tables. See [here](https://www.rdocumentation.org/packages/kableExtra/versions/1.1.0/topics/kable_styling) for the full argument breakdown.

Lastly we note there is a way to make formating tables as kable tables automatic in a document. That is by modifying the YAML header. The `output: html_document` (etc) line should be removed and replaced with:

``` null
output:
  html_document:
    df_print: kable
```

Remember that indentation matters!

**Note**: `df_print: tibble` formats tables as tibbles (from the Tidyverse package) and `df_print: paged` formats tables as HTML tables which support pagination over rows and columns.

As one final option, the `DT` package is able to produce interactive tables we can use with R Markdown. Using the package, we can pipe tibbles or data.frames into the `datatable()` function:

``` r
library("DT")
consumption %>%
  datatable()
```

<div id="htmlwidget-1" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48"],["NSW","VIC","QLD","SA","WA","TAS","NT","ACT","NSW","VIC","QLD","SA","WA","TAS","NT","ACT","NSW","VIC","QLD","SA","WA","TAS","NT","ACT","NSW","VIC","QLD","SA","WA","TAS","NT","ACT","NSW","VIC","QLD","SA","WA","TAS","NT","ACT","NSW","VIC","QLD","SA","WA","TAS","NT","ACT"],["2008–09","2008–09","2008–09","2008–09","2008–09","2008–09","2008–09","2008–09","2009–10","2009–10","2009–10","2009–10","2009–10","2009–10","2009–10","2009–10","2010–11","2010–11","2010–11","2010–11","2010–11","2010–11","2010–11","2010–11","2011–12","2011–12","2011–12","2011–12","2011–12","2011–12","2011–12","2011–12","2012–13","2012–13","2012–13","2012–13","2012–13","2012–13","2012–13","2012–13","2013–14","2013–14","2013–14","2013–14","2013–14","2013–14","2013–14","2013–14"],[4555,2951,3341,1179,1361,466,160,48,4323,2904,3112,1110,1386,464,167,47,5041,2359,2964,1023,1369,371,167,43,6293,3247,3287,1045,1408,368,174,50,8806,4184,3697,1159,1287,395,176,52,7508,3988,4145,1077,1317,390,167,53]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>State<\/th>\n      <th>year<\/th>\n      <th>water_consumption<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":3},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

## Captions with Bookdown

> [LinkedIn Learning 9.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/captions-in-r-markdown) and

> [LinkedIn Learning 9.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/captions-with-bookdown)

Bookdown is an R package that facilitates writing books and long-form media with R Markdown. We use it for for the useful captioning solutions it provides. To use them, however, we must change our output type in the YAML header to special Bookdown outputs. One of:

-   `output: bookdown::pdf_document2`
-   `output: bookdown::html_document2`

For captioning figures, we use the `fig.cap` code chunk option as normal. This will now automatically number figures.

``` r
text <- "R Markdown is cool"
print(text)
```

    ## [1] "R Markdown is cool"

``` r
x = seq(-5,5,0.1)
y = x^2
plot(x,y)
```

<div class="figure" style="text-align: center">

<img src="/docs/communicate/RMarkdown/_index_files/figure-html/caption1-1.png" alt="*A nice parabola.*" width="60%" />
<p class="caption">
Figure 2: *A nice parabola.*
</p>

</div>

For captioning tables, we use the `caption` argument of the `kable` function

``` r
head(consumption) %>%
  knitr::kable(caption = "Water Consumption in Australia")
```

<table>
<caption>
Table 1: Water Consumption in Australia
</caption>
<thead>
<tr>
<th style="text-align:left;">
State
</th>
<th style="text-align:left;">
year
</th>
<th style="text-align:right;">
water\_consumption
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
NSW
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
4555
</td>
</tr>
<tr>
<td style="text-align:left;">
VIC
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
2951
</td>
</tr>
<tr>
<td style="text-align:left;">
QLD
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
3341
</td>
</tr>
<tr>
<td style="text-align:left;">
SA
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
1179
</td>
</tr>
<tr>
<td style="text-align:left;">
WA
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
1361
</td>
</tr>
<tr>
<td style="text-align:left;">
TAS
</td>
<td style="text-align:left;">
2008–09
</td>
<td style="text-align:right;">
466
</td>
</tr>
</tbody>
</table>

For referring to figures or tables, we use the special Bookdown notation `\@ref`. We then specify that we are referencing either a figure or a table, and finally we specify the code chunk we are referencing. In the below examples, replace “label” with the name of the relevant code chunk.

``` null
\@ref(fig:label)
\@ref(tab:label)
```

Here is a reference to the above Figure <a href="#fig:caption1">2</a> , and here is one to the above Table <a href="#tab:caption2">1</a>.

## Custom Styles

> [LinkedIn Learning 10.1](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/using-custom-styles-in-r-markdown)

There are two ways to style R Markdown documents.

-   HTML output types require CSS options in a `.css` file
    -   Recall this includes `html_document`, `bookdown::html_document2` and `slidy_presentation` output
-   PDF output types require LaTeX options in a `.tex` file
    -   Recall this includes `pdf_document`, `bookdown::pdf_document2` and `beamer_presentation` output

## Custom HTML with CSS

> [LinkedIn Learning 10.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/styling-html-reports-in-r-markdown)

CSS is a stylesheet language. We use it to specify the presentation of documents written in HTML or XML. It is simple to find the right code to do whatever you need, online, but we consider the basics here.

Before we format our file, we must create a new `.css` file. The steps to do this are:

1.  In RStudio navigate `File`()`New File`()`Text File`
2.  Save the new file to the relevant project folder
3.  Name the file with the `.css` extension, eg `styles.css`

We must also specify in the YAML header that we will be using these styles in our document. We add the line:

``` null
css: styles.css
```

We now add to the `.css` file. We use CSS syntax to target parts of our document we wish to modify.

``` null
body {
  font-size: 14px; 
  font-family: "Times New Roman";
  background-color: #e0fbff;
} 
```

Here is an example of modifying an element of our document We type `body` to specify we are making changes to the main text. We open our curly brackets (`{ }`) and specify each option on a new line. Each line ends with a semi-colon (`;`). We have changed these options:

-   `font-size` is now 14 pixels
-   `font-family` is now in Times New Roman (ie we have changed the text font)
-   `background-color` is now a shade of light blue selected using [HTML colour codes](https://htmlcolorcodes.com/color-picker/)

Of course, each element has its own options, meaning there are many, many options we can modify altogether. Here are a few in action:

<center>
<img src = "images/css1.JPG" class="column"> </img>
</center>
<center>
<img src = "images/css2.JPG" class="column"> </img>
</center>
<div style="clear: both;">

## Custom PDF with TeX

> [LinkedIn Learning 10.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/styling-pdf-reports-in-r-markdown)

We already know that TeX is the underlying force behind the configuration of PDF documents with R Markdown, so it’s unsurprising that we call on it for our PDF styles.

Before we format our file, we must create a new `.tex` file. The steps to do this are:

1.  In RStudio navigate `File`()`New File`()`Text File`
2.  Save the new file to the relevant project folder
3.  Name the file with the `.sty` extension, eg `pdf_styles.sty`

We must also specify in the YAML header that we will be using these styles in our document. We add the lines:

``` null
header-includes:
  - \usepackage{"pdf_styles.sty"}
```

**Note**: if we wanted to use multiple `.sty` files, we can do this with:

``` null
header-includes:
  - \usepackage{"pdf_styles.sty"}
  - \usepackage{"other_styles.sty"}
```

It takes some knowledge of LaTeX to be able to implement options. Here are a few:

``` null
\usepackage{sectsty}            % Call on a package to modify styles

\sectionfont{\color{red}}       % Change header font
\subsectionfont{\color{blue}}   % Change subheader font

\usepackage{helvet}             % Change font type to Helvetica
```

<center>
<img src = "images/tex2.JPG" width = 60% class="ImageBorder"> </img>
</center>

## Displaying Other Languages

> [LinkedIn Learning 11.2](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/display-latex-or-html-in-rmd-files)

To display HTML, we simply copy some HTML into a code chunk and set the language as `html`. This works for other languages, including `latex` and `markdown` itself.

<center>
<img src = "images/languages1.JPG" width = "40%">
</center>

 

``` html
<div class="row">
  <div class="col-md-6">
    Hello
  </div>
  <div class="col-md-6">
    World!
  </div>
</div>
```

``` latex
\usepackage{my_package}
% latex
```

``` markdown
# Example Heading

Here is an example of some text I could put in R Markdown. My **italics** and *bold* won't display in a code chunk!
```

[See here for some other possible languages](https://rmarkdown.rstudio.com/authoring_knitr_engines.html%23sql).

## Calling on LaTeX in R Markdown

> [LinkedIn Learning 11.3](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/run-latex-in-pdf-documents)

### LaTeX Code

-   If we call on LaTeX code, we can paste it directly
-   R Markdown handles almost all of it fine, but not the following:

| LaTeX symbol | We must write |
|:------------:|:-------------:|
|     `\#`     |     `\\#`     |
|     `\\`     |    `\\\\`     |

-   Also if we are in a code chunk and using LaTeX, we must put a `\\` before the following:
    -   `$`, `%`, `&`, `~`, `_`, `^`, `{, }`

### LaTeX Formatting

To call upon (LaTeX) formatting, we have two options.

-   If we wish to call on a formula in a line, we surround the line with `\(` and `\)`

``` latex
\(X_{t} = \theta X_{t-1} + Z_t + \phi Z_{t-1}\)
```

(X\_{t} = X\_{t-1} + Z\_t + Z\_{t-1})

-   We may also frame a section of LaTeX code with `$$` to render entire sections of formatting

``` latex
$$
\quad
\begin{pmatrix} 
12 & 4 & 1 \\
4/3 & 0.9 & e \\
\pi & 0 & 8 \\
\end{pmatrix}
\quad
$$
```

$$
\quad
\begin{pmatrix} 
12 & 4 & 1 \\
4/3 & 0.9 & e \\
\pi & 0 & 8 \\
\end{pmatrix}`
\quad
$$

## Calling on HTML in R Markdown

> [LinkedIn Learning 11.4](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/run-html-in-r-markdown)

Note that this is only possible in HTML document formats.

Some HTML will run fine and without the need for formatting after being pasted into R Markdown. If this is not the case, code can be framed with special “html\_preserve” framing.

<center>
<img src = "images/rainbow.JPG" width="40%" class="ImageBorder"> </img>
</center>
<h3>
<font color="red">This </font>
<font color="orange">is </font>
<font color="yellow">the </font>
<font color="green">power </font>
<font color="blue">of </font>
<font color="purple">HTML! </font>
</h3>

## Pubishing HTML Documents to the Web

> [LinkedIn Learning 13](https://www.linkedin.com/learning/creating-reports-and-presentations-with-r-markdown-and-rstudio/publishing-with-rpubs-com)

There are two main ways to publish:

-   [RPubs](https://rpubs.com/) is a free platform provided by RStudio
-   [GitHub Pages](https://pages.github.com/) is a free-to-use platform, but requires knowledge of Git

## Using RPubs

**1.** Connect to the [RPubs website](https://rpubs.com/) and register an account

<center>
<img src = "images/rpubs.JPG" width="50%" class="ImageBorder"> </img>
</center>

**2.** Click the “Publish” button from within R Studio. This can be done either from the `.Rmd` file or from the knitted document

<center>
<img src = "images/publish1.JPG" class="column"> </img>
</center>
<center>
<img src = "images/publish2.JPG" class="column"> </img>
</center>
<div style="clear: both;">

**3.** Select “Publish”

<center>
<img src = "images/publish3.JPG" width="40%" class="ImageBorder"> </img>
</center>

**4.** Set a title, description, and choose a slug (the slug is the last part of the URL)

<center>
<img src = "images/publish4.JPG" width="40%" class="ImageBorder"> </img>
</center>

Your document is now public at the available URL!

[^1]: Mann, H. (2019)
