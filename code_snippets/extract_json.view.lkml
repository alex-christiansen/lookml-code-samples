## This is what the SQL should look like if you wrote it yourself
view: extract_json {
  derived_table: {
    sql:
      SELECT uuid, retailer_code,
       request_json,
       JSON_EXTRACT_SCALAR(meta, '$.sales_order_number') AS sales_order_number,
       JSON_EXTRACT_SCALAR(meta, '$.retailer_code') as retailer_code,
       JSON_EXTRACT_SCALAR(delivery_orders, '$.sales_order_line_number') AS sales_order_line_number,
       JSON_EXTRACT_SCALAR(delivery_orders, '$.tracking_number') AS tracking_number
    FROM `t8n-mvp.t8n_demo_realtime_enriched_ds.t8n_density_req_tbl`,
      UNNEST(JSON_EXTRACT_ARRAY(request_json,'$')) meta ,
      UNNEST(JSON_EXTRACT_ARRAY(meta,'$.delivery_orders')) delivery_orders
    WHERE JSON_EXTRACT_SCALAR(meta, '$.sales_order_number') = 'SO-1608635685DD-1001';;
  }
}
