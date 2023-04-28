view: trip_events {
  sql_table_name: `looker-private-demo.traffic_events.tripEvents`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: battery_voltage {
    type: number
    sql: ${TABLE}.batteryVoltage ;;
  }

  dimension: current_lat {
    type: number
    sql: ${TABLE}.currentLat ;;
  }

  dimension: current_lng {
    type: number
    sql: ${TABLE}.currentLng ;;
  }

  dimension: engine_temperature {
    type: number
    sql: ${TABLE}.engineTemperature ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.eventType ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: trip_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tripId ;;
  }

  dimension: vehicle_speed {
    type: number
    sql: ${TABLE}.vehicleSpeed ;;
  }

  measure: count {
    type: count
    drill_fields: [id, trips.id]
  }
}
