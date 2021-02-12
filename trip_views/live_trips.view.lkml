view: live_trips {
  sql_table_name: `looker-private-demo.traffic_events.liveTrips`
    ;;

  dimension: driver_safety_rating {
    type: number
    sql: ${TABLE}.driverSafetyRating ;;
  }

  dimension: predicted_brake_failure_estimate {
    type: number
    sql: ${TABLE}.predictedBrakeFailureEstimate ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.regionId ;;
  }

  dimension: trip_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.tripId ;;
  }

  dimension: vehicle_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.vehicleId ;;
  }

  measure: count {
    type: count
    drill_fields: [regions.id, trips.id, vehicles.id]
  }
}
