
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scenarioSelector <a href='https://github.com/2DegreesInvesting/r2dii.usethis'><img src='https://imgur.com/A5ASZPE.png' align='right' height='43' /></a>

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/scenarioSelector)](https://CRAN.R-project.org/package=scenarioSelector)
[![R-CMD-check](https://github.com/2DegreesInvesting/scenarioSelector/workflows/R-CMD-check/badge.svg)](https://github.com/2DegreesInvesting/scenarioSelector/actions)
[![Codecov test
coverage](https://codecov.io/gh/2DegreesInvesting/scenarioSelector/branch/master/graph/badge.svg)](https://codecov.io/gh/2DegreesInvesting/scenarioSelector?branch=master)
<!-- badges: end -->

The goal of the scenarioSelector
[app](https://twodii.shinyapps.io/scenarioSelector/) is to help you find
and visualize a scenario.

## Installation

Install the development version of scenarioSelector from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("2DegreesInvesting/scenarioSelector")
```

## Example

``` r
if (interactive()) {
  scenarioSelector::run_app()
}
```

## Need

We are questioning the need of this tool, based on grant proposals and
reports (cc’ Léonie Ségala).

## Related work

This tool was attempted and abandoned twice before:

-   The first attempt
    ([CapitalMarketsPlatform](https://github.com/2DegreesInvesting/CapitalMarketsPlatform),
    [cc’ `@pranavpandya84`](https://github.com/pranavpandya84)) was
    retired because it doesn’t seem to work (the questions seems to not
    filter the data).

-   The second attempt
    ([r2dii.scenario.selector](https://github.com/2DegreesInvesting/r2dii.scenario.selector),
    [cc’ `@jdhoffa`](https://github.com/jdhoffa)) is a lighter version
    of the fist one – built from the top down. It was also retired
    because it inherited the bugs of the first one, and still has
    complexity that makes it hard to debug.

## Criteria to select scenarios

The first attempt to build this tool
([CapitalMarketsPlatform](https://github.com/2DegreesInvesting/CapitalMarketsPlatform))
includes a number of questions, as a criteria to pick relevant
scenarios. Now we may either try to (a) implement those original
questions, or (b) develop new questions.

I suspect developing new questions will be easiest:

-   The relevant grants seem to not commit to any specific question.
-   The original questions
    -   seem not obviously useful or updated, and
    -   may be hard to translate into criteria to pick scenarios.
-   The new questions
    -   could be develop to be easy to implement, and
    -   could be developed to be clearly useful with minimal input from
        analysts.
