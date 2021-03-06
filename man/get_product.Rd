% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_product.R
\name{get_product}
\alias{get_product}
\title{Looking Up Product Codes By Keywords}
\source{
Product descriptions consolidated from
\itemize{
  \item The U.S. Census Bureau <https://www.census.gov/>
  \item The U.S. Bureau of Labor Statistics <https://www.bls.gov/>
  \item UN Comtrade <https://comtrade.un.org/>
  \item UN Trade Statistics <https://unstats.un.org/unsd/trade/default.asp>
}
}
\usage{
get_product(pattern, origin, digits = 4, type = "regex", ignore.case = TRUE)
}
\arguments{
\item{pattern}{String pattern to look for. The function utilizes the function \code{stringr::str_detect} for pattern detection.}

\item{origin}{A string indicating one of the following industry/product classifications: "HS0" (1988/92), "HS1" (1996), "HS2" (2002), "HS3" (2007), "HS4" (2012), "HS5" (2017), "HS" (combined), "SITC1" (1950), "SITC2" (1974), "SITC3" (1985), "SITC4" (2006), "NAICS2002", "NAICS2007", "NAICS2012", "NAICS2017", "ISIC2" (1968), "ISIC3" (1989), "ISIC4" (2008), "BEC".}

\item{digits}{An integer indicating the preferred number of digits for output codes. The default is 4 digits. Allows 1 to 5-digit codes for the SITC classification; 2, 4, 6-digit codes for NAICS and HS classifications; 1 to 4-digit codes for the ISIC classification; 1 to 3-digit codes for the BEC classification.}

\item{type}{A string indicating the type of pattern interpretation. Three options are available: \code{regex}, \code{fixed}, and \code{coll}. The default interpretation is a regular expression. See ?str_detect for further details.}

\item{ignore.case}{If TRUE (by default), pattern dection will ignore case differences.}
}
\value{
A character vector of product codes that match user specified description patterns.
}
\description{
Returns product codes for which descriptions match user-specified keywords.
}
\examples{
# find manufacture-related NAICS codes
manu.vec <- get_product(pattern = "manu", origin = "NAICS2017", digits = 4,
                        type = "regex", ignore.case = TRUE)
manu.vec

# check product description
get_desc(manu.vec, origin = "NAICS2017")

# 6-digit outputs
get_product(pattern = "manu", origin = "NAICS2017", digits = 6,
            type = "regex", ignore.case = TRUE)

# choose different interpretation types
get_product(pattern = "manu", origin = "NAICS2017", digits = 4,
            type = "fixed", ignore.case = TRUE)
get_product(pattern = "manu", origin = "NAICS2017", digits = 4,
            type = "coll", ignore.case = TRUE)
}
