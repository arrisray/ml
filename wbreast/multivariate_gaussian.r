# See: https://bitbucket.org/nelsonmanohar/machinelearning/src/ad13b5e7538f6a7c5b973f71f8757d6dce70428e/KAGGLE_CLICKTHRU_40/anomaly_detection.R?at=master&fileviewer=file-view-default

library(RCurl)
script <- getURL("https://raw.githubusercontent.com/data-cleaning/lintools/master/pkg/R/pinv.R", ssl.verifypeer = FALSE)
eval(parse(text = script))

multivariate_gaussian = function(X, mu, sigma) {
  d = dim(X)
  m = d[1]
  n = length(mu)
  
  if (is.null(dim(sigma))) {
    sigma = diag(sigma)
  }
  
  rep_mu = rep.row(mu,m)
  diff = (X - rep_mu)
  
  p0 = ((2 * pi) ^ (n/2)) * (det(sigma) ^ 0.5)
  p1 = diff %*% pinv(sigma)
  p2 = p1 * diff
  p = (1/p0) * exp(-p2 * 0.5)
  p = rowSums(p)
  return(p)
}