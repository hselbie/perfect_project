view: trip_stats {
  sql_table_name: `looker-private-demo.traffic_events.tripStats`
    ;;

  dimension: current_brake_wear_tear_score {
    type: number
    sql: ${TABLE}.currentBrakeWearTearScore ;;
  }

  dimension: current_trip_battery_health_score {
    type: number
    sql: ${TABLE}.currentTripBatteryHealthScore ;;
  }

  dimension: current_trip_hard_acceleration_score {
    type: number
    sql: ${TABLE}.currentTripHardAccelerationScore ;;
  }

  dimension: current_trip_harsh_cornering_score {
    type: number
    sql: ${TABLE}.currentTripHarshCorneringScore ;;
  }

  dimension: trip_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tripId ;;
  }

  measure: count {
    type: count
    drill_fields: [trips.id]
  }
}
