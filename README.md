
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scenarioSelector <a href='https://github.com/2DegreesInvesting/r2dii.usethis'><img src='https://imgur.com/A5ASZPE.png' align='right' height='43' /></a>

**DEPRECATED**

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/scenarioSelector)](https://CRAN.R-project.org/package=scenarioSelector)
[![R-CMD-check](https://github.com/2DegreesInvesting/scenarioSelector/workflows/R-CMD-check/badge.svg)](https://github.com/2DegreesInvesting/scenarioSelector/actions)
[![Codecov test
coverage](https://codecov.io/gh/2DegreesInvesting/scenarioSelector/branch/master/graph/badge.svg)](https://codecov.io/gh/2DegreesInvesting/scenarioSelector?branch=master)
<!-- badges: end -->

The scenarioSelector app helps you find and visualize a scenario. You
can use it [online](https://twodii.shinyapps.io/scenarioSelector/) or as
an R package following the installation and example below.

## Installation

Install the development version of scenarioSelector from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("2DegreesInvesting/scenarioSelector")
```

## Example

Use the scenarioSelector package with:

``` r
library(scenarioSelector)
```

You can run the app with:

``` r
if (interactive()) {
  run_app()
}
```

The tidy data is available with:

``` r
scenarios
#> # A tibble: 56,680 × 12
#>    scenario model is_net0 is_2dii region  year sector technology target variable
#>    <chr>    <chr> <lgl>   <lgl>   <chr>  <dbl> <chr>  <chr>      <chr>  <chr>   
#>  1 etp_2017 2ds   FALSE   TRUE    global  2020 autom… electric   produ… smsp    
#>  2 etp_2017 2ds   FALSE   TRUE    global  2020 autom… electric   produ… tmsr    
#>  3 etp_2017 2ds   FALSE   TRUE    global  2020 autom… hybrid     produ… smsp    
#>  4 etp_2017 2ds   FALSE   TRUE    global  2020 autom… hybrid     produ… tmsr    
#>  5 etp_2017 2ds   FALSE   TRUE    global  2020 autom… ice        produ… smsp    
#>  6 etp_2017 2ds   FALSE   TRUE    global  2020 autom… ice        produ… tmsr    
#>  7 etp_2017 2ds   FALSE   TRUE    global  2021 autom… electric   produ… smsp    
#>  8 etp_2017 2ds   FALSE   TRUE    global  2021 autom… electric   produ… tmsr    
#>  9 etp_2017 2ds   FALSE   TRUE    global  2021 autom… hybrid     produ… smsp    
#> 10 etp_2017 2ds   FALSE   TRUE    global  2021 autom… hybrid     produ… tmsr    
#> # … with 56,670 more rows, and 2 more variables: value <dbl>, unit <chr>
```

To track the source of the data see
[data-raw/](https://github.com/2DegreesInvesting/scenarioSelector/tree/master/data-raw).

## Discussion

For a discussion including related work see the channel
[`# scenario-selector-tool`](https://2investinginitiative.slack.com/archives/C025YFS5UTA)
on 2DII’s (private) Slack or [ADO
\#552](https://dev.azure.com/2DegreesInvesting/2DegreesInvesting/_workitems/edit/552).

## Learning shiny

This app is small but implements some big ideas I learned from
[Mastering Shiny, by Hadley Wickham](https://mastering-shiny.org/):

-   [Packages](https://mastering-shiny.org/scaling-packaging.html)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/DESCRIPTION)).
-   [Shiny modules](https://mastering-shiny.org/scaling-modules.html)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/R/scenario.R)).
-   [Testing
    reactivity](https://mastering-shiny.org/scaling-testing.html#testing-reactivity)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/tests/testthat/test-scenario.R)).
-   [UI as
    data](https://mastering-shiny.org/scaling-functions.html#ui-as-data)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/R/select_column.R)).
-   [Server
    functions](https://mastering-shiny.org/scaling-functions.html#server-functions)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/R/plot_scenarios.R)).
-   [Hierarchical select
    boxes](https://mastering-shiny.org/action-dynamic.html#hierarchical-select)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/R/scenario.R)).
-   [Plots](https://mastering-shiny.org/basic-ui.html#plots)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/R/utils.R)).
-   [Themes](https://mastering-shiny.org/action-layout.html#themes)
    ([code](https://github.com/2DegreesInvesting/scenarioSelector/blob/master/R/theme_2dii.R)).
