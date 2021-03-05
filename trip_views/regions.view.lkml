view: regions {
  sql_table_name: `looker-private-demo.traffic_events.regions`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: boundary_lat_max {
    type: number
    sql: ${TABLE}.boundaryLatMax ;;
  }

  dimension: boundary_lat_min {
    type: number
    sql: ${TABLE}.boundaryLatMin ;;
  }

  dimension: boundary_lng_max {
    type: number
    sql: ${TABLE}.boundaryLngMax ;;
  }

  dimension: boundary_lng_min {
    type: number
    sql: ${TABLE}.boundaryLngMin ;;
  }

  dimension: center_lat {
    type: number
    sql: ${TABLE}.centerLat ;;
  }

  dimension: center_lng {
    type: number
    sql: ${TABLE}.centerLng ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      live_trips.count,
      drivers.count,
      locations.count,
      trips.count,
      vehicles.count
    ]
  }
}
