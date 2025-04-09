
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

![GitHub](https://img.shields.io/github/license/b-cubed-eu/b3data-scripts)
[![repo
status](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
![GitHub repo
size](https://img.shields.io/github/repo-size/b-cubed-eu/b3data-scripts)
<!-- badges: end -->

# Scripts used to create the b3data frictionless data package

[Langeraert, Ward![ORCID
logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0002-5900-8109)[^1][^2][^3]
[Van Daele, Toon![ORCID
logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0002-1362-853X)[^4][^5]
Research Institute for Nature and Forest (INBO)[^6] European Union’s
Horizon Europe Research and Innovation Programme (ID No 101059592)[^7]

**keywords**: data package; b3verse; frictionless; data cubes

<!-- community: b3 -->
<!-- community: inbo -->
<!-- description: start -->

This repository contains scripts to create the b3data
[frictionless](https://docs.ropensci.org/frictionless/) data package.
This data package includes data resources used across the
[b3verse](https://docs.b-cubed.eu/guides/b3verse/) and will be published
on [Zenodo](https://zenodo.org/). <!-- description: end -->

This code is developed in context of **T5.5** of the [B-Cubed
project](https://b-cubed.eu/).

## Order of execution

Follow the steps below to run the scripts in a logical order.

**1.** `create_b3data_package.Rmd`

- creates the data package
- adds tabular resources
- writes data package

**2.** `add_spatial_resources.Rmd`

- loads data package
- adds spatial resources
- writes data package

## 📦 The `b3data` data package

- **Name**: `b3data`
- **Published at**: [Zenodo](https://zenodo.org/) (DOI to be reserved)
- **Used in**: [b3verse](https://docs.b-cubed.eu/guides/b3verse/)
- **Importable in R via**:
  [frictionless](https://docs.ropensci.org/frictionless/) R package

Resources can be imported in R like this:

### Step 1 — Load the frictionless R package

``` r
# install.packages("frictionless")
library(frictionless)
```

### Step 2 — Read the package descriptor from Zenodo

> This example uses a placeholder data package; replace with the final
> URL when ready.

``` r
b3data_package <- read_package("https://zenodo.org/records/10053702/files/datapackage.json")
b3data_package
#> A Data Package with 3 resources:
#> • reference-data
#> • gps
#> • acceleration
#> For more information, see <https://doi.org/10.5281/zenodo.10053702>.
#> Use `unclass()` to print the Data Package as a list.
```

### Step 3 — Import a resource (dataset)

Tabular datasets can be loaded using `read_resource()`.

``` r
gps <- read_resource(b3data_package, "gps")
head(gps)
#> # A tibble: 6 × 21
#>    `event-id` visible timestamp           `location-long` `location-lat`
#>         <dbl> <lgl>   <dttm>                        <dbl>          <dbl>
#> 1 14256075762 TRUE    2018-05-25 16:11:37            4.25           51.3
#> 2 14256075763 TRUE    2018-05-25 16:16:41            4.25           51.3
#> 3 14256075764 TRUE    2018-05-25 16:21:29            4.25           51.3
#> 4 14256075765 TRUE    2018-05-25 16:26:28            4.25           51.3
#> 5 14256075766 TRUE    2018-05-25 16:31:21            4.25           51.3
#> 6 14256075767 TRUE    2018-05-25 16:36:09            4.25           51.3
#> # ℹ 16 more variables: `bar:barometric-pressure` <dbl>,
#> #   `external-temperature` <dbl>, `gps:dop` <dbl>, `gps:satellite-count` <dbl>,
#> #   `gps-time-to-fix` <dbl>, `ground-speed` <dbl>, heading <dbl>,
#> #   `height-above-msl` <dbl>, `location-error-numerical` <dbl>,
#> #   `manually-marked-outlier` <lgl>, `vertical-error-numerical` <dbl>,
#> #   `sensor-type` <chr>, `individual-taxon-canonical-name` <chr>,
#> #   `tag-local-identifier` <chr>, `individual-local-identifier` <chr>, …
```

For non-tabular resources (e.g. spatial or raster data), use packages
like `sf` or `terra`.

> Example coming soon.

## 📁 Repository structure

    ├── source                         ├ R markdown files
    │   └── R                          ├ R scripts
    ├── data
    │   ├── raw                        ├ create this folder and store raw data
    │   ├── processed                  ├ store processed data
    │   └── b3data_package             ├ b3data frictionless data package
    ├── checklist.yml                  ├ options checklist package (https://github.com/inbo/checklist)
    ├── organisation.yml               ├ organisation info (https://inbo.github.io/checklist/articles/organisation.html)
    ├── inst
    │   └── en_gb.dic                  ├ dictionary with words that should not be checked by the checklist package
    ├── .github                        │ 
    │   ├── workflows                  │ 
    │   │   └── checklist_project.yml  ├ GitHub action settings
    │   ├── CODE_OF_CONDUCT.md         │ 
    │   └── CONTRIBUTING.md            │
    ├── b3data-scripts.Rproj           ├ R project
    ├── README.md                      ├ project description
    ├── LICENSE.md                     ├ license
    ├── CITATION.cff                   ├ citation info
    ├── .zenodo.json                   ├ zenodo metadata
    └── .gitignore                     ├ files to ignore

[^1]: author

[^2]: contact person

[^3]: Research Institute for Nature and Forest (INBO), Herman
    Teirlinckgebouw, Havenlaan 88 PO Box 73, B-1000 Brussels, Belgium

[^4]: author

[^5]: Research Institute for Nature and Forest (INBO), Herman
    Teirlinckgebouw, Havenlaan 88 PO Box 73, B-1000 Brussels, Belgium

[^6]: copyright holder

[^7]: funder
