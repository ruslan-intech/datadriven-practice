SELECT DISTINCT
  metric_value
FROM employee_metrics
QUALIFY ROW_NUMBER() OVER(ORDER BY metric_value DESC) < 6
