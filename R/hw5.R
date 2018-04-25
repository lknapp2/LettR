letter<-function(x){
  a.letter<-sample(letters,1)
  return(a.letter)
}


times<-function(iters=100000){
  library(parallel)
  start1<-Sys.time()
  for(i in 1:iters) letter()
  end1<-Sys.time()
  
  no_cores<-detectCores()-1
  c1<-makeCluster(no_cores)
  start2<-Sys.time()
  parLapply(c1,1:iters,letter)
  end2<-Sys.time()
  stopCluster(c1)
  
  print(paste("For non-parallel computing, selecting", iters, "letters:"))
  print(end1-start1)
  print(paste("For parallel computing, selecting", iters, "letters:"))
  print(end2-start2)
}