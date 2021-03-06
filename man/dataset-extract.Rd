% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset-extract.R
\docType{methods}
\name{dataset-extract}
\alias{dataset-extract}
\alias{[,CrunchDataset,ANY,ANY-method}
\alias{[,CrunchDataset,logical,missing-method}
\alias{[,CrunchDataset,character,ANY-method}
\alias{[,CrunchDataset,VariableGroup,ANY-method}
\alias{[,CrunchDataset,VariableOrder,ANY-method}
\alias{[,CrunchDataset,missing,ANY-method}
\alias{[,CrunchDataset,CrunchLogicalExpr,missing-method}
\alias{[,CrunchDataset,CrunchLogicalExpr,ANY-method}
\alias{subset,CrunchDataset-method}
\alias{[[,CrunchDataset,ANY-method}
\alias{[[,CrunchDataset,character-method}
\alias{$,CrunchDataset-method}
\title{Subset datasets and extract variables}
\usage{
\S4method{[}{CrunchDataset,ANY,ANY}(x, i, j, ..., drop = TRUE)

\S4method{[}{CrunchDataset,logical,missing}(x, i, j, ..., drop = FALSE)

\S4method{[}{CrunchDataset,character,ANY}(x, i, j, ..., drop = TRUE)

\S4method{[}{CrunchDataset,VariableGroup,ANY}(x, i, j, ..., drop = TRUE)

\S4method{[}{CrunchDataset,VariableOrder,ANY}(x, i, j, ..., drop = TRUE)

\S4method{[}{CrunchDataset,missing,ANY}(x, i, j, ..., drop = FALSE)

\S4method{[}{CrunchDataset,CrunchLogicalExpr,missing}(x, i, j, ...,
  drop = FALSE)

\S4method{[}{CrunchDataset,CrunchLogicalExpr,ANY}(x, i, j, ..., drop = FALSE)

\S4method{subset}{CrunchDataset}(x, ...)

\S4method{[[}{CrunchDataset,ANY}(x, i, ..., drop = FALSE)

\S4method{[[}{CrunchDataset,character}(x, i, ..., drop = FALSE)

\S4method{$}{CrunchDataset}(x, name)
}
\arguments{
\item{x}{a CrunchDataset}

\item{i}{As with a \code{data.frame}, there are two cases:
\enumerate{
\item if no other arguments are supplied (i.e \code{x[i]}, \code{i} provides for
\code{as.list} extraction: columns of the dataset rather than rows. If
character, identifies variables to extract based on their aliases (by
default: set \code{options(crunch.namekey.dataset="name")} to use variable
names); if numeric or logical, extracts variables accordingly.
\item If \code{j} is specified as either \code{x[i, j]} or \code{x[i,]}), \code{i} is an object of class
\code{CrunchLogicalExpr} that will define a subset of rows.
}}

\item{j}{columnar extraction, as described above}

\item{...}{additional arguments}

\item{drop}{logical: automatically simplify a 1-column Dataset to a Variable?
Default is FALSE, and the TRUE option is in fact not implemented.}

\item{name}{columnar extraction for \code{$}}
}
\value{
\code{[} yields a Dataset; \code{[[} and \code{$} return a Variable
}
\description{
Subset datasets and extract variables
}
