gather_2 <- function(col_index, n_cols, data, colnames){

  if(length(colnames) != n_cols){
    stop("Number of column names is not equal to number of coluns to gather!")
  } else {
  cols <- data[1:nrow(data), col_index:(col_index+n_cols-1)]
  colnames(cols) <- colnames
  cols}
}
