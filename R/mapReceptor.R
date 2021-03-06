#' mapReceptor
#' 
#' Identifying the source of unknown response data by correlating it agains all
#' DoOR responding units.
#' 
#' 
#' @param data data frame, containing two columns, one called "odorants" and one
#'   "responses" providing InChIKeys and odorant responses respectively.
#' @param response_matrix output is a numeric vector that contains the Pearson 
#'   Correlation Coefficient between given data and selected consensus data in
#' @param nshow numeric, if defined, only this number of results will be
#'   returned response matrix
#' @author Shouwen Ma <\email{shouwen.ma@@uni-konstanz.de}>
#' @author Daniel Münch <\email{daniel.muench@@uni-konstanz.de}>
#' @export
#' @examples 
#'   loadData()
#'   data <- data.frame(odorants  = Or22a$InChIKey,
#'                      responses = Or22a$Hallem.2004.EN)
#'   data <- na.omit(data)
#'   mapReceptor(data = data)
mapReceptor <- function(data, 
                        response_matrix = default.val("response.matrix"),
                        nshow) {
  data$odorants   <- as.character(data$odorants)
  res             <- data.frame()
  response_matrix <- response_matrix[match(data$odorants, rownames(response_matrix)),]
  
  # remove n < 3
  n <- which(apply(!is.na(response_matrix), 2, sum) < 3)
  message(paste("skipped ", paste(names(response_matrix)[n], collapse = ", "), " as overlap (n) was < 3", sep=""))
  
  response_matrix <- response_matrix[ , -n]
  
  result <- apply(response_matrix, 2, function(x) cor.test(x, data$responses))
  
  result <- data.frame(responding.unit = names(result),
                       n               = apply(!is.na(response_matrix), 2, sum),
                       cor             = unlist(sapply(result, "[","estimate")),
                       p.value         = unlist(sapply(result, "[","p.value")))
  
  result <- result[order(result$cor, decreasing = T),]
  
  if(!missing(nshow))
    result <- result[1:nshow, ]
  
  return(result)
}
