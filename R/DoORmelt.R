# DoORmelt
#
# prepare odor response data for plotting via ggplot2
#
# @param data data frame containing either subsets of response.matrix or identifier and data columns (e.g. Or22a)
# @param ident chemical identifier, if empty rownames of data will be used
# @param datasets column names of data sets to use, important when using response data (e.g. Or22a); if empty all columns will be used
# @param na.rm should NAs be removed
#
# @return "long" data frame for plotting with ggplot2
# @author Daniel Münch <\email{daniel.muench@@uni-konstanz.de}>
# @examples
# library(DoOR.data)
# data(Or22a)
# data(response.matrix)
# head(DoORmelt(Or22a, datasets = c("Hallem.2004.WT", "Pelz.2006.AntEC50")))
# head(DoORmelt(response.matrix[1:100,], na.rm = TRUE))
#
DoORmelt <- function(data, datasets, ident, na.rm = FALSE) {
  if(missing(datasets))
    datasets = colnames(data)

  if(missing(ident)) {
    data$odorant <- rownames(data)
    ident <- "odorant"
  }

  result <- data.frame()
  for (i in 1:length(datasets)) {
    tmp <- data.frame(odorant = data[,ident], dataset = datasets[i], value = data[,datasets[i]])
    result <- rbind(result, tmp)
  }

  if(na.rm == TRUE)
    result <- na.omit(result)

  return(result)
}
