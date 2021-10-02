view: trips {
  sql_table_name: `looker-private-demo.traffic_events.trips`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: current_trip_battery_health_score {
    type: number
    sql: ${TABLE}.currentTripBatteryHealthScore ;;
  }

  dimension: current_trip_brake_wear_score {
    type: number
    sql: ${TABLE}.currentTripBrakeWearScore ;;
  }

  dimension: current_trip_harsh_acceleration_score {
    type: number
    sql: ${TABLE}.currentTripHarshAccelerationScore ;;
  }

  dimension: current_trip_harsh_cornering_score {
    type: number
    sql: ${TABLE}.currentTripHarshCorneringScore ;;
  }

  dimension: driver_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.driverId ;;
  }

  dimension_group: expected_end {
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
    sql: ${TABLE}.expectedEndTime ;;
  }

  dimension: load_weight {
    type: number
    sql: ${TABLE}.loadWeight ;;
  }

  dimension: location_end_id {
    type: number
    sql: ${TABLE}.locationEndId ;;
  }

  dimension: location_start_id {
    type: number
    sql: ${TABLE}.locationStartId ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.regionId ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.startTime ;;
  }

  dimension: tire_pressure_rating_pre_trip {
    type: number
    sql: ${TABLE}.tirePressureRatingPreTrip ;;
  }

  dimension: total_trips {
    type: number
    sql: ${TABLE}.totalTrips ;;
  }

  dimension: vehicle_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.vehicleId ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      drivers.last_name,
      drivers.first_name,
      drivers.id,
      regions.id,
      vehicles.id,
      live_trips.count,
      trip_stats.count,
      trip_events.count
    ]
  }
}
