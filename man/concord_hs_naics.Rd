% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/concord_hs_naics.R
\name{concord_hs_naics}
\alias{concord_hs_naics}
\title{Converting HS and NAICS Codes}
\source{
HS-NAICS concordance tables between 1989 and 2017 from Pierce and Schott (2009, 2018) <https://faculty.som.yale.edu/peterschott/international-trade-data/>.
}
\usage{
concord_hs_naics(sourcevar, origin, destination, dest.digit = 6, all = FALSE)
}
\arguments{
\item{sourcevar}{An input character vector of HS or NAICS codes. The function accepts 2, 4, 6-digit codes for HS and NAICS.}

\item{origin}{A string setting the input industry classification: "HS" (combined), "HS0" (1988/92), "HS1" (1996), "HS2" (2002), "HS3" (2007), "HS4" (2012), "HS5" (2017), "NAICS2002", "NAICS2007", "NAICS2012", "NAICS2017", "NAICS" (combined).}

\item{destination}{A string setting the output industry classification: "HS" (combined), "HS0" (1988/92), "HS1" (1996), "HS2" (2002), "HS3" (2007), "HS4" (2012), "HS5" (2017), "NAICS2002", "NAICS2007", "NAICS2012", "NAICS2017", "NAICS" (combined).}

\item{dest.digit}{An integer indicating the preferred number of digits for output codes. Allows 2, 4, or 6 digits for HS and NAICS. The default is 6 digits.}

\item{all}{Either TRUE or FALSE. If TRUE, the function will return (1) all matched outputs for each input, and (2) the share of occurrences for each matched output among all matched outputs. Users can use the shares as weights for more precise concordances. If FALSE, the function will only return the matched output with the largest share of occurrences (the mode match). If the mode consists of multiple matches, the function will return the first matched output.}
}
\value{
The matched output(s) for each element of the input vector. Either a list object when all = TRUE or a character vector when all = FALSE.
}
\description{
Concords Harmonized System codes (HS0, HS1, HS2, HS3, HS4, HS5, HS combined) to and from North American Industry Classification System codes (NAICS2002, NAICS2007, NAICS2012, NAICS2017, NAICS combined).
}
\note{
Always include leading zeros in codes (e.g., use HS code 010110 instead of 10110)---results may be buggy otherwise.
}
\examples{
## HS combined to NAICS
# one input: one-to-one match
concord_hs_naics(sourcevar = "120600",
                 origin = "HS", destination = "NAICS",
                 all = FALSE)
concord_hs_naics(sourcevar = "120600",
                 origin = "HS", destination = "NAICS",
                 all = TRUE)

# two inputs: multiple-to-one match
concord_hs_naics(sourcevar = c("120600", "120400"),
                 origin = "HS", destination = "NAICS",
                 all = FALSE)
concord_hs_naics(sourcevar = c("120600", "120400"),
                 origin = "HS", destination = "NAICS",
                 all = TRUE)

# two inputs: repeated
concord_hs_naics(sourcevar = c("120600", "120600"),
                 origin = "HS", destination = "NAICS",
                 all = FALSE)

# one to multiple matches
concord_hs_naics(sourcevar = c("120600", "854690"),
                 origin = "HS", destination = "NAICS",
                 all = TRUE)

# if no match, will return NA and give warning message
concord_hs_naics(sourcevar = c("120600", "120800"),
                 origin = "HS", destination = "NAICS",
                 all = FALSE)

# 4-digit inputs
concord_hs_naics(sourcevar = c("1206", "8546"),
                 origin = "HS", destination = "NAICS",
                 all = TRUE)

# 4-digit outputs
concord_hs_naics(sourcevar = c("120600", "854690"),
                 origin = "HS", destination = "NAICS",
                 dest.digit = 4, all = TRUE)

## HS5 to NAICS
concord_hs_naics(sourcevar = c("1206", "8546"),
                 origin = "HS5", destination = "NAICS",
                 all = TRUE)

concord_hs_naics(sourcevar = c("120600", "854690"),
                 origin = "HS5", destination = "NAICS",
                 dest.digit = 4, all = TRUE)

## NAICS to HS
concord_hs_naics(sourcevar = c("1111", "3271"),
                 origin = "NAICS", destination = "HS",
                 all = TRUE)

concord_hs_naics(sourcevar = c("111120", "326199"),
                 origin = "NAICS", destination = "HS",
                 dest.digit = 4, all = TRUE)
}
