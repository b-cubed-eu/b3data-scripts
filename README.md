
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

![GitHub](https://img.shields.io/github/license/b-cubed-eu/b3data-scripts)
[![repo
status](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
![GitHub repo
size](https://img.shields.io/github/repo-size/b-cubed-eu/b3data-scripts)
<!-- badges: end -->

# Scripts used to create the frictionless b3data data package

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
This data package contains the data resources for the
[b3verse](https://docs.b-cubed.eu/guides/b3verse/). The data package
will be published on [Zenodo](https://zenodo.org/) from where the
datasets can be imported in R using the
[frictionless](https://docs.ropensci.org/frictionless/) R package.
<!-- description: end -->

This code is developed in context of **T5.5** of the [B-Cubed
project](https://b-cubed.eu/).

### b3data data package

The b3data data package is itself is available here (URL provided when
published). This data package contains the data resources for the
[b3verse](https://docs.b-cubed.eu/guides/b3verse/). It is created using
the [frictionless](https://docs.ropensci.org/frictionless/) R package
and can be imported using functions provided by that package.

``` r
library(frictionless)
```

The following datasets are included:

> comming soon

### Repo structure

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
