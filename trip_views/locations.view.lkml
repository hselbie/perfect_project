view: locations {
  sql_table_name: `looker-private-demo.traffic_events.locations`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: center_lat {
    type: number
    sql: ${TABLE}.centerLat ;;
  }

  dimension: center_lng {
    type: number
    sql: ${TABLE}.centerLng ;;
  }

  dimension: is_distribution_center {
    type: string
    sql: ${TABLE}.isDistributionCenter ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.regionId ;;
  }

  measure: count {
    type: count
    drill_fields: [id, regions.id]
  }
}
