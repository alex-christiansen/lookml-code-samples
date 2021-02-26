view: union_cohorts {
  derived_table: {
    sql:
      SELECT
        year(ordereddate) as year
        ,sum(gross_sales) as total_sales
        ,count(distinct transaction_id) as count_transactions
        ,count(distinct customer_id) as count_customers
        ,'2012 to 2014' as cohort
      FROM dbo.FactSalesDetail
      WHERE year(ordereddate) IN (2012, 2013, 2014)
      GROUP BY year(ordereddate)
      UNION ALL
      SELECT
        year(ordereddate) as year
        ,sum(gross_sales) as total_sales
        ,count(distinct transaction_id) as count_transactions
        ,count(distinct customer_id) as count_customers
        ,'2013 to 2015' as cohort
      FROM dbo.FactSalesDetail
      WHERE year(ordereddate) IN (2013, 2014, 2015)
      GROUP BY year(ordereddate)
      ;;
}
  dimension: year {}
  dimension: total_sales {}
  dimension: count_transactions {}
  dimension: count_customers {}
  dimension: cohort {}
}
