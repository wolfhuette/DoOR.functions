#' Find normalised receptor responses
#' 
#' given a chemical, get normalised receptor responses from all studies in the
#' database.
#' 
#' 
#' @param odors character vector; one or more odors provided as InChIKey.
#' @param zero InChIKey of background that should be set to zero. The default is "SFR", i.e. the spontaneous
#' firing rate.
#' @param responseMatrix a data frame; as e.g. "response.matrix" that is loaded
#' by \code{\link{modelRP}}. It is also possible to create this frame manually
#' using \code{\link{modelRP}}.
#' @seealso \code{\link{modelRP}},\code{\link{CreateDatabase}}
#' @export
#' @keywords data
#' @examples
#' 
#' library(DoOR.data)
#' odors <- c("MLFHJEHSLIIPHL-UHFFFAOYSA-N","OBNCKNCVKJNDBV-UHFFFAOYSA-N","IKHGUXGNUITLKF-UHFFFAOYSA-N")
#' data(response.matrix)
#' result <- getNormalizedResponses(odors, responseMatrix = response.matrix)
#' 
getNormalizedResponses <- function(odors, zero = default.val("zero"), responseMatrix = default.val("response.matrix")) {
  
  responseMatrix <- apply(responseMatrix, 2, function(x) resetSFR(x,x[zero]))
  
  mp  <- match(odors,rownames(responseMatrix))
  if(any(is.na(mp))) {
    stop(paste("The following odorants are not in the database: "), paste(odors[which(is.na(mp))], collapse = ", "))
  }
    
  res <- data.frame(ORs = rep(colnames(responseMatrix),each=length(odors)),
                    Odor = rep(odors,dim(responseMatrix)[2]),
                    Response = c(as.matrix(responseMatrix[mp,])))
  return(res)
}