view: vehicles {
  sql_table_name: `looker-private-demo.traffic_events.vehicles`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.regionId ;;
  }

  dimension_group: start_of_service {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.startOfService ;;
  }

  dimension: vehicle_type {
    type: string
    sql: ${TABLE}.vehicleType ;;
  }

  measure: count {
    type: count
    drill_fields: [id, regions.id, live_trips.count, trips.count]
  }
}
