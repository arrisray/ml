rep.row = function(x,n){
  matrix(rep(x,each=n),nrow=n)
}

rep.col = function(x,n){
  matrix(rep(x,each=n), ncol=n, byrow=TRUE)
}

estimate_gaussian = function(X) {
  d = dim(X)
  m = d[1]
  n = d[2]
  
  mu = colMeans(X)
  rep_mu = rep.row(mu,m)
  diff_sq = (X - rep_mu)^2
  sigma = colSums(diff_sq) / m
    
  return(list(mu = mu, sigma = sigma))
}