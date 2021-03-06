% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/exportData.R
\name{exportData}
\alias{exportData}
\title{export data}
\usage{
exportData(file.format, directory, odorantReceptors = default.val("ORs"),
  response_matrix = default.val("response.matrix"),
  responseRange = default.val("response.range"),
  unglobalNorm_RM = default.val("response.matrix_non.normalized"),
  weightGlobNorm = default.val("weight.globNorm"), all.data = TRUE)
}
\arguments{
\item{file.format}{character string; the format of given file, either ".txt"
or ".csv"}

\item{directory}{character string; naming a directory for writing. If
missing, the exported data are saved in current working directory.}

\item{odorantReceptors}{data frame; receptor names and expressions}

\item{response_matrix}{data matrix; an global unnormalized responses matrix}

\item{responseRange}{data frame; response ranges for each study}

\item{unglobalNorm_RM}{data matrix; an unnormalized responses matrix}

\item{weightGlobNorm}{data frame; weight matrix for global normalizazion}

\item{all.data}{logical; if TRUE, export odorant response data and supported
data "response.matrix", "response.range", "response.matrix_non.normalized",
"response.matrix", "weight.globNorm" and "ORs".}
}
\description{
export odor response data and supported data
}
\details{
Please load ORs from data package DoOR.data by typing (\code{data(ORs)})
before use.
}
\examples{
\dontrun{
library(DoOR.data)
library(DoOR.functions)
loadData()
exportData(".txt", all.data = FALSE) 	# export odorant responses data only
}
}
\author{
Shouwen Ma <\email{shouwen.ma@uni-konstanz.de}>
}
\keyword{data}

