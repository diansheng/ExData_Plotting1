load <- function(){
  dataFile <- "household_power_consumption.txt"
  # skip 60k rows, read only 10k rows, to speed up and use less memory
  data <- read.table(dataFile, header=FALSE, sep=";",
                     skip=60000, nrows=10000,
                     stringsAsFactors=FALSE, dec=".")
  # add names
  h <- read.table(dataFile, header=TRUE, sep=";", nrows=1)
  header <- names(h)
  names(data) <- header
  # get the exact data required
  subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  return(subdata)
}
  