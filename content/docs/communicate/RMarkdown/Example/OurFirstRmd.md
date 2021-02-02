---
title: "My Report"
author: "Hugh Mann"
date: "04/08/2019"
output: html_document
subtitle: Why R Markdown is Awesome
editor_options:
  chunk_output_type: inline
header-includes:
  - \usepackage{"pdf_styles"}
---



# My First Report

I'm using R Markdown for the first time, and I'm writing my own report!

# Including code

## Parabola code

Look at all the cool code I can include in R Markdown!


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
```

<div class="figure">
<img src="/docs/communicate/RMarkdown/Example/OurFirstRmd_files/figure-html/myCode-1.png" alt="A nice parabola!" width="672" />
<p class="caption">Figure 1: A nice parabola!</p>
</div>

# How much I love using R Markdown

Loads! R Markdown is such a versatile format that I can make pretty much any document I want. I use it for all my reports, I use it to present my graphs, I even use it to make slideshow presentations. Yes sir, R Markdown is the only report generating software I use anymore!

# Main Heading

## Sub-heading

### Sub-sub-heading

#### Sub-sub-sub-heading

##### Sub-sub-sub-sub-heading

###### Sub-sub-sub-sub-sub-heading

Regular font!


# R Markdown {.tabset .tabset-dropdown}

## Why is it so cool?

Because it can produce a huge variety of amazing documents!

## Is there anything cooler?

No!


# R Markdown text options

**Bold text**  
__Also bold text__  
*Italicised text*  
~~Strikethrough~~  
Super^script^  
`Code font`  

- Bullet point 1
- Bullet point 2
- Bullet point 3
    - Sub-bullet (a)
    - Sub-bullet (b)
    
1. Numbered list 1
1. Numbered list 2
1. Numbered list 3


\*\*Not bold text\*\*  
\*Not italicised text\*  

# Other Languages


```html
<div class="row">
  <div class="col-md-6">
    Hello
  </div>
  <div class="col-md-6">
    World!
  </div>
</div>
```


```latex
\usepackage{my_package}
% latex
```


```markdown
# Example Heading

Here is an example of some text I could put in R Markdown. My **italics** and *bold* won't display in a code chunk!
```
