explore: marketing_channel_performance {
  label: "Marketing Channel Performance"
  always_filter: {
    filters: [marketing_channel_performance.date_date: "7 days ago for 7 days"]
  }
  sql_always_where: _TABLE_SUFFIX BETWEEN FORMAT_DATE("%Y%m%d",{%
    date_start marketing_channel_performance.date_date %}) AND
    FORMAT_DATE("%Y%m%d",{% date_end    marketing_channel_performance.date_date %})  ;;
}

view: marketing_channel_performance {
  sql_table_name: `marketing_performance.marketing_channel_performance_*`
    ;;
}
