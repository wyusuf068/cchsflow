# cchsflow <img src="man/figures/logo.svg" align="right" alt="" width="180"/>

[![Lifecycle:
development](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

*cchsflow* supports the use of the Canadian Community Health Survey (CCHS) through common transformation of harmonized variables across survey cycles from 2001 to 2014. 

The CCHS is Canada's main population health survey. The survey is adminstered by Statistics Canada. Information about the survey can be found [here](http://www23.statcan.gc.ca/imdb/p2SV.pl?Function=getSurvey&SDDS=3226). The CCHS has a [Statistic Canada Open Licence](https://www.statcan.gc.ca/eng/reference/licence).

*cchsflow* package includes:

1. `variables.csv` - a list of variables that can be transformed across CCHS surveys.  
2. `variableDetails.csv` - information that describes how the variables are recoded.
3. Vignettes that describe how use R to transform or generate new derived variables that are listed in `variables.csv`. Transfomations are performed using `RecWTable()` from the `bllflow` R package. 
3. Codebooks (metadata documents) for the original CCHS surveys -- see [CCHS_DDI](https://github.com/Big-Life-Lab/cchsflow/tree/master/inst/extdata/CCHS_DDI) folder. The PDF and DDI documents are a resource to examine how variables change across survey cycles. 

This repository does not include the CCHS data. Information for how to access the CCHS data can be found [here](https://www150.statcan.gc.ca/n1/pub/82-620-m/2005001/4144189-eng.htm). Canadian university community can also access the CCHS through [Odesi](http://odesi2.scholarsportal.info/webview/) -- See health/Canada/Canadian Community Health Survey.

## Important notes

*Combining CCHS across survey cycles will result in misclassfication error and other forms of bias that affects studies in different ways.* The transformations that are described in this repository have been used in several research projects (see reference list) but no guarantees are made regarding the accuracy or appropriate uses.

Care must be taken by you to understand how specific variable transformation and harmonization with `cchsflow` affects your study or use of CCHS data. Across survey cycles, CCHS variables have had at least some change in wording and category responses. Furthermore, there have been changes in survey sampling, response rates, weighting methods and other survey design changes that affect responses. 

## Contributing

Please follow [this guide](CONTRIBUTING.md) if you would like to contribute to
the *cchsflow* package.

We encourage PRs for additional variable transformations and derived variables that you believe may be helpul to the broad CCHS community. 

Currently, *cchsflow* supports the use of `variables.csv` and `variableDetails.csv` with R. SAS, Stata and other statistical packages are commonly used by the CCHS community. Please feel free to contribute to `cchsflow` by making a PR that creates verions of `RecWTable()` for other statistical and programming languages.
