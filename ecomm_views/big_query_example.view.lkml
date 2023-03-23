view: big_query_example {
  derived_table: {
    sql: SELECT
          (DATE(order_items.created_at )) AS order_items_created_date,
              (CASE WHEN order_items.returned_at IS NOT NULL  THEN 'Yes' ELSE 'No' END) AS order_items_is_returned,
          1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0)  AS order_items_item_gross_margin_percentage,
          (CASE
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 0.0 THEN '00'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 0.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 10.0 THEN '01'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 10.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 20.0 THEN '02'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 20.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 30.0 THEN '03'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 30.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 40.0 THEN '04'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 40.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 50.0 THEN '05'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 50.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 60.0 THEN '06'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 60.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 70.0 THEN '07'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 70.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 80.0 THEN '08'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 80.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 90.0 THEN '09'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 90.0 THEN '10'
      ELSE '11'
      END) AS order_items_item_gross_margin_percentage_tier__sort_,
          (CASE
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 0.0 THEN '(-inf,0.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 0.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 10.0 THEN '[0.0,10.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 10.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 20.0 THEN '[10.0,20.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 20.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 30.0 THEN '[20.0,30.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 30.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 40.0 THEN '[30.0,40.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 40.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 50.0 THEN '[40.0,50.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 50.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 60.0 THEN '[50.0,60.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 60.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 70.0 THEN '[60.0,70.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 70.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 80.0 THEN '[70.0,80.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 80.0 AND 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  < 90.0 THEN '[80.0,90.0)'
      WHEN 100*(1.0 * (order_items.sale_price - inventory_items.cost)/NULLIF(order_items.sale_price,0))  >= 90.0 THEN '[90.0,inf)'
      ELSE 'Undefined'
      END) AS order_items_item_gross_margin_percentage_tier,
          CASE
              WHEN EXTRACT(YEAR from order_items.created_at) = EXTRACT(YEAR from CURRENT_TIMESTAMP())
              AND order_items.created_at < CURRENT_TIMESTAMP()
              THEN 'This Year to Date'

              WHEN EXTRACT(YEAR from order_items.created_at) + 1 = EXTRACT(YEAR from CURRENT_TIMESTAMP())
              AND CAST(FORMAT_TIMESTAMP('%j', order_items.created_at) AS INT64) <= CAST(FORMAT_TIMESTAMP('%j', CURRENT_TIMESTAMP()) AS INT64)
              THEN 'Last Year to Date'

            END
              AS order_items_reporting_period,
          order_items.sale_price  AS order_items_sale_price,
          order_items.status  AS order_items_status,
          users.first_name  AS users_first_name,
              (DATE(users.created_at )) AS users_created_date,
          users.city  AS users_city,
          users.country  AS users_country,
          users.age  AS users_age,
          users.last_name  AS users_last_name,
          products.brand  AS products_brand,
          products.category  AS products_category,
          products.department  AS products_department,
          products.sku  AS products_sku,
          products.retail_price  AS products_retail_price,
          CAST(products.distribution_center_id AS int64) AS products_distribution_center_id,
          products.cost  AS products_cost,
          AVG(( CASE
              WHEN order_items.status = 'Processing' THEN TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), order_items.created_at, DAY)*1.0
              WHEN order_items.status IN ('Shipped', 'Complete', 'Returned') THEN TIMESTAMP_DIFF((CAST(order_items.shipped_at AS TIMESTAMP)), order_items.created_at, DAY)*1.0
              WHEN order_items.status = 'Cancelled' THEN NULL
            END
              ) ) AS order_items_average_days_to_process,
          AVG(( order_items.sale_price - inventory_items.cost  ) ) AS order_items_average_gross_margin
      FROM looker-private-demo.ecomm.order_items  AS order_items
      LEFT JOIN `looker-private-demo.ecomm.users`
           AS users ON order_items.user_id = users.id
      LEFT JOIN `looker-private-demo.ecomm.inventory_items`
           AS inventory_items ON order_items.inventory_item_id = inventory_items.id
      LEFT JOIN `looker-private-demo.ecomm.products`
           AS products ON inventory_items.product_id = products.id
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16,
          17,
          18,
          19,
          20,
          21
      ORDER BY
          1 DESC
      LIMIT 500
       ;;
  }

  dimension: order_items_status {
    type: string
    sql: ${TABLE}.order_items_status ;;
  }

  dimension: order_items_average_days_to_process {
    type: number
    sql: ${TABLE}.order_items_average_days_to_process ;;
  }
}
