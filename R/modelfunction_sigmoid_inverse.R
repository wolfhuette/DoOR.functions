# inverse Logistic Model
# 
# inverse Logistic Model
# 
# expression : xmid - scal * log((Asym / input) - 1)
# 
# @param input numeric vector of data values
# @param parms numeric vector; parameters with given names: "Asym", "xmid",
# "scal"
# @seealso \code{\link{SSlogis}}
# @references Jose Pinheiro and Douglas Bates
# @keywords math
# @examples
# 
# x <- seq(0.1,1,length=20)
# y <- modelfunction_sigmoid_inverse(input = x, parms = c(Asym = 2, xmid = 0.2, scal = 0.3) )
# plot(x,y)
# 
modelfunction_sigmoid_inverse <-
function(input, parms)

# part of the DoOR package: (c) 2009 C. Giovanni Galizia, Daniel Muench, Martin Strauch, Anja Nissler, Shouwen Ma
# Neurobiology, University of Konstanz, Germany

## inverse Logistic Model

# input : numeric vector of data values
# parms : numeric vector; parameters with given names: "Asym", "xmid", "scal"

## expression : xmid - scal * log((Asym / input) - 1)
## reference and author(s) : Jose Pinheiro and Douglas Bates

{
	subfun <- function(input) 
	{
		exp1  <- (parms["Asym"] / input) - 1
		if (exp1[1] <= 0 | is.na(exp1[1]))
		{ 
			return(NA)
		}
		else 
		{
			return(parms["xmid"] - parms["scal"] * log((parms["Asym"] / input) - 1))
		}
	}
		return(as.vector(sapply(input, subfun)))
}
