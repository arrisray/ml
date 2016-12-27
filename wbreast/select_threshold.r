select_threshold = function(y, p, num_steps = 10) {
  best_epsilon = 0
  best_f1 = 0
  
  step = (max(p) - min(p)) / num_steps
  for (epsilon in seq(min(p), max(p), step)) {
    predictions = p < epsilon
    
    tp = sum((predictions == 1) == (y == 1))
    fp = sum((predictions == 1) == (y == 0))
    fn = sum((predictions == 0) == (y == 1))
    
    prec = tp / (tp + fp);
    rec = tp / (tp + fn);
    
    f1 = (2 * prec * rec) / (prec + rec);
    
    if (f1 > best_f1) {
      best_f1 = f1;
      best_epsilon = epsilon;
    }
  }
  
  return (list(epsilon = best_epsilon, f1 = best_f1))
}