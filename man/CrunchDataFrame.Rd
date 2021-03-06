% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crunch-data-frame.R
\name{CrunchDataFrame}
\alias{CrunchDataFrame}
\alias{dim.CrunchDataFrame}
\alias{names.CrunchDataFrame}
\alias{[.CrunchDataFrame}
\alias{[<-.CrunchDataFrame}
\alias{[[.CrunchDataFrame}
\alias{[[<-.CrunchDataFrame}
\alias{$.CrunchDataFrame}
\alias{$<-.CrunchDataFrame}
\title{CrunchDataFrame}
\usage{
\method{dim}{CrunchDataFrame}(x)

\method{names}{CrunchDataFrame}(x)

\method{[}{CrunchDataFrame}(x, i, j, drop = TRUE)

\method{[}{CrunchDataFrame}(x, i, j) <- value

\method{[[}{CrunchDataFrame}(x, i)

\method{[[}{CrunchDataFrame}(x, i) <- value

\method{$}{CrunchDataFrame}(x, i)

\method{$}{CrunchDataFrame}(x, i) <- value
}
\arguments{
\item{x}{a CrunchDataFrame}

\item{i}{indicators for rows (integers or logicals)}

\item{j}{indicators for columns (names, integers, or logicals)}

\item{drop}{logical. If \code{TRUE} the result is coerced to the lowest possible
dimension. The default is to drop if only one column is left, but not to drop
if only one row is left.}

\item{value}{value to place (or replace) in the CrunchDataFrame}
}
\description{
CrunchDataFrames are designed to mimic the ways that \code{\link{data.frame}}s are used.
They should be a drop-in replacement in many places where data.frames are used.
}
\details{
CrunchDataFrames are generated not by downloading all of the variables from
a dataset, but rather only the variables that are needed by subsequent
functions. So, if you create a CrunchDataFrame, and then run a linear model
using \code{lm()}, only the variables used by the linear model will be downloaded.

CrunchDataFrames can be altered (that is: adding more columns, removing
columns, subsetting rows, etc.) with the same \code{[}, \code{[[}, and \code{$} syntax as
data.frames.
}
