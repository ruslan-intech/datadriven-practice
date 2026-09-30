SELECT MEDIAN(null_pct) median_null_pct
FROM ml_features
WHERE dtype = 'float'
