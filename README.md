
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7

<!-- badges: start -->
<!-- badges: end -->

The goal of Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7 is to provide dbSNP
Chromosome Reports’ data in data frame format. The information made
available by this package is the one found in
<ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606_b149_GRCh38p7/>.

## Installation

Because I use [Git LFS](https://git-lfs.github.com/) to track some of
the files in this R package, you will need to have [Git
LFS](https://git-lfs.github.com/) installed before installing this
package. You can check if you have Git LFS already installed by running:

``` bash
git lfs version
```

It should return Git LFS’s version if installed, or a Git error:
`git: 'lfs' is not a git command. See 'git --help'.`

If you don’t have it installed already, and if you are on Ubuntu, you
can install it with:

``` bash
sudo apt-get update -y
sudo apt-get install -y git-lfs
```

Then, because of issues
[\#192](https://github.com/r-lib/remotes/issues/292),
[\#91584](https://community.rstudio.com/t/cant-access-data-in-a-package-that-i-created/91584),
[\#889](https://github.com/r-lib/devtools/issues/889), you need to clone
this repository first and then install from the local folder generated
on your computer:

``` bash
# This will clone the repository to your home folder.
cd ~
git clone https://github.com/maialab/Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7
```

And finally install Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7 from the local
folder (assuming it’s in your home folder):

``` r
# install.packages("remotes")
remotes::install_local("~/Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7")
```

If the installation went successful, you may remove the local folder
`~/Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7` (or other path if you cloned to
another folder):

``` bash
rm -rf ~/Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7
```

## Usage

The package contains only one function which is `read_chr_rpt`. Browse
this function help page (`?read_chr_rpt`) to know how to use it:

``` r
library(Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7)

chrom_Y <- read_chr_rpt('Y')

chrom_Y[1:10, 1:4]
#>    snp_id mapweight snp_type chr_hits
#> 1    3894         2        0        1
#> 2    3895         2        0        1
#> 3    3896         2        0        1
#> 4    3897         2        0        1
#> 5    3898         2        0        1
#> 6    3899         2        0        1
#> 7    3900         2        0        1
#> 8    3901         2        0        1
#> 9    3902         2        0        1
#> 10   3903         2        0        1
```
