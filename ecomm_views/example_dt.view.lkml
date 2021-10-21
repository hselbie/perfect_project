view: example_dt {
  derived_table: {
    sql: SELECT*
      FROM looker-private-demo.ecomm.order_items


       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: order_items_created_date {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: order_items_id {
    type: number
    sql: ${TABLE}.order_items_id ;;
  }

  dimension: order_items_status {
    type: string
    sql: ${TABLE}.order_items_status ;;
  }

  dimension: order_items_user_id {
    type: number
    sql: ${TABLE}.order_items_user_id ;;
  }

  dimension: order_items_shipping_time {
    type: number
    sql: ${TABLE}.order_items_shipping_time ;;
  }

  dimension: order_items_sale_price {
    type: number
    sql: ${TABLE}.order_items_sale_price ;;
  }

  dimension: inventory_items_product_department {
    type: string
    sql: ${TABLE}.inventory_items_product_department ;;
  }

  dimension: inventory_items_product_brand {
    type: string
    sql: ${TABLE}.inventory_items_product_brand ;;
  }

  dimension: inventory_items_product_distribution_center_id {
    type: number
    sql: ${TABLE}.inventory_items_product_distribution_center_id ;;
  }

  dimension: order_items_average_days_to_process {
    type: number
    sql: ${TABLE}.order_items_average_days_to_process ;;
  }

  dimension: order_items_average_gross_margin {
    type: number
    sql: ${TABLE}.order_items_average_gross_margin ;;
  }

  dimension: order_items_average_sale_price {
    type: number
    sql: ${TABLE}.order_items_average_sale_price ;;
  }

  dimension: order_items_average_shipping_time {
    type: number
    sql: ${TABLE}.order_items_average_shipping_time ;;
  }

  dimension: order_items_average_spend_per_user {
    type: number
    sql: ${TABLE}.order_items_average_spend_per_user ;;
  }

  dimension: order_items_median_sale_price {
    type: number
    sql: ${TABLE}.order_items_median_sale_price ;;
  }

  dimension: order_items_return_rate {
    type: number
    sql: ${TABLE}.order_items_return_rate ;;
  }

  dimension: order_items_returned_total_sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: order_items_returned_count {
    type: number
    sql: ${TABLE}.order_items_returned_count ;;
  }

  dimension: order_items_total_gross_margin {
    type: number
    sql: ${TABLE}.order_items_total_gross_margin ;;
  }

  dimension: order_items_total_gross_margin_percentage {
    type: number
    sql: ${TABLE}.order_items_total_gross_margin_percentage ;;
  }

  measure: order_items_total_sale_price {
    type: sum
    sql: ${TABLE}.sale_price ;;
  }

  set: detail {
    fields: [
      order_items_id,
      order_items_status,
      order_items_user_id,
      order_items_shipping_time,
      order_items_sale_price,
      inventory_items_product_department,
      inventory_items_product_brand,
      inventory_items_product_distribution_center_id,
      order_items_average_days_to_process,
      order_items_average_gross_margin,
      order_items_average_sale_price,
      order_items_average_shipping_time,
      order_items_average_spend_per_user,
      order_items_median_sale_price,
      order_items_return_rate,
      order_items_returned_total_sale_price,
      order_items_returned_count,
      order_items_total_gross_margin,
      order_items_total_gross_margin_percentage,
      order_items_total_sale_price
    ]
  }
}
