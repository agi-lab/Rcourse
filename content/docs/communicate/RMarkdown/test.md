---
title: "The R Logo"
author: "Hugh Mann"
date: "09/08/2019"
output:
  bookdown::html_document2:
    df_print: paged
css: html-styles.css
---



## Parabola


```r
text <- "R Markdown is cool"
print(text)
```

```
## [1] "R Markdown is cool"
```

```r
x = seq(-5,5,0.1)
y = x^2
plot(x,y)
load("tidy_EnvAcc_data/consumption.rdata")
library("tidyverse")
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
## ✓ readr   1.4.0     ✓ forcats 0.5.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

<div class="figure">
<img src="/docs/communicate/RMarkdown/test_files/figure-html/code1-1.png" alt="*A nice parabola.*" width="672" />
<p class="caption">Figure 1: *A nice parabola.*</p>
</div>


```r
head(consumption) %>%
  knitr::kable(caption = "Water Consumption in Australia")
```



Table: Table 1: Water Consumption in Australia

|State |year    | water_consumption|
|:-----|:-------|-----------------:|
|NSW   |2008–09 |              4555|
|VIC   |2008–09 |              2951|
|QLD   |2008–09 |              3341|
|SA    |2008–09 |              1179|
|WA    |2008–09 |              1361|
|TAS   |2008–09 |               466|

