
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

![GitHub](https://img.shields.io/github/license/b-cubed-eu/b3data-scripts)
[![Release](https://img.shields.io/github/release/b-cubed-eu/b3data-scripts.svg)](https://github.com/b-cubed-eu/b3data-scripts/releases)
[![repo
status](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
![GitHub repo
size](https://img.shields.io/github/repo-size/b-cubed-eu/b3data-scripts)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15190796.svg)](https://doi.org/10.5281/zenodo.15190796)
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
[b3verse](https://docs.b-cubed.eu/guides/b3verse/) and is published on
[Zenodo](https://doi.org/10.5281/zenodo.15181097).
<!-- description: end -->

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
- **Published at**:
  [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15181097.svg)](https://doi.org/10.5281/zenodo.15181097)
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

The content of the data package can be consulted using `read_package()`.

``` r
b3data_package <- read_package("https://zenodo.org/records/15181098/files/datapackage.json")
b3data_package
#> A Data Package with 2 resources:
#> • bird_cube_belgium_mgrs10
#> • mgrs10_refgrid_belgium
#> For more information, see <https://doi.org/10.5281/zenodo.15181098>.
#> Use `unclass()` to print the Data Package as a list.
```

### Step 3 — Import a resource (dataset)

Tabular datasets can be loaded using `read_resource()`.

``` r
bird_cube_belgium <- read_resource(b3data_package, "bird_cube_belgium_mgrs10")
head(bird_cube_belgium)
#> # A tibble: 6 × 8
#>    year mgrscode specieskey species          family     n mincoordinateuncerta…¹
#>   <dbl> <chr>         <dbl> <chr>            <chr>  <dbl>                  <dbl>
#> 1  2000 31UDS65     2473958 Perdix perdix    Phasi…     1                   3536
#> 2  2000 31UDS65     2474156 Coturnix coturn… Phasi…     1                   3536
#> 3  2000 31UDS65     2474377 Fulica atra      Ralli…     5                   1000
#> 4  2000 31UDS65     2475443 Merops apiaster  Merop…     6                   1000
#> 5  2000 31UDS65     2480242 Vanellus vanell… Chara…     1                   3536
#> 6  2000 31UDS65     2480637 Accipiter nisus  Accip…     1                   3536
#> # ℹ abbreviated name: ¹​mincoordinateuncertaintyinmeters
#> # ℹ 1 more variable: familycount <dbl>
```

For non-tabular resources (e.g. spatial or raster data), use packages
like `sf` or `terra` directly.

``` r
mgrs10_belgium <- sf::st_read(
  "https://zenodo.org/records/15181098/files/mgrs10_refgrid_belgium.gpkg",
  quiet = TRUE)
head(mgrs10_belgium)
#> Simple feature collection with 6 features and 1 field
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 13919.31 ymin: 159175.7 xmax: 34107.28 ymax: 209553.2
#> Geodetic CRS:  WGS 84
#>   mgrscode                       geometry
#> 1  31UDS65 POLYGON ((23939.64 190365.5...
#> 2  31UDS66 POLYGON ((24123.5 200367.5,...
#> 3  31UDS72 POLYGON ((33389.37 160175.9...
#> 4  31UDS73 POLYGON ((33573.52 170177.6...
#> 5  31UDS74 POLYGON ((33757.62 180179.5...
#> 6  31UDS75 POLYGON ((33941.67 190181.5...
```

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
